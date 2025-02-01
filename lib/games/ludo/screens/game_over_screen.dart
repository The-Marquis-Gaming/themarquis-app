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
import 'package:marquis_v2/games/ludo/ludo_game_controller.dart';
import 'package:marquis_v2/games/ludo/ludo_session.dart';
import 'package:marquis_v2/games/ludo/models/ludo_session.dart';
import 'package:marquis_v2/games/ludo/widgets/angled_border_button.dart';
import 'package:marquis_v2/models/enums.dart';
import 'package:marquis_v2/providers/user.dart';
import 'package:marquis_v2/services/snackbar_service.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class MatchResultsScreen extends ConsumerWidget {
  const MatchResultsScreen(
      {super.key, required this.session, required this.game});
  final LudoSessionData session;
  final LudoGameController game;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ValueListenableBuilder<PlayState>(
        valueListenable: game.playStateNotifier,
        builder: (context, playState, child) {
          if (playState != PlayState.finished) return const SizedBox.shrink();

          final results = session.sessionUserStatus.map((element) {
            final numWinningTokens = element.playerWinningTokens
                .map((e) => e ? 1 : 0)
                .reduce((a, b) => a + b);
            return {
              'index': session.sessionUserStatus.indexOf(element),
              'score': (numWinningTokens == 4
                  ? 4 * double.parse(session.playAmount)
                  : -double.parse(session.playAmount)),
              'numWinningTokens': numWinningTokens,
              'exp': 400,
            };
          }).toList();
          results.sort((a, b) =>
              b['numWinningTokens']!.compareTo(a['numWinningTokens']!));
          for (int i = 0; i < results.length; i++) {
            results[i]['rank'] = i + 1;
          }
          final deviceSize = MediaQuery.of(context).size;
          if (kDebugMode) {
            print(
                "Device width: ${deviceSize.width}, game width: ${game.width}");
          }
          return Scaffold(
              body: Transform.scale(
            scale: game.height / deviceSize.height,
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: deviceSize.height * game.width / game.height,
              height: deviceSize.height,
              child:
                  FutureBuilder<List<Map<String, dynamic>>>(future: () async {
                final supportedTokens =
                    await ref.read(userProvider.notifier).getSupportedTokens();
                return supportedTokens;
              }(), builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildHeader(),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    useRootNavigator: false,
                                    builder: (ctx) => Dialog(
                                      backgroundColor: Colors.transparent,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF152A37),
                                          border: Border.all(
                                              color: const Color(0xFF00ECFF),
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    'Transactions',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    icon: const Icon(
                                                        Icons.close,
                                                        color: Colors.white),
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pop(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            FutureBuilder<List<Map>>(
                                              future: () async {
                                                return await ref
                                                    .read(ludoSessionProvider
                                                        .notifier)
                                                    .getTransactions(
                                                        session.id);
                                              }(),
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return const CircularProgressIndicator();
                                                }
                                                return Visibility(
                                                  visible:
                                                      snapshot.data!.isNotEmpty,
                                                  replacement: const Center(
                                                      child: Text(
                                                          'No transactions available.')),
                                                  child: Container(
                                                    color: Colors.transparent,
                                                    constraints: BoxConstraints(
                                                        maxHeight:
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.6),
                                                    child: ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount:
                                                          snapshot.data!.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        final tx = snapshot
                                                            .data![index];
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      16.0,
                                                                  vertical:
                                                                      8.0),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                width: 16,
                                                                height: 16,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFF00ECFF),
                                                                  border: Border.all(
                                                                      color: const Color(
                                                                          0xFF00ECFF)),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  width: 12),
                                                              Expanded(
                                                                child: Text(
                                                                  _shortenHash(tx[
                                                                      'transaction_hash']),
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14),
                                                                ),
                                                              ),
                                                              Text('2 mins ago',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                              .grey[
                                                                          400],
                                                                      fontSize:
                                                                          14)),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                label: const Text('Transactions',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12.0)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.cyan,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 0),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              child:
                                  _buildResultsList(results, snapshot.data!)),
                          _buildShareButton(context, results, snapshot.data!),
                          _buildBackToMenuButton(ref),
                          const SizedBox(
                            height: 48,
                          )
                        ],
                      );
              }),
            ),
          ));
        });
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
          child: Text(
            'MATCH RESULTS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
            width: 500,
            child: Image.asset(
              'assets/images/divider (1).png',
              fit: BoxFit.cover,
            )),
      ],
    );
  }

  // Helper method to shorten the transaction hash for display
  String _shortenHash(String hash) {
    if (hash.length <= 20) return hash;
    return '${hash.substring(0, 4)}...${hash.substring(hash.length - 4)}';
  }

  Widget _buildResultsList(List<Map<String, dynamic>> results,
      List<Map<String, dynamic>> supportedTokens) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...results.map(
          (result) => Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                // Add subtle gradient for depth
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              child: Row(
                children: [
                  // Player rank/name section
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Text(
                          result['rank'] == 1
                              ? 'Winner'
                              : 'Player ${result['rank']}',
                          style: TextStyle(
                            color: result['rank'] == 1
                                ? Colors.white
                                : Colors.grey[400],
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          session
                              .sessionUserStatus[result['index'] as int].email
                              .split('@')[0]
                              .toUpperCase(),
                          style: TextStyle(
                            color: result['rank'] == 1
                                ? Colors.white
                                : Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Score section
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (session.playAmount != '0')
                              Text(
                                results.firstWhere((e) =>
                                    e["tokenAddress"] ==
                                    session.playToken)["tokenName"],
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            if (session.playAmount != '0')
                              const SizedBox(width: 4),
                            if (session.playAmount != '0')
                              Text(
                                result['score']
                                    .toStringAsFixed(7)
                                    .replaceAll(RegExp(r'0*$'), ''),
                                style: TextStyle(
                                  color: result['rank'] == 1
                                      ? Colors.yellow
                                      : Colors.red,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            const SizedBox(width: 12),
                          ],
                        ),
                        SvgPicture.asset(
                          'assets/images/会员.svg',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${result['exp']} EXP',
                          style: const TextStyle(
                            color: Color(0xFF00ECFF),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildShareButton(
      BuildContext context,
      List<Map<String, dynamic>> results,
      List<Map<String, dynamic>> supportedTokens) {
    final snackBarService = SnackbarService();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 29),
      child: AngledBorderButton(
        onTap: () async {
          final imageBytes = await _buildShareImage(results, supportedTokens);
          if (!context.mounted) return;
          showDialog(
            context: context,
            useRootNavigator: false,
            barrierColor: Colors.black.withAlpha(220),
            builder: (ctx) => Dialog(
              backgroundColor: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.memory(imageBytes),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.grey[700],
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: IconButton(
                                  onPressed: () async {
                                    final tweetText =
                                        'Check out my results!\nRoom Id: ${session.id}';
                                    final url =
                                        'https://themarquis.xyz/ludo?roomid=${session.id}';

                                    // Use the Twitter app's URL scheme
                                    final tweetUrl = Uri.encodeFull(
                                        'twitter://post?message=$tweetText\n$url\ndata:image/png;base64,${base64Encode(imageBytes)}');

                                    // Fallback to web URL if the app isn't installed
                                    final webTweetUrl = Uri.encodeFull(
                                        'https://x.com/intent/tweet?text=$tweetText&url=$url&via=themarquisxyz&image=data:image/png;base64,${base64Encode(imageBytes)}');

                                    if (await canLaunchUrl(
                                        Uri.parse(tweetUrl))) {
                                      await launchUrl(Uri.parse(tweetUrl));
                                    } else {
                                      await launchUrl(Uri.parse(webTweetUrl));
                                    }
                                  },
                                  icon: const Icon(FontAwesomeIcons.xTwitter,
                                      color: Colors.white, size: 20)),
                            ),
                            const SizedBox(height: 8),
                            const Text('X',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  borderRadius: BorderRadius.circular(24)),
                              child: IconButton(
                                onPressed: () async {
                                  await Gal.putImageBytes(imageBytes);
                                  if (!context.mounted) return;
                                  snackBarService.displaySnackbar(
                                      'Image successfully saved to gallery');
                                },
                                icon: const Icon(Icons.image,
                                    color: Colors.white, size: 20),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text('Save Image',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  borderRadius: BorderRadius.circular(24)),
                              child: IconButton(
                                onPressed: () {
                                  Share.shareXFiles(
                                    [
                                      XFile.fromData(imageBytes,
                                          mimeType: 'image/png')
                                    ],
                                    subject: 'Ludo Results',
                                    text:
                                        'Check out my results!\nRoom Id: ${session.id}',
                                    fileNameOverrides: ['share.png'],
                                  );
                                },
                                icon: const Icon(Icons.share,
                                    color: Colors.white, size: 20),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text('Share',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
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
        child: Text('Share',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildBackToMenuButton(WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextButton(
        onPressed: () async {
          // await ref.read(userProvider.notifier).getUser();
          await game.updatePlayState(PlayState.welcome);
          game.overlays.remove(PlayState.finished.name);

          await ref
              .read(ludoSessionProvider.notifier)
              .clearData(refreshUser: true);
        },
        child:
            const Text('Back to Menu', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Future<Uint8List> _buildShareImage(List<Map<String, dynamic>> results,
      List<Map<String, dynamic>> supportedTokens) async {
    final Widget shareWidget = Directionality(
      textDirection: ui.TextDirection.ltr,
      child: Container(
        width: 800,
        height: 418,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg (1).png'), fit: BoxFit.cover),
          color: const Color(0xFF152A37),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF1E3A4C),
              const Color(0xFF152A37).withOpacity(0.8),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/images/Vector.svg',
                width: 100,
                height: 65,
              ),
            ),
            // Logo and Title Row
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Match Results',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Cyan line
            Center(
                child: SizedBox(
                    width: 400,
                    child: Image.asset(
                      'assets/images/divider.png',
                      fit: BoxFit.cover,
                    ))),
            const SizedBox(height: 16),
            // Results List
            ...results.map((result) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Rank and Name
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                result['rank'] == 1
                                    ? 'Winner'
                                    : 'Player ${result['rank']}',
                                style: TextStyle(
                                  color: result['rank'] == 1
                                      ? Colors.white
                                      : Colors.grey[400],
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                session
                                    .sessionUserStatus[result['index'] as int]
                                    .email
                                    .split('@')[0]
                                    .toUpperCase(),
                                style: TextStyle(
                                  color: result['rank'] == 1
                                      ? const Color(0xFF00ECFF)
                                      : Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Scores
                        Row(
                          children: [
                            Row(
                              children: [
                                if (session.playAmount != '0')
                                  Text(
                                    results.firstWhere((e) =>
                                        e["tokenAddress"] ==
                                        session.playToken)["tokenName"],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                if (session.playAmount != '0')
                                  const SizedBox(width: 4),
                                if (session.playAmount != '0')
                                  Text(
                                    result['score']
                                        .toStringAsFixed(7)
                                        .replaceAll(RegExp(r'0*$'), ''),
                                    style: TextStyle(
                                      color: result['rank'] == 1
                                          ? Colors.yellow
                                          : Colors.red,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                const SizedBox(width: 12),
                              ],
                            ),
                            SvgPicture.asset(
                              'assets/images/会员.svg',
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${result['exp']} EXP',
                              style: const TextStyle(
                                color: Color(0xFF00ECFF),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
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
}

class CyanLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF00ECFF), Colors.transparent],
        stops: [0.0, 0.6],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(CyanLinePainter oldDelegate) => false;
}
