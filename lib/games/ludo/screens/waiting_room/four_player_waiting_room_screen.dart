// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gal/gal.dart';
import 'package:marquis_v2/games/ludo/components/string_validation.dart';
import 'package:marquis_v2/games/ludo/ludo_game_controller.dart';
import 'package:marquis_v2/games/ludo/ludo_session.dart';
import 'package:marquis_v2/games/ludo/models/ludo_session.dart';
import 'package:marquis_v2/games/ludo/widgets/angled_border_button.dart';
import 'package:marquis_v2/games/ludo/widgets/chevron_border.dart';
import 'package:marquis_v2/games/ludo/widgets/divider_shape.dart';
import 'package:marquis_v2/models/enums.dart';
import 'package:marquis_v2/services/snackbar_service.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class FourPlayerWaitingRoomScreen extends ConsumerStatefulWidget {
  const FourPlayerWaitingRoomScreen({super.key, required this.game});
  final LudoGameController game;

  @override
  ConsumerState<FourPlayerWaitingRoomScreen> createState() => _FourPlayerWaitingRoomScreenState();
}

class _FourPlayerWaitingRoomScreenState extends ConsumerState<FourPlayerWaitingRoomScreen> {
  Timer? _countdownTimer;
  int _countdown = 15;

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }

  void _startCountdown() {
    _countdown = 15;
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          _countdownTimer?.cancel();
          widget.game.playState = PlayState.playing;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(ludoSessionProvider);
    if (_isRoomFull(session) && _countdownTimer == null) _startCountdown();
    return Scaffold(
      backgroundColor: Colors.black,
      body: session == null
          ? const Center(child: Text('No Data'))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _waitingRoomTopBar(widget.game),
                const SizedBox(height: 76),
                _roomID(session),
                // const SizedBox(height: 20),
                // _starkTonMenu(),
                const SizedBox(height: 32),
                _players(),
                const SizedBox(height: 20),
                _playesrDetailsList(session),
                const Spacer(),
                _bottom(session),
                const SizedBox(height: 62),
              ],
            ),
    );
  }

  Widget _bottom(LudoSessionData session) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: AngledBorderButton(
        onTap: _isRoomFull(session) ? () => widget.game.playState = PlayState.playing : null,
        child: Text(
          _isRoomFull(session)
              ? _countdownTimer == null
                  ? 'Start Game'
                  : 'Starting in $_countdown'
              : 'Waiting for players',
          style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _playesrDetailsList(LudoSessionData session) {
    log("${session.getListOfColors}");
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int i = 0; i < session.sessionUserStatus.length; i++)
            playerAvatarCard(
              session,
              index: i,
              size: 72,
              isSelf: false,
              player: session.sessionUserStatus[i],
              color: session.getListOfColors[i],
              showText: true,
            ),
        ],
      ),
    );
  }

  Widget playerAvatarCard(
    LudoSessionData session, {
    required int index,
    required double size,
    required bool isSelf,
    required LudoSessionUserStatus player,
    required Color color,
    bool showText = true,
  }) {
    return Column(
      children: [
        player.status == "ACTIVE"
            ? Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: color, // Background color
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 2,
                    color: const Color(0XFF00ECFF),
                  ),
                ),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: ClipRect(
                    child: Align(
                      alignment: index == 1
                          ? Alignment.topLeft
                          : index == 2
                              ? Alignment.topRight
                              : index == 3
                                  ? Alignment.bottomLeft
                                  : Alignment.bottomRight,
                      widthFactor: 0.5,
                      heightFactor: 0.5,
                      child: Image.asset(
                        'assets/images/avatar_spritesheet.png',
                        width: 4324,
                        height: 4324,
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 33),
                child: _invitePlayer(session),
              ),
        // : Column(
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.only(top: 33),
        //         child: Container(
        //           width: 72,
        //           height: 72,
        //           decoration: BoxDecoration(
        //             color: Colors.transparent,
        //             borderRadius: BorderRadius.circular(15),
        //             border: Border.all(
        //               width: 2,
        //               color: const Color(0XFF00ECFF),
        //             ),
        //           ),
        //           child: Padding(
        //             padding: const EdgeInsets.all(14.0),
        //             child: SvgPicture.asset(
        //               'assets/svg/invite.svg',
        //               width: 15,
        //               height: 15,
        //             ),
        //           ),
        //         ),
        //       ),
        //       const SizedBox(height: 10),
        //       Container(
        //         height: 24,
        //         width: 74,
        //         decoration: BoxDecoration(
        //             color: const Color(0XFF00ECFF),
        //             borderRadius: BorderRadius.circular(5)),
        //         child: const Center(
        //           child: Text(
        //             'Invite',
        //             style: TextStyle(
        //               fontSize: 14,
        //               color: Colors.black,
        //               fontWeight: FontWeight.w600,
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        if (showText) const SizedBox(height: 10),
        Text(
          player.email.split("@").first.truncate(6),
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Future<Uint8List> _buildShareImage(LudoSessionData session) async {
    final Widget shareWidget = Directionality(
      textDirection: ui.TextDirection.ltr,
      child: SizedBox(
        width: 800,
        height: 418,
        child: Stack(
          children: [
            Image.asset('assets/images/share_waiting_room_bg.png', fit: BoxFit.cover),
            Column(
              children: [
                const SizedBox(height: 80),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Join Ludo Now!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    "Room ID: ${session.id}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(width: 96),
                      ...List.generate(
                        4,
                        (index) => Container(
                          width: 108,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              playerAvatarCard(
                                session,
                                index: index,
                                size: 72,
                                isSelf: false,
                                player: session.sessionUserStatus[index],
                                color: session.getListOfColors[index],
                                showText: false,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    return await createImageFromWidget(shareWidget, logicalSize: const Size(800, 418));
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

  Widget _invitePlayer(LudoSessionData session) {
    final snackBarService = SnackbarService();
    return GestureDetector(
      onTap: () async {
        final imageBytes = await _buildShareImage(session);
        final qrImageBytes = await _buildQrImage(session);
        if (!context.mounted) return;
        showDialog(
          useRootNavigator: false,
          barrierColor: Colors.black.withAlpha(220),
          context: context,
          builder: (ctx) => Dialog(
            backgroundColor: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.memory(imageBytes),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    // mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 36,
                            width: 36,
                            child: IconButton.filled(
                              color: Colors.white,
                              iconSize: 20,
                              onPressed: () async {
                                final tweetText = 'Join my Ludo Session\nRoom Id: ${session.id}';
                                final url = 'https://themarquis.xyz/ludo?roomid=${session.id}';

                                // Use the Twitter app's URL scheme
                                final tweetUrl = Uri.encodeFull('twitter://post?message=$tweetText\n$url\ndata:image/png;base64,${base64Encode(imageBytes)}');

                                // Fallback to web URL if the app isn't installed
                                final webTweetUrl = Uri.encodeFull(
                                    'https://x.com/intent/tweet?text=$tweetText&url=$url&via=themarquisxyz&image=data:image/png;base64,${base64Encode(imageBytes)}');
                                if (await canLaunchUrl(Uri.parse(tweetUrl))) {
                                  await launchUrl(Uri.parse(tweetUrl));
                                } else {
                                  await launchUrl(Uri.parse(webTweetUrl));
                                }
                              },
                              icon: const Icon(FontAwesomeIcons.xTwitter),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "X",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 36,
                            width: 36,
                            child: IconButton.filled(
                              iconSize: 20,
                              color: Colors.white,
                              onPressed: () async {
                                Clipboard.setData(ClipboardData(text: "https://themarquis.xyz/ludo?roomid=${session.id}"));
                                if (!context.mounted) return;
                                snackBarService.displaySnackbar('Link Copied to Clipboard');
                              },
                              icon: const Icon(FontAwesomeIcons.link),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Copy Link",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 36,
                            width: 36,
                            child: IconButton.filled(
                              iconSize: 20,
                              color: Colors.white,
                              onPressed: () async {
                                await Gal.putImageBytes(qrImageBytes);
                                if (!context.mounted) return;
                                snackBarService.displaySnackbar('Image successfully saved to gallery');
                              },
                              icon: const Icon(Icons.qr_code),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Download QR",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 36,
                            width: 36,
                            child: IconButton.filled(
                              iconSize: 20,
                              color: Colors.white,
                              onPressed: () {
                                Share.shareXFiles([XFile.fromData(imageBytes, mimeType: 'image/png')],
                                    subject: 'Ludo Invite', text: 'I am playing Ludo, please join us!', fileNameOverrides: ['share.png']);
                              },
                              icon: const Icon(Icons.share),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Share",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            height: 72,
            width: 72,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: 2,
                color: const Color(0XFF00ECFF),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: SvgPicture.asset(
                'assets/svg/invite.svg',
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 24,
            width: 74,
            decoration: BoxDecoration(color: const Color(0XFF00ECFF), borderRadius: BorderRadius.circular(5)),
            child: const Center(
              child: Text(
                'Invite',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<Uint8List> _buildQrImage(LudoSessionData session) async {
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
                        "Game: Ludo",
                        style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "Room ID: ${session.id}",
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
                      data: "https://themarquis.xyz/ludo?roomid=${session.id}",
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
  }

  Widget _players() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _gradientContainer(),
          const Divider(
            thickness: 2,
            color: Color(0XFF00ECFF),
            height: 2,
          ),
        ],
      ),
    );
  }

  Widget _gradientContainer() {
    return Container(
      height: 28,
      width: 110,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF00ECFF),
        ),
        gradient: RadialGradient(colors: [Colors.transparent, Color(0xFF00ECFF).withOpacity(0.9)], radius: 1.7),
      ),
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        width: 130,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF00ECFF).withOpacity(0.6),
              Colors.transparent,
              Color(0xFF00ECFF).withOpacity(0.6),
            ],
            stops: [0.05, 0.4, 1],
          ),
        ),
        alignment: Alignment.center,
        child: const Text(
          'Players',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ),
    );
  }

  Widget _roomID(session) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Room ID',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 30,
          width: 97,
          color: Colors.grey.withOpacity(0.3),
          child: Center(
            child: Text(
              session.id.toString(),
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _waitingRoomTopBar(LudoGameController game) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(right: 10, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigator.pop(context);
                  game.playState = PlayState.welcome;
                },
                child: Container(
                  decoration: ShapeDecoration(color: Colors.white, shape: ChevronBorder()),
                  padding: const EdgeInsets.only(top: 2, left: 8, bottom: 1, right: 31),
                  child: const Text('MENU', style: TextStyle(color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 10,
          decoration: const ShapeDecoration(
            color: Color(0xFF00ECFF),
            shape: DividerShape(
              Color(0xFF00ECFF),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: const Text(
            "wAITING ROOM",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  bool _isRoomFull(LudoSessionData? session) {
    return session != null && session.sessionUserStatus.where((e) => e.status == "ACTIVE").length == 4;
  }
}
