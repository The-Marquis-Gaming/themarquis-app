import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RoomFoundDialogue extends ConsumerStatefulWidget {
  const RoomFoundDialogue({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .copyWith(textTheme: GoogleFonts.montserratTextTheme()),
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
          style: GoogleFonts.montserrat(
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
              style: GoogleFonts.montserrat(
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
                    'Join',
                    style: GoogleFonts.montserrat(
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
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: GoogleFonts.orbitronTextTheme(),
      ),
      child: Container(
        height: 115,
        width:140,
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
                'ROOM 0028',
                style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '1/2 Players',
                style: GoogleFonts.orbitron(
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
