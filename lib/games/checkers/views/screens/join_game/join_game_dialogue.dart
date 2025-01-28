import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marquis_v2/games/checkers/models/checkers_session.dart';
import 'package:marquis_v2/games/checkers/providers/checkers_provider.dart';
import 'package:marquis_v2/widgets/error_dialog.dart';

class CheckersJoinGameDialog extends ConsumerStatefulWidget {
  const CheckersJoinGameDialog({super.key});

  @override
  ConsumerState<CheckersJoinGameDialog> createState() =>
      CheckersJoinGameDialogState();
}

class CheckersJoinGameDialogState
    extends ConsumerState<CheckersJoinGameDialog> {
  bool isLoading = false;
  List<CheckersSessionData>? availableSessions;

  @override
  void initState() {
    super.initState();
    _fetchAvailableSessions();
  }

  Future<void> _fetchAvailableSessions() async {
    setState(() {
      isLoading = true;
    });

    try {
      final sessions = await ref
          .read(checkersSessionProvider.notifier)
          .getAvailableSessions();
      setState(() {
        availableSessions = sessions;
      });
    } catch (e) {
      if (mounted) {
        showErrorDialog(e.toString(), context);
      }
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  Future<void> _joinGame(String sessionId) async {
    setState(() => isLoading = true);
    try {
      await ref
          .read(checkersSessionProvider.notifier)
          .joinLobby(int.parse(sessionId));
      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) showErrorDialog(e.toString(), context);
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
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
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.80,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
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
                if (isLoading)
                  const CircularProgressIndicator()
                else if (availableSessions?.isEmpty ?? true)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'No games available',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                else
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      itemCount: availableSessions!.length,
                      itemBuilder: (context, index) {
                        final session = availableSessions![index];
                        return _buildRoomItem(session);
                      },
                    ),
                  ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFFF3B46E),
                      ),
                      child: Text('Cancel'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () => _fetchAvailableSessions(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF3B46E),
                        foregroundColor: Colors.black,
                      ),
                      child: Text('Refresh'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoomItem(CheckersSessionData session) {
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
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '1/2 Players',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () => _joinGame(session.id),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF3B46E),
              foregroundColor: Colors.black,
            ),
            child: Text('Join'),
          ),
        ],
      ),
    );
  }
}
