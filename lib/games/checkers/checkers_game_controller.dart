import 'dart:developer';
import 'dart:math' as math;

import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:marquis_v2/games/checkers/components/user_stats_component.dart';
import 'package:marquis_v2/games/checkers/providers/checkers_provider.dart';
import 'package:marquis_v2/games/checkers/utils/constants.dart';
import 'package:marquis_v2/models/enums.dart';
import 'package:marquis_v2/models/marquis_game.dart';
import 'package:marquis_v2/games/checkers/components/checkers_board.dart';
import 'package:marquis_v2/games/checkers/models/checkers_session.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marquis_v2/providers/user.dart';
import 'package:marquis_v2/providers/starknet.dart';

class CheckersGameController extends MarquisGameController {
  // Private fields

  bool _isBlackTurn = false;
  int _orangeScore = 12;
  int _blackScore = 12;
  int? _winnerIndex;

  // Public fields
  bool isInit = false;
  CheckersBoard? board;
  UserStatsComponent? userStats;
  int currentPlayer = 0;
  int userIndex = -1;
  bool playerCanMove = false;
  bool isErrorMessage = false;

  // Getters

  bool get isBlackTurn =>
      ref.watch(checkersSessionProvider)?.isBlackTurn ?? false;
  int get orangeScore => _orangeScore;
  int get blackScore => ref.watch(checkersSessionProvider)?.blackScore ?? 12;
  int? get winnerIndex => _winnerIndex;

  // Setters
  set isBlackTurn(bool value) {
    _isBlackTurn = value;
    if (ref.read(checkersSessionProvider) != null) {
      ref.read(checkersSessionProvider.notifier).updateTurn(value);
    }
  }

  set orangeScore(int value) => _orangeScore = value;
  set blackScore(int value) => _blackScore = value;
  set winnerIndex(int? value) => _winnerIndex = value;

  // Update getters to use null-safe access
  int get whiteScore => ref.watch(checkersSessionProvider)?.whiteScore ?? 12;

  CheckersGameController()
      : super(
            camera: CameraComponent.withFixedResolution(
                width: kCheckersGameWidth, height: kCheckersGameHeight));

  @override
  double get unitSize => isTablet ? size.x / 10 : size.x / 15.3;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    overlays.clear();
    overlays.add(PlayState.welcome.name);
    playStateNotifier.value = PlayState.welcome;

    // Initialize userStats here
    userStats = UserStatsComponent()..position = Vector2(0, 20);
    await add(userStats!);

    // Initialize the board
    board = CheckersBoard();
    await add(board!);
  }

  void updateStats({
    required int playerIndex,
    int? lostPieces,
    int? winPieces,
    int? queens,
  }) {
    userStats?.updateStats(
      playerIndex: playerIndex,
      lostPieces: lostPieces,
      winPieces: winPieces,
      queens: queens,
    );
  }

  @override
  Color backgroundColor() => const Color.fromRGBO(0, 0, 0, 1);

  @override
  Future<void> initGame() async {
    camera.viewfinder.anchor = Anchor.center;

    if (userStats == null) {
      userStats = UserStatsComponent()..position = Vector2(0, 20);
      await add(userStats!);
    }

    // Calculate board size based on the smaller screen dimension to maintain square aspect ratio
    final minDimension = math.min(width, height);
    final boardSizeMultiplier =
        isTablet ? 0.8 : 0.6; // Use percentage of screen
    final boardSize = minDimension * boardSizeMultiplier;

    // Center the board
    final horizontalOffset = (width - boardSize) / 2;
    final verticalOffset = (height - boardSize) / 2;

    if (board == null) {
      board = CheckersBoard()
        ..size = Vector2.all(boardSize)
        ..position = Vector2(horizontalOffset, verticalOffset);
      await add(board!);
    }

    // Initialize board with provider state
    final session = ref.read(checkersSessionProvider);
    if (session != null) {
      if (kDebugMode) log("Initializing board with session: ${session.id}");
      board?.initializeFromSession(session);

      // Update stats for both players
      final playerAddress = ref
          .read(starknetProvider)
          .signerAccount
          ?.accountAddress
          .toHexString();

      // Find current player's status
      final currentPlayerStatus = session.sessionUserStatus.firstWhere(
        (status) => status.userId == playerAddress,
        orElse: () => session.sessionUserStatus.first,
      );

      // Find opponent's status
      final opponentStatus = session.sessionUserStatus.firstWhere(
        (status) => status.userId != playerAddress,
        orElse: () => session.sessionUserStatus.last,
      );

      // Update stats for current player
      updateStats(
        playerIndex: currentPlayerStatus.position == "up" ? 0 : 1,
        lostPieces: 12 -
            (currentPlayerStatus.position == "up"
                ? session.orangeScore
                : session.blackScore),
        winPieces: currentPlayerStatus.position == "up"
            ? session.orangeScore
            : session.blackScore,
        queens: 0,
      );

      // Update stats for opponent
      updateStats(
        playerIndex: opponentStatus.position == "up" ? 0 : 1,
        lostPieces: 12 -
            (opponentStatus.position == "up"
                ? session.orangeScore
                : session.blackScore),
        winPieces: opponentStatus.position == "up"
            ? session.orangeScore
            : session.blackScore,
        queens: 0,
      );
    } else {
      if (kDebugMode) log("No session data available for initialization");
    }

    _isBlackTurn = false;
    _orangeScore = 12;
    _blackScore = 12;
    _winnerIndex = null;
  }

  @override
  Future<void> updatePlayState(PlayState value) async {
    if (playStateNotifier.value == value) return;

    // First handle component cleanup for any state transition
    if (value != PlayState.playing) {
      if (board != null) {
        remove(board!);
        board = null;
      }
      if (userStats != null) {
        remove(userStats!);
        userStats = null;
      }
    }

    // Then handle specific state transitions
    switch (value) {
      case PlayState.welcome:
        overlays.clear();
        overlays.add(value.name);
        // Clear session data when going back to welcome screen
        await ref.read(checkersSessionProvider.notifier).clearData();
        break;

      case PlayState.waiting:
        overlays.clear();
        overlays.add(value.name);
        break;

      case PlayState.playing:
        overlays.clear();
        final session = ref.read(checkersSessionProvider);
        if (session != null) await initGame();
        break;

      case PlayState.finished:
        overlays.clear();
        overlays.add(value.name);
        // Show game over dialog only if we have a valid session and the game is actually over
        final session = ref.read(checkersSessionProvider);
        if (session != null && session.isGameOver) {
          Future.microtask(() async {
            if (buildContext != null && buildContext!.mounted) {
              final playerAddress = ref
                  .read(starknetProvider)
                  .signerAccount
                  ?.accountAddress
                  .toHexString();

              final isWinning = playerAddress != null &&
                  ((session.blackScore == 0 && session.nextPlayer == "1") ||
                      (session.orangeScore == 0 && session.nextPlayer == "2"));

              await showDialog(
                context: buildContext!,
                useRootNavigator: false,
                barrierDismissible: false,
                builder: (context) => GameOverDialog(
                  isWinning: isWinning,
                  playerName: session.blackScore == 0 ? 'Orange' : 'Black',
                  tokenAddress: '',
                  tokenAmount: '0',
                ),
              );
            }
          });
        }
        break;
    }

    // Finally update the play state
    playStateNotifier.value = value;
  }

  // Check if the game is over
  bool checkGameOver() {
    final session = ref.read(checkersSessionProvider);
    if (session == null) return false;

    // Check if game is over from session state
    if (session.isGameOver) {
      // Determine winner
      if (session.blackScore == 0) {
        _winnerIndex = 1; // Orange/White wins
      } else if (session.orangeScore == 0) {
        _winnerIndex = 0; // Black wins
      }
      return true;
    }

    return false;
  }

  Future<void> makeMove(int fromRow, int fromCol, int toRow, int toCol) async {
    final session = ref.read(checkersSessionProvider);
    if (session == null) return;

    final checkersPiece = board?.pieces[fromRow][fromCol];
    if (checkersPiece != null) {
      try {
        // Convert CheckersPin to CheckersPiece
        final piece = CheckersPiece(
          sessionId: int.parse(session.id),
          row: fromRow,
          col: fromCol,
          player: checkersPiece.isBlack ? "2" : "1", // 2 for black, 1 for white
          position:
              checkersPiece.isBlack ? 2 : 1, // 2 for Down/Black, 1 for Up/White
          isKing: checkersPiece.isKing,
          isAlive: true,
        );

        await ref.read(checkersSessionProvider.notifier).movePiece(
              piece: piece,
              targetRow: toRow,
              targetCol: toCol,
            );

        // Board will be updated through websocket event
      } catch (e) {
        if (kDebugMode) print("Error making move: $e");
        rethrow;
      }
    }
  }

  void updateGameState({
    required bool isBlackTurn,
    required int orangeScore,
    required int blackScore,
  }) {
    _isBlackTurn = isBlackTurn;
    _orangeScore = orangeScore;
    _blackScore = blackScore;
  }
}

class GameOverDialog extends ConsumerStatefulWidget {
  const GameOverDialog({
    super.key,
    required this.isWinning,
    required this.tokenAddress,
    required this.tokenAmount,
    required this.playerName,
  });

  final bool isWinning;
  final String playerName;
  final String tokenAddress;
  final String tokenAmount;

  @override
  ConsumerState<GameOverDialog> createState() => _GameOverDialogState();
}

class _GameOverDialogState extends ConsumerState<GameOverDialog> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40),
            width: 180,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(26, 32, 45, 1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 60),
                Text(
                  widget.isWinning ? 'REWARD' : 'WINNER',
                  style: const TextStyle(
                    color: Color(0xFF00ECFF),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!widget.isWinning)
                      Consumer(
                        builder: (context, ref, _) {
                          final session = ref.watch(checkersSessionProvider);
                          final playerAddress = ref
                              .watch(starknetProvider)
                              .signerAccount
                              ?.accountAddress
                              .toHexString();

                          if (session == null) return const SizedBox.shrink();

                          final winnerStatus =
                              session.sessionUserStatus.firstWhere(
                            (status) =>
                                status.position ==
                                (session.blackScore == 0 ? "up" : "down"),
                            orElse: () => session.sessionUserStatus.first,
                          );

                          return Column(
                            children: [
                              const CircleAvatar(radius: 20),
                              Text(winnerStatus.email),
                            ],
                          );
                        },
                      ),
                    Column(
                      children: [
                        if (widget.tokenAmount != '0')
                          FutureBuilder(
                            future: ref
                                .read(userProvider.notifier)
                                .getSupportedTokens(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Text("");
                              }
                              final roomStake =
                                  "${(((double.tryParse(widget.tokenAmount)) ?? 0) / 1e18 * (widget.isWinning ? 4 : -1)).toStringAsFixed(7).replaceAll(RegExp(r'0*$'), '')} ${snapshot.data?.firstWhere((e) => e["tokenAddress"] == widget.tokenAddress)["tokenName"] ?? ''}";
                              return Text(
                                roomStake,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            },
                          ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
