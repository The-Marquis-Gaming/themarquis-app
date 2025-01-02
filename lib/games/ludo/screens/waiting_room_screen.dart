// import 'dart:async';
// import 'dart:convert';
// import 'dart:ui' as ui;

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:gal/gal.dart';

// import 'package:marquis_v2/games/ludo/ludo_session.dart';
// import 'package:marquis_v2/games/ludo/models/ludo_session.dart';
// import 'package:marquis_v2/models/enums.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:url_launcher/url_launcher.dart';

// class WaitingRoomScreen extends ConsumerStatefulWidget {
//   const WaitingRoomScreen({super.key, required this.game});
//   final LudoGame game;

//   @override
//   ConsumerState<WaitingRoomScreen> createState() => _WaitingRoomScreenState();
// }

// class _WaitingRoomScreenState extends ConsumerState<WaitingRoomScreen> {
//   Timer? _countdownTimer;
//   Timer? _sessionTimer;
//   int _countdown = 15;
//   int _sessionTimeLeft = 120; // 2 minutes

//   @override
//   void initState() {
//     super.initState();
//     startSessionTimer();
//   }

//   void startSessionTimer() {
//     final session = ref.read(ludoSessionProvider);
//     if (session == null) return;

//     // Calculate remaining time based on session creation
//     final createdAt = session.createdAt;
//     final now = DateTime.now();
//     final difference = now.difference(createdAt);
//     _sessionTimeLeft = 120 - difference.inSeconds;
    
//     // If time already expired, set to 0
//     if (_sessionTimeLeft < 0) _sessionTimeLeft = 0;

//     _sessionTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_sessionTimeLeft > 0) {
//           _sessionTimeLeft--;
//         }
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _countdownTimer?.cancel();
//     _sessionTimer?.cancel();
//     super.dispose();
//   }

//   String get formattedSessionTime {
//     final minutes = (_sessionTimeLeft ~/ 60).toString().padLeft(2, '0');
//     final seconds = (_sessionTimeLeft % 60).toString().padLeft(2, '0');
//     return '$minutes:$seconds';
//   }

//   void _startCountdown() {
//     _countdown = 15;
//     _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_countdown > 0) {
//           _countdown--;
//         } else {
//           _countdownTimer?.cancel();
//           widget.game.playState = PlayState.playing;
//         }
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final session = ref.watch(ludoSessionProvider);
//     if (_isRoomFull(session) && _countdownTimer == null) _startCountdown();
//     final deviceSize = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Transform.scale(
//         scale: widget.game.height / deviceSize.height,
//         alignment: Alignment.topLeft,
//         child: SizedBox(
//           width: deviceSize.height * widget.game.width / widget.game.height,
//           height: deviceSize.height,
//           child: session == null
//               ? const Center(child: Text('No Data'))
//               : Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     // Top section with title and room ID
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 8.0),
//                       child: Column(
//                         children: [
//                           const Padding(
//                             padding: EdgeInsets.all(8.0),
//                             child: Text(
//                               'WAITING ROOM',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.all(8.0),
//                             child: Text(
//                               'Room ID',
//                               style: TextStyle(
//                                 color: Colors.white70,
//                                 fontSize: 18,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   session.id,
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 24,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 const Icon(
//                                   Icons.copy,
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Column(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child:
//                                   playerAvatarCard(index: 0, size: 80, isSelf: true, player: session.sessionUserStatus[0], color: session.getListOfColors[0]),
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: Text(
//                                 'VS',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 90,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Row(
//                                 children: [
//                                   for (int i = 1; i < session.sessionUserStatus.length; i++)
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(horizontal: 8),
//                                       child: playerAvatarCard(
//                                           index: i, size: 80, isSelf: false, player: session.sessionUserStatus[i], color: session.getListOfColors[i]),
//                                     ),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                     // Invite Button
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: ElevatedButton(
//                         onPressed: () async {
//                           final imageBytes = await _buildShareImage(session);
//                           final qrImageBytes = await _buildQrImage(session);
//                           if (!context.mounted) return;
//                           showDialog(
//                             barrierColor: Colors.black.withAlpha(220),
//                             context: context,
//                             builder: (ctx) => Dialog(
//                               backgroundColor: Colors.transparent,
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   Image.memory(imageBytes),
//                                   Padding(
//                                     padding: const EdgeInsets.all(16.0),
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.max,
//                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                       children: [
//                                         IconButton.filled(
//                                           onPressed: () async {
//                                             final tweetText = 'Join my Ludo Session\nRoom Id: ${session.id}';
//                                             final url = 'https://themarquis.xyz/ludo?roomid=${session.id}';

//                                             // Use the Twitter app's URL scheme
//                                             final tweetUrl =
//                                                 Uri.encodeFull('twitter://post?message=$tweetText\n$url\ndata:image/png;base64,${base64Encode(imageBytes)}');

//                                             // Fallback to web URL if the app isn't installed
//                                             final webTweetUrl = Uri.encodeFull(
//                                                 'https://x.com/intent/tweet?text=$tweetText&url=$url&via=themarquisxyz&image=data:image/png;base64,${base64Encode(imageBytes)}');
//                                             if (await canLaunchUrl(Uri.parse(tweetUrl))) {
//                                               await launchUrl(Uri.parse(tweetUrl));
//                                             } else {
//                                               await launchUrl(Uri.parse(webTweetUrl));
//                                             }
//                                           },
//                                           icon: const Icon(FontAwesomeIcons.xTwitter),
//                                         ),
//                                         IconButton.filled(
//                                           onPressed: () async {
//                                             Clipboard.setData(ClipboardData(text: "https://themarquis.xyz/ludo?roomid=${session.id}"));
//                                             if (!context.mounted) return;
//                                             ScaffoldMessenger.of(context).showSnackBar(
//                                               const SnackBar(
//                                                 content: Text('Link Copied to Clipboard'),
//                                                 duration: Duration(seconds: 2),
//                                               ),
//                                             );
//                                           },
//                                           icon: const Icon(FontAwesomeIcons.link),
//                                         ),
//                                         IconButton.filled(
//                                           onPressed: () async {
//                                             await Gal.putImageBytes(qrImageBytes);
//                                             if (!context.mounted) return;
//                                             ScaffoldMessenger.of(context).showSnackBar(
//                                               const SnackBar(
//                                                 content: Text('Image successfully saved to gallery'),
//                                                 duration: Duration(seconds: 2),
//                                               ),
//                                             );
//                                           },
//                                           icon: const Icon(Icons.qr_code),
//                                         ),
//                                         IconButton.filled(
//                                           onPressed: () {
//                                             Share.shareXFiles([XFile.fromData(imageBytes, mimeType: 'image/png')],
//                                                 subject: 'Ludo Invite', text: 'I am playing Ludo, please join us!', fileNameOverrides: ['share.png']);
//                                           },
//                                           icon: const Icon(Icons.share),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(
//                           // primary: Colors.cyan, // background color
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                         ),
//                         child: const Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
//                           child: Text(
//                             'Invite',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     // Bottom Timer Section
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: IconButton(
//                         onPressed: _isRoomFull(session)
//                             ? () {
//                                 widget.game.playState = PlayState.playing;
//                               }
//                             : null,
//                         disabledColor: Colors.grey,
//                         icon: Stack(
//                           alignment: AlignmentDirectional.center,
//                           children: [
//                             Center(
//                               child: SvgPicture.asset("assets/svg/ludo_elevated_button.svg"),
//                             ),
//                             Center(
//                               child: Text(
//                                 _isRoomFull(session)
//                                     ? _countdownTimer == null
//                                         ? 'Start Game'
//                                         : 'Starting in $_countdown'
//                                     : 'Waiting for players',
//                                 style: const TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//         ),
//       ),
//     );
//   }

//   Future<Uint8List> _buildQrImage(LudoSessionData session) async {
//     final image = await createImageFromWidget(
//       Directionality(
//         textDirection: TextDirection.ltr,
//         child: SizedBox(
//           width: 500,
//           height: 500,
//           child: Stack(
//             children: [
//               Image.asset(
//                 'assets/images/share_referral_bg.png',
//                 fit: BoxFit.cover,
//               ),
//               Center(
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 80),
//                     const Padding(
//                       padding: EdgeInsets.all(6.0),
//                       child: Text(
//                         "Game: Ludo",
//                         style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(4.0),
//                       child: Text(
//                         "Room ID: ${session.id}",
//                         style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     QrImageView(
//                       backgroundColor: Colors.transparent,
//                       eyeStyle: const QrEyeStyle(
//                         color: Colors.white,
//                         eyeShape: QrEyeShape.square,
//                       ),
//                       dataModuleStyle: const QrDataModuleStyle(
//                         dataModuleShape: QrDataModuleShape.square,
//                         color: Colors.white,
//                       ),
//                       data: "https://themarquis.xyz/ludo?roomid=${session.id}",
//                       size: 250,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       logicalSize: const Size(500, 500),
//     );
//     return image;
//   }

//   Future<Uint8List> _buildShareImage(LudoSessionData session) async {
//     final Widget shareWidget = Directionality(
//       textDirection: ui.TextDirection.ltr,
//       child: SizedBox(
//         width: 800,
//         height: 418,
//         child: Stack(
//           children: [
//             Image.asset('assets/images/share_waiting_room_bg.png', fit: BoxFit.cover),
//             Column(
//               children: [
//                 const SizedBox(height: 80),
//                 const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     "Join Ludo Now!",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 32,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(6.0),
//                   child: Text(
//                     "Room ID: ${session.id}",
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 24,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(28.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       // SizedBox(width: 96),
//                       ...List.generate(
//                         4,
//                         (index) => Container(
//                           width: 108,
//                           margin: const EdgeInsets.symmetric(horizontal: 10),
//                           child: Column(
//                             children: [
//                               playerAvatarCard(
//                                 index: index,
//                                 size: 40,
//                                 isSelf: false,
//                                 player: session.sessionUserStatus[index],
//                                 color: session.getListOfColors[index],
//                                 showText: false,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(vertical: 38.0),
//                                 child: Text(
//                                   session.sessionUserStatus[index].email.split("@").first == ""
//                                       ? "No Player"
//                                       : session.sessionUserStatus[index].email.split("@").first,
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//     return await createImageFromWidget(shareWidget, logicalSize: const Size(800, 418));
//   }

//   Future<Uint8List> createImageFromWidget(Widget widget, {Duration? wait, Size? logicalSize}) async {
//     final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();
//     final view = PlatformDispatcher.instance.views.first;
//     logicalSize ??= view.physicalSize / view.devicePixelRatio;

//     final RenderView renderView = RenderView(
//       view: view,
//       child: RenderPositionedBox(alignment: Alignment.center, child: repaintBoundary),
//       configuration: ViewConfiguration(
//         logicalConstraints: BoxConstraints(maxWidth: logicalSize.width, maxHeight: logicalSize.height),
//         devicePixelRatio: 1.0,
//       ),
//     );

//     final PipelineOwner pipelineOwner = PipelineOwner();
//     final BuildOwner buildOwner = BuildOwner(focusManager: FocusManager());

//     pipelineOwner.rootNode = renderView;
//     renderView.prepareInitialFrame();

//     final RenderObjectToWidgetElement<RenderBox> rootElement = RenderObjectToWidgetAdapter<RenderBox>(
//       container: repaintBoundary,
//       child: widget,
//     ).attachToRenderTree(buildOwner);

//     buildOwner.buildScope(rootElement);

//     if (wait != null) {
//       await Future.delayed(wait);
//     }

//     buildOwner.buildScope(rootElement);
//     buildOwner.finalizeTree();

//     pipelineOwner.flushLayout();
//     pipelineOwner.flushCompositingBits();
//     pipelineOwner.flushPaint();

//     final ui.Image image = await repaintBoundary.toImage();
//     final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

//     return Uint8List.view(byteData!.buffer);
//   }

//   Widget playerAvatarCard({
//     required int index,
//     required double size,
//     required bool isSelf,
//     required LudoSessionUserStatus player,
//     required Color color,
//     bool showText = true,
//   }) {
//     return Column(
//       children: [
//         Container(
//           width: size, // Width of the displayed sprite
//           height: size, // Height of the displayed sprite
//           decoration: BoxDecoration(
            
//             color: color, // Background color
//             borderRadius: BorderRadius.circular(size / 8), // Rounded corners with radius 24
//           ),
//           child: FittedBox(
//             fit: BoxFit.fill,
//             child: ClipRect(
//               child: Align(
//                 alignment: index == 1
//                     ? Alignment.topLeft
//                     : index == 2
//                         ? Alignment.topRight
//                         : index == 3
//                             ? Alignment.bottomLeft
//                             : Alignment.bottomRight,
//                 // widthFactor: 2160 / 4324,
//                 // heightFactor: 2160 / 4324,
//                 widthFactor: 0.5,
//                 heightFactor: 0.5,
//                 child: player.status == "ACTIVE"
//                     ? Image.asset(
//                         'assets/images/avatar_spritesheet.png', // Path to your spritesheet
//                         width: 4324, // Full width of the sprite sheet
//                         height: 4324, // Full height of the sprite sheet
//                         fit: BoxFit.none, // Ensure no scaling occurs
//                       )
//                     : null,
//               ),
//             ),
//           ),
//         ),
//         if (showText)
//           Text(
//             player.email.split("@").first,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: isSelf ? 18 : 12,
//             ),
//           ),
//       ],
//     );
//   }

//   // bool _isRoomFull(LudoSessionData? session) {
//   //   return session != null &&
//   //       session.sessionUserStatus.where((e) => e.status == "ACTIVE").length ==
//   //           4;
//   // }
//   bool _isRoomFull(LudoSessionData? session) {
//     return session != null && session.sessionUserStatus.where((e) => e.status == "ACTIVE").length == 4;
//   }
// }