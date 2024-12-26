import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gal/gal.dart';
import 'package:marquis_v2/dialog/auth_dialog.dart';
import 'package:marquis_v2/models/user.dart';
import 'package:marquis_v2/providers/app_state.dart';
import 'package:marquis_v2/providers/user.dart';
import 'package:marquis_v2/router/route_path.dart';
import 'package:marquis_v2/services/snackbar_service.dart';
import 'package:marquis_v2/widgets/profile_item.dart';
import 'package:marquis_v2/widgets/ui_widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/referral_field.dart';

class ProfilePath extends AppRoutePath {
  @override
  String getRouteInformation() {
    return '/profile';
  }
}

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: user == null
            ? Center(
                child: OutlinedButton(
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
                    showDialog(context: context,useRootNavigator: false, builder: (ctx) => const AuthDialog());
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Edit profile',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w900),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          elevation: 8.0,
                          color: const Color(0xff212329),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(36),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const CircleAvatar(
                                      radius: 50,
                                      backgroundImage: AssetImage('assets/images/avatar.png'), // Add your avatar image in assets folder
                                      backgroundColor: Colors.transparent,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        user.email,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Card(
                          elevation: 8.0,
                          color: const Color(0xff212329),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset('assets/svg/wallet_icon.svg'),
                                    ),
                                    const Text('Wallet Address'),
                                  ],
                                ),
                                ReferralField(
                                  label: '',
                                  value: user.accountAddress,
                                )
                              ],
                            ),
                          )),
                    ),
                    ProfileItem(
                        icon: SvgPicture.asset('assets/svg/invite_friend.svg'),
                        title: 'Invite Friend',
                        onTap: () {
                          showDialog(
                            context: context,
                            useRootNavigator: false,
                            builder: (context) => InviteFriendDialog(user: user),
                          );
                        }),
                    verticalSpace(8.0),
                    ProfileItem(
                      icon: const Icon(Icons.help_outline_rounded),
                      title: 'Help and Support',
                      onTap: () {
                        showDialog(
                          context: context,
                          useRootNavigator: false,
                          builder: (context) => const AlertDialog(
                            title: Text('Help and Support'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Contact us at support@marquis.com"),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    verticalSpace(8.0),
                    ProfileItem(
                      icon: Icon(
                        Icons.logout,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      title: 'Log Out',
                      textColor: Theme.of(context).colorScheme.primary,
                      onTap: () {
                        ref.read(appStateProvider.notifier).logout();
                      },
                    ),
                    verticalSpace(8.0),
                    ProfileItem(
                      icon: SvgPicture.asset('assets/svg/trash_icon.svg'),
                      title: 'Delete Account',
                      textColor: Colors.red,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class InviteFriendDialog extends StatefulWidget {
  const InviteFriendDialog({
    super.key,
    required this.user,
  });

  final UserData user;

  @override
  State<InviteFriendDialog> createState() => _InviteFriendDialogState();
}

class _InviteFriendDialogState extends State<InviteFriendDialog> {
  final _snackBarService = SnackbarService();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF1E1E1E),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Invite Friend To Sign Up',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            QrImageView(
              data: "https://themarquis.xyz/signup?referralcode=${widget.user.referralCode}",
              size: 150,
              backgroundColor: Colors.white,
            ),
            const SizedBox(height: 20),
            ReferralField(
              label: 'Referral Code',
              value: widget.user.referralCode,
            ),
            const SizedBox(height: 10),
            ReferralField(label: 'Referral Link', value: 'https://themarquis.xyz/signup?referralcode=${widget.user.referralCode}'),
            const SizedBox(height: 18),
            FutureBuilder<Uint8List>(future: () async {
              final image = await createImageFromWidget(
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: SizedBox(
                    width: 500,
                    height: 500,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/share_referral_bg.png',
                          fit: BoxFit.cover,
                        ),
                        Center(
                          child: Column(
                            children: [
                              const SizedBox(height: 80),
                              const Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Text(
                                  "The Marquis",
                                  style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Referral Code: ${widget.user.referralCode}",
                                  style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),
                              QrImageView(
                                backgroundColor: Colors.transparent,
                                eyeStyle: const QrEyeStyle(
                                  color: Colors.white,
                                  eyeShape: QrEyeShape.square,
                                ),
                                dataModuleStyle: const QrDataModuleStyle(
                                  dataModuleShape: QrDataModuleShape.square,
                                  color: Colors.white,
                                ),
                                data: "https://themarquis.xyz/signup?referralcode=${widget.user.referralCode}",
                                size: 250,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                logicalSize: const Size(500, 500),
              );
              return image;
            }(), builder: (context, snapshot) {
              return snapshot.connectionState == ConnectionState.waiting
                  ? const CircularProgressIndicator()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildActionButton(FontAwesomeIcons.xTwitter, 'X', () async {
                            // Prepare the tweet text
                            final tweetText = 'Join TheMarquis with my referral code: ${widget.user.referralCode}';
                            final url = 'https://themarquis.xyz/signup?referralcode=${widget.user.referralCode}';

                            // Use the Twitter app's URL scheme
                            final tweetUrl = Uri.encodeFull('twitter://post?message=$tweetText\n$url');

                            // Fallback to web URL if the app isn't installed
                            final webTweetUrl = Uri.encodeFull('https://x.com/intent/tweet?text=$tweetText&url=$url&via=themarquisxyz');

                            try {
                              await launchUrl(Uri.parse(tweetUrl));
                            } catch (e) {
                              await launchUrl(Uri.parse(webTweetUrl));
                            }
                          }),
                          _buildActionButton(Icons.link, 'Copy Link', () {
                            Clipboard.setData(ClipboardData(text: 'https://themarquis.xyz/signup?referralcode=${widget.user.referralCode}'));
                            _snackBarService.displaySnackbar('Copied to clipboard');
                          }),
                          _buildActionButton(Icons.photo_outlined, 'Save image', () async {
                            await Gal.putImageBytes(snapshot.data!);
                            if (!context.mounted) return;
                            _snackBarService.displaySnackbar('Saved to device');
                          }),
                          _buildActionButton(Icons.share, 'Share', () async {
                            final image = await rootBundle.load('assets/images/share_banner.png');
                            // showDialog(
                            //     context: context,
                            //     useRootNavigator: false,
                            //     builder: (context) => AlertDialog(
                            //         content: Image.memory(snapshot.data!)));
                            // final image = snapshot.data!;
                            Share.shareXFiles([XFile.fromData(image.buffer.asUint8List(), mimeType: 'image/png', name: 'qr_code.png')],
                                subject: 'TheMarquis Referral Code',
                                text:
                                    'Join TheMarquis with my referral code: ${widget.user.referralCode}\nhttps://themarquis.xyz/signup?referralcode=${widget.user.referralCode}');
                          }),
                        ],
                      ),
                    );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, VoidCallback onPressed) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF2A2A2A),
            ),
            child: Icon(icon, color: Colors.white),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }

  Future<Uint8List> createImageFromWidget(Widget widget, {Duration? wait, Size? logicalSize}) async {
    final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();
    final view = PlatformDispatcher.instance.views.first;
    logicalSize ??= view.physicalSize / view.devicePixelRatio;

    final RenderView renderView = RenderView(
      view: view,
      child: RenderPositionedBox(alignment: Alignment.center, child: repaintBoundary),
      configuration: ViewConfiguration(
        logicalConstraints: BoxConstraints(maxWidth: logicalSize.width, maxHeight: logicalSize.height),
        devicePixelRatio: 1.0,
      ),
    );

    final PipelineOwner pipelineOwner = PipelineOwner();
    final BuildOwner buildOwner = BuildOwner(focusManager: FocusManager());

    pipelineOwner.rootNode = renderView;
    renderView.prepareInitialFrame();

    final RenderObjectToWidgetElement<RenderBox> rootElement = RenderObjectToWidgetAdapter<RenderBox>(
      container: repaintBoundary,
      child: widget,
    ).attachToRenderTree(buildOwner);

    buildOwner.buildScope(rootElement);

    if (wait != null) {
      await Future.delayed(wait);
    }

    buildOwner.buildScope(rootElement);
    buildOwner.finalizeTree();

    pipelineOwner.flushLayout();
    pipelineOwner.flushCompositingBits();
    pipelineOwner.flushPaint();

    final ui.Image image = await repaintBoundary.toImage();
    final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    return Uint8List.view(byteData!.buffer);
  }
}
