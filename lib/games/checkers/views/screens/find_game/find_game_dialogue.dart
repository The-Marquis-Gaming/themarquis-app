import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marquis_v2/games/checkers/views/screens/find_game/room_found_dialogue.dart';

class CheckersFindRoomDialog extends ConsumerStatefulWidget {
  const CheckersFindRoomDialog({super.key});

  @override
  ConsumerState<CheckersFindRoomDialog> createState() =>
      CheckersFindRoomDialogState();
}

class CheckersFindRoomDialogState
    extends ConsumerState<CheckersFindRoomDialog> {
  final _roomIdController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _roomIdController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          textTheme: TextTheme(
              bodyMedium: TextStyle(
        fontFamily: "Montserrat",
      ))),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
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
                Text(
                  'Find Game',
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                _textField(),
                const SizedBox(height: 16),
                _buttons(context),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textField() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Room ID',
            style: TextStyle(
              fontFamily: "Montserrat",
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(
          height: 41,
          child: TextField(
            style: const TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
              hintText: "Please enter room ID",
              hintStyle: TextStyle(
                color: Color(0xFF8B8B8B),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              fillColor: const Color(0xFF363D43),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
            ),
            controller: _roomIdController,
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
              'Cancel',
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
            onPressed: () {
              Navigator.pop(context);
              _roomFoundDialog(ctx: context);
            },
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              foregroundColor: Colors.black,
              backgroundColor: const Color(0xFFF3B46E),
            ),
            child: isLoading
                ? const CircularProgressIndicator()
                : Text(
                    'Confirm',
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

  Future<void> _roomFoundDialog({required BuildContext ctx}) {
    return showDialog(
      context: ctx,
      useRootNavigator: false,
      builder: (BuildContext context) {
        return RoomFoundDialogue();
      },
    );
  }
}
