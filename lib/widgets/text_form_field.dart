import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marquis_v2/widgets/ui_widgets.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final bool obscureText;
  final Function onTextChanged;
  final bool? hasError;
  final bool? isFocusable;
  final String? hintText;
  final String? errorMessage;
  final TextInputType? textInputType;
  final TextEditingController? controller;

  const CustomTextFormField(
      {super.key,
      required this.label,
      required this.onTextChanged,
      this.obscureText = false,
      this.textInputType,
      this.hasError = false,
      this.isFocusable,
      this.controller,
      this.hintText,
      this.errorMessage});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          verticalSpace(4.0),
          SizedBox(
            height: 41,
            child: TextFormField(
              focusNode: _focusNode,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              controller: widget.controller,
              canRequestFocus: widget.isFocusable ?? true,
              keyboardType: widget.textInputType,
              obscureText: widget.obscureText,
              onChanged: (val) => widget.onTextChanged(val),
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                contentPadding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                hintText: widget.hintText,
                hintStyle: const TextStyle(color: Color(0Xff8E8E8E)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Color(0xff0f1118), width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Color(0xff0f1118), width: 1),
                ),
                focusedBorder: widget.hasError == true
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: Color(0xff8B0F10), width: 1),
                      )
                    : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
                      ),
                filled: true,
                fillColor: const Color(0xff363D43),
              ),
              cursorColor: Colors.grey,
            ),
          ),
          Visibility(
            visible: widget.hasError ?? false,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0XffFF1F1F),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/svg/caution_icon.svg"),
                    horizontalSpace(4.0),
                    Text(widget.errorMessage ?? ''),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
