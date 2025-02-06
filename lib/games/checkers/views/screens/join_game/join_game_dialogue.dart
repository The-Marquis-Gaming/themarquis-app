import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marquis_v2/games/checkers/checkers_game_controller.dart';
import 'package:marquis_v2/games/checkers/models/checkers_session.dart';
import 'package:marquis_v2/games/checkers/providers/checkers_provider.dart';
import 'package:marquis_v2/models/enums.dart';
import 'package:marquis_v2/widgets/error_dialog.dart';

class CheckersJoinGameDialog extends ConsumerStatefulWidget {
  const CheckersJoinGameDialog({
    super.key,
    required this.gameController,
  });

  final CheckersGameController gameController;

  @override
  ConsumerState<CheckersJoinGameDialog> createState() =>
      CheckersJoinGameDialogState();
}

class CheckersJoinGameDialogState
    extends ConsumerState<CheckersJoinGameDialog> {
  bool isLoading = false;
  bool _isJoining = false;
  final TextEditingController _sessionIdController = TextEditingController();

  @override
  void dispose() {
    _sessionIdController.dispose();
    super.dispose();
  }

  Future<void> _joinGame(CheckersSessionData session) async {
    setState(() {
      _isJoining = true;
    });
    try {
      await ref
          .read(checkersSessionProvider.notifier)
          .joinLobby(int.parse(session.id));
      if (mounted) {
        Navigator.of(context).pop();
        await widget.gameController.updatePlayState(PlayState.playing);
      }
    } catch (e) {
      if (mounted) {
        showErrorDialog(e.toString(), context);
      }
    } finally {
      if (mounted) {
        setState(() {
          _isJoining = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: TextTheme(
            bodyMedium: TextStyle(
          fontFamily: "Montserrat",
        )),
      ),
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: const Color(0xFF21262B),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: FutureBuilder(
                future: ref
                    .read(checkersSessionProvider.notifier)
                    .getAvailableSessions(),
                builder: (context,
                    AsyncSnapshot<List<CheckersSessionData>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xFFF3B46E)),
                      ),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error loading sessions: ${snapshot.error}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }

                  final sessions = snapshot.data ?? [];
                  if (sessions.isEmpty) {
                    return const Center(
                      child: Text(
                        'No available games found',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Available Games',
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          itemCount: sessions.length,
                          itemBuilder: (context, index) {
                            final session = sessions[index];
                            return _buildGameItem(session);
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            if (_isJoining)
              Container(
                color: Colors.black54,
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFFF3B46E)),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameItem(CheckersSessionData session) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFF3B46E)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Room ${session.id}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                '1/2 Players',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () => _joinGame(session),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF3B46E),
              foregroundColor: Colors.black,
            ),
            child: const Text('Join'),
          ),
        ],
      ),
    );
  }
}
