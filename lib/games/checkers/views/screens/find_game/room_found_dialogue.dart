import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marquis_v2/games/checkers/providers/checkers_provider.dart';
import 'package:marquis_v2/widgets/error_dialog.dart';

class RoomFoundDialogue extends ConsumerStatefulWidget {
  final String sessionId;
  const RoomFoundDialogue({required this.sessionId, super.key});

  @override
  ConsumerState<RoomFoundDialogue> createState() => RoomFoundDialogueState();
}

class RoomFoundDialogueState extends ConsumerState<RoomFoundDialogue> {
  final _roomIdController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _roomIdController.text;
  }

  Future<void> _joinGame() async {
    setState(() => isLoading = true);
    try {
      await ref
          .read(checkersSessionProvider.notifier)
          .joinLobby(int.parse(widget.sessionId));
      if (mounted) {
        Navigator.pop(context);
        // Navigate to game screen or waiting room
      }
    } catch (e) {
      if (mounted) showErrorDialog(e.toString(), context);
      // Show error message
    } finally {
      if (mounted) setState(() => isLoading = false);
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
        clipBehavior: Clip.antiAlias,
        backgroundColor: const Color(0xFF21262B),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.80,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _topBar(context),
                SizedBox(height: 14),
                _roomFoundDetails(context),
                SizedBox(height: 16),
                _buttons(context),
                SizedBox(height: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _topBar(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            visualDensity: VisualDensity.compact,
            padding: const EdgeInsets.all(0),
            onPressed: Navigator.of(context).pop,
            icon: const Icon(
              Icons.cancel_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        Text(
          'Room Found!',
          style: TextStyle(
            fontFamily: "Montserrat",
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buttons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: Navigator.of(context).pop,
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              foregroundColor: const Color(0xFFF3B46E),
              side: const BorderSide(
                color: Color(0xFFF3B46E),
              ),
            ),
            child: Text(
              'Back',
              style: TextStyle(
                fontFamily: "Montserrat",
                color: Color(0xFFF3B46E),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ElevatedButton(
            onPressed: isLoading ? null : _joinGame,
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              foregroundColor: Colors.black,
              backgroundColor: const Color(0xFFF3B46E),
            ),
            child: isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.black,
                    ),
                  )
                : Text(
                    'Join',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _roomFoundDetails(BuildContext context) {
    final session = ref.watch(checkersSessionProvider);
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: TextTheme(
            bodyMedium: TextStyle(
          fontFamily: "Orbitron",
        )),
      ),
      child: Container(
        height: 115,
        width: 140,
        decoration: BoxDecoration(
          color: const Color(0x94181B25),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Color(0xFF2E2E2E),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'ROOM ${session?.id ?? ""}',
                style: TextStyle(
                  fontFamily: "Orbitron",
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${session?.sessionUserStatus.length ?? 1}/2 Players',
                style: TextStyle(
                  fontFamily: "Orbitron",
                  color: const Color(0xFF979797),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: const Color(0xFFF3B46E),
                    ),
                    child: Center(
                      child: Image.asset('assets/images/male.png'),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(
                        color: const Color(0xFF5D5D5D),
                      ),
                    ),
                    child: Center(
                        child: SvgPicture.asset('assets/svg/userCheckers.svg')),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
