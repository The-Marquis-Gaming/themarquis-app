import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marquis_v2/providers/app_state.dart';
import 'package:marquis_v2/services/snackbar_service.dart';
import 'package:marquis_v2/widgets/error_dialog.dart';

class AuthDialog extends ConsumerStatefulWidget {
  const AuthDialog({super.key});

  @override
  ConsumerState<AuthDialog> createState() => _AuthDialogState();
}

class _AuthDialogState extends ConsumerState<AuthDialog> {
  final _emailController = TextEditingController();
  final _refCodeController = TextEditingController();
  final _inputKey = GlobalKey<FormFieldState>();
  String? _emailError;
  String? _refCodeError;
  bool _isLoading = false;
  bool _isSignUp = false;

  @override
  void dispose() {
    _refCodeController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return AlertDialog(
      content: Container(
        width: deviceSize.aspectRatio > 1 ? deviceSize.width * 0.5 : deviceSize.width * 0.85,
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                key: _inputKey,
                decoration: InputDecoration(label: const Text("Email"), errorText: _emailError),
                inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r" "))],
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Invalid Email";
                  }

                  if (!value.contains(RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'))) {
                    return "Invalid Email";
                  }
                  return null;
                },
                onChanged: (value) {
                  _emailController.text = _emailController.text.toLowerCase();
                },
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 100),
              alignment: Alignment.centerRight,
              child: Offstage(
                offstage: !_isSignUp,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(label: const Text("Referral Code"), errorText: _refCodeError),
                    controller: _refCodeController,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z0-9]"))],
                    onChanged: (value) {
                      _refCodeController.text = _refCodeController.text.toUpperCase();
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : Column(
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              width: 1.8,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.5),
                            ),
                          ),
                          onPressed: () async {
                            if (!_inputKey.currentState!.validate()) return;
                            setState(() {
                              _isLoading = true;
                            });
                            if (_isSignUp) {
                              if (_emailController.text != "" && _refCodeController.text != "") {
                                try {
                                  if (!_emailController.text.endsWith('@test.com')) {
                                    await ref.read(appStateProvider.notifier).signup(_emailController.text.trim(), _refCodeController.text.trim());
                                  }
                                  if (!context.mounted) return;
                                  await showDialog<String>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) => OTPDialog(
                                      email: _emailController.text,
                                      isSignUp: true,
                                    ),
                                  );
                                  if (!context.mounted) return;
                                  Navigator.of(context).pop();
                                } catch (e) {
                                  showErrorDialog(e.toString(), context);
                                }
                              }
                              //sign up
                            } else {
                              //login
                              if (_emailController.text != "") {
                                try {
                                  if (!_emailController.text.endsWith('@test.com')) {
                                    await ref.read(appStateProvider.notifier).login(_emailController.text.trim());
                                  }
                                  if (!context.mounted) return;
                                  await showDialog<String>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) => OTPDialog(
                                      email: _emailController.text,
                                      isSignUp: false,
                                    ),
                                  );
                                  if (context.mounted) Navigator.of(context).pop();
                                } catch (e) {
                                  if (context.mounted) showErrorDialog(e.toString(), context);
                                }
                              }
                            }

                            setState(() {
                              _isLoading = false;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _isSignUp ? 'Sign Up' : 'Login',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _isSignUp = !_isSignUp;
                            });
                          },
                          child: Text(
                            _isSignUp ? "Back to Login" : "Sign Up",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}

class OTPDialog extends ConsumerStatefulWidget {
  const OTPDialog({super.key, required this.email, required this.isSignUp});
  final String email;
  final bool isSignUp;

  @override
  ConsumerState<OTPDialog> createState() => _OTPDialogState();
}

class _OTPDialogState extends ConsumerState<OTPDialog> {
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  bool _isLoading = false;

  // Add this getter to combine the OTP digits
  String get _otp => _controllers.map((controller) => controller.text).join();

  @override
  void initState() {
    super.initState();
    // Request focus for the first digit input after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNodes[0].requestFocus();
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onOTPDigitChanged(int index) {
    if (_controllers[index].text.length == 1) {
      if (index < 3) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
        _submitOTP();
      }
    }
  }

  void _submitOTP() {
    if (_otp.length == 4) {
      _verifyOTP();
    }
  }

  Future<void> _verifyOTP() async {
    final snackBarService = SnackbarService();
    setState(() {
      _isLoading = true;
    });
    final appState = ref.read(appStateProvider.notifier);
    try {
      if (widget.email.endsWith('@test.com')) {
        if (widget.isSignUp) {
          await appState.signupSandbox(widget.email.trim());
        } else {
          await appState.loginSandbox(widget.email.trim());
        }
      } else {
        await appState.verifyCode(widget.email.trim(), _otp);
      }
      if (mounted) Navigator.of(context).pop(_otp);
    } catch (e) {
      if (!mounted) return;
      if (e.toString().contains('Invalid')) {
        snackBarService.displaySnackbar('Invalid OTP. Please try again.');
      } else {
        snackBarService.displaySnackbar('An error occurred. Please try again.');
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Enter OTP'),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          4,
          (index) => SizedBox(
            width: 50,
            child: TextField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              decoration: const InputDecoration(
                counterText: '',
                border: OutlineInputBorder(),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: (_) => _onOTPDigitChanged(index),
            ),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(onPressed: Navigator.of(context).pop, child: const Text('Cancel')),
        _isLoading ? const CircularProgressIndicator() : TextButton(onPressed: _submitOTP, child: const Text('Submit')),
      ],
    );
  }
}
