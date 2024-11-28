import 'dart:async';
import 'dart:convert';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gal/gal.dart';
import 'package:marquis_v2/games/ludo/components/cut_edge_container.dart';
import 'package:marquis_v2/games/ludo/ludo_game.dart';
import 'package:marquis_v2/games/ludo/ludo_session.dart';
import 'package:marquis_v2/games/ludo/models/ludo_session.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class FourPlayerWaitingRoomScreen extends ConsumerStatefulWidget {
  const FourPlayerWaitingRoomScreen({super.key, required this.game});
  final LudoGame game;

  @override
  ConsumerState<FourPlayerWaitingRoomScreen> createState() =>
      _FourPlayerWaitingRoomScreenState();
}

class _FourPlayerWaitingRoomScreenState
    extends ConsumerState<FourPlayerWaitingRoomScreen> {
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
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: session == null
          ? const Center(child: Text('No Data'))
          : Transform.scale(
              scale: widget.game.height / deviceSize.height,
              alignment: Alignment.topLeft,
              child: SizedBox(
                width:
                    deviceSize.height * widget.game.width / widget.game.height,
                height: deviceSize.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _waitingRoomTopBar(),
                    const SizedBox(height: 59),
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
              ),
            ),
    );
  }

  Widget _bottom(LudoSessionData session) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: _isRoomFull(session)
            ? () {
                widget.game.playState = PlayState.playing;
              }
            : null,
        child: IconButton(
          onPressed: () {},
          disabledColor: Colors.grey,
          icon: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Center(
                child: SvgPicture.asset("assets/svg/ludo_elevated_button.svg"),
              ),
              Center(
                child: Text(
                  _isRoomFull(session)
                      ? _countdownTimer == null
                          ? 'Start Game'
                          : 'Starting in $_countdown'
                      : 'Waiting for players',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _playesrDetailsList(LudoSessionData session) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          playerAvatarCard(
            index: 0,
            size: 85,
            isSelf: false,
            player: session.sessionUserStatus[0],
            color: session.getListOfColors[0],
            showText: true,
          ),
          for (int i = 1; i < session.sessionUserStatus.length && i < 3; i++)
            playerAvatarCard(
              index: i,
              size: 85,
              isSelf: false,
              player: session.sessionUserStatus[i],
              color: session.getListOfColors[i],
              showText: true,
            ),
          if (session.sessionUserStatus.length > 1 ||
              session.sessionUserStatus.length > 2 ||
              session.sessionUserStatus.length > 3)
            _invitePlayer(session),
          if (session.sessionUserStatus.length > 4)
            playerAvatarCard(
              index: 3,
              size: 85,
              isSelf: false,
              player: session.sessionUserStatus[3],
              color: session.getListOfColors[3],
              showText: true,
            ),
        ],
      ),
    );
  }

  Widget playerAvatarCard({
    required int index,
    required double size,
    required bool isSelf,
    required LudoSessionUserStatus player,
    required Color color,
    bool showText = true,
  }) {
    return Column(
      children: [
        Container(
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
                child: player.status == "ACTIVE"
                    ? Image.asset(
                        'assets/images/avatar_spritesheet.png',
                        width: 4324,
                        height: 4324,
                        fit: BoxFit.none,
                      )
                    : null,
              ),
            ),
          ),
        ),
        if (showText) const SizedBox(height: 10),
        Text(
          player.email.split("@").first,
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
            Image.asset('assets/images/share_waiting_room_bg.png',
                fit: BoxFit.cover),
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
                  padding: const EdgeInsets.all(28.0),
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
                                index: index,
                                size: 40,
                                isSelf: false,
                                player: session.sessionUserStatus[index],
                                color: session.getListOfColors[index],
                                showText: false,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 38.0),
                                child: Text(
                                  session.sessionUserStatus[index].email
                                              .split("@")
                                              .first ==
                                          ""
                                      ? "No Player"
                                      : session.sessionUserStatus[index].email
                                          .split("@")
                                          .first,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
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
    return await createImageFromWidget(shareWidget,
        logicalSize: const Size(800, 418));
  }

  Future<Uint8List> createImageFromWidget(Widget widget,
      {Duration? wait, Size? logicalSize}) async {
    final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();
    final view = PlatformDispatcher.instance.views.first;
    logicalSize ??= view.physicalSize / view.devicePixelRatio;

    final RenderView renderView = RenderView(
      view: view,
      child: RenderPositionedBox(
          alignment: Alignment.center, child: repaintBoundary),
      configuration: ViewConfiguration(
        logicalConstraints: BoxConstraints(
            maxWidth: logicalSize.width, maxHeight: logicalSize.height),
        devicePixelRatio: 1.0,
      ),
    );

    final PipelineOwner pipelineOwner = PipelineOwner();
    final BuildOwner buildOwner = BuildOwner(focusManager: FocusManager());

    pipelineOwner.rootNode = renderView;
    renderView.prepareInitialFrame();

    final RenderObjectToWidgetElement<RenderBox> rootElement =
        RenderObjectToWidgetAdapter<RenderBox>(
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
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);

    return Uint8List.view(byteData!.buffer);
  }

  Widget _invitePlayer(
    LudoSessionData session,
  ) {
    return GestureDetector(
      onTap: () async {
        final imageBytes = await _buildShareImage(session);
        final qrImageBytes = await _buildQrImage(session);
        if (!context.mounted) return;
        showDialog(
          barrierColor: Colors.black.withAlpha(220),
          context: context,
          builder: (ctx) => Dialog(
            backgroundColor: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.memory(imageBytes),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton.filled(
                        onPressed: () async {
                          final tweetText =
                              'Join my Ludo Session\nRoom Id: ${session.id}';
                          final url =
                              'https://themarquis.xyz/ludo?roomid=${session.id}';

                          // Use the Twitter app's URL scheme
                          final tweetUrl = Uri.encodeFull(
                              'twitter://post?message=$tweetText\n$url\ndata:image/png;base64,${base64Encode(imageBytes)}');

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
                      IconButton.filled(
                        onPressed: () async {
                          Clipboard.setData(ClipboardData(
                              text:
                                  "https://themarquis.xyz/ludo?roomid=${session.id}"));
                          if (!context.mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Link Copied to Clipboard'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        icon: const Icon(FontAwesomeIcons.link),
                      ),
                      IconButton.filled(
                        onPressed: () async {
                          await Gal.putImageBytes(qrImageBytes);
                          if (!context.mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('Image successfully saved to gallery'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        icon: const Icon(Icons.qr_code),
                      ),
                      IconButton.filled(
                        onPressed: () {
                          Share.shareXFiles(
                              [
                                XFile.fromData(imageBytes,
                                    mimeType: 'image/png')
                              ],
                              subject: 'Ludo Invite',
                              text: 'I am playing Ludo, please join us!',
                              fileNameOverrides: ['share.png']);
                        },
                        icon: const Icon(Icons.share),
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
            height: 85,
            width: 85,
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
            height: 25,
            width: 74,
            decoration: BoxDecoration(
                color: const Color(0XFF00ECFF),
                borderRadius: BorderRadius.circular(5)),
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
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "Room ID: ${session.id}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
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
          Container(
            height: 38,
            width: 130,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0XFF00ECFF).withOpacity(0.6),
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'Players',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            color: Color(0XFF00ECFF),
            height: 2,
          ),
        ],
      ),
    );
  }

  Widget _starkTonMenu() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 85),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _starkTokens(
            "Play Amount",
            "100",
            Colors.black,
          ),
          _starkTokens(
            "Total Prize",
            "400",
            const Color(0XFF00ECFF).withOpacity(0.3),
          ),
        ],
      ),
    );
  }

  Widget _starkTokens(String text, String amount, Color color) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 30,
          width: 100,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0XFF00ECFF),
            ),
            boxShadow: [
              BoxShadow(
                color: color,
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/svg/starknet.svg'),
              const SizedBox(width: 5),
              Text(
                amount,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _roomID(session) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            session.id.toString(),
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 40,
          width: 130,
          color: Colors.grey.withOpacity(0.3),
          child: const Center(
            child: Text(
              "A028",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _waitingRoomTopBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 90),
        Padding(
          padding: const EdgeInsets.only(left: 27, right: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "WAITING ROOM",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Stack(
                children: [
                  SvgPicture.asset(
                    'assets/svg/card.svg',
                    width: 100,
                    height: 25,
                  ),
                  const Positioned(
                    left: 8,
                    child: Text(
                      "MENU",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const CutEdgesContainer(),
      ],
    );
  }

  bool _isRoomFull(LudoSessionData? session) {
    return session != null &&
        session.sessionUserStatus.where((e) => e.status == "ACTIVE").length ==
            4;
  }
}