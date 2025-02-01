import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckersJoinGameDialog extends ConsumerStatefulWidget {
  const CheckersJoinGameDialog({super.key});

  @override
  ConsumerState<CheckersJoinGameDialog> createState() =>
      CheckersJoinGameDialogState();
}

class CheckersJoinGameDialogState
    extends ConsumerState<CheckersJoinGameDialog> {
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
          height: MediaQuery.of(context).size.height * 0.70,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _topBar(context),
                const SizedBox(height: 16),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        _joinGameDetails(context),
                        SizedBox(height: 10),
                        _joinGameDetails(context),
                        SizedBox(height: 10),
                        _joinGameDetails(context),
                        SizedBox(height: 10),
                        _joinGameDetails(context),
                        SizedBox(height: 10),
                        _joinGameDetails(context),
                      ],
                    ),
                  ),
                ),
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
          'Join Game',
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

  Widget _joinGameDetails(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: TextTheme(
            bodyMedium: TextStyle(
          fontFamily: "Orbitron",
        )),
      ),
      child: Container(
        height: 95,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color(0x94181B25),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Color(0xFF2E2E2E),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _roomDetials(context),
                  _joinMenu(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _joinMenu() {
    return Column(
      children: [
        Text(
          '1/2 Players',
          style: TextStyle(
            fontFamily: "Orbitron",
            color: const Color(0xFF979797),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 15),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 33,
            width: 94,
            decoration: BoxDecoration(
              color: const Color(0xFFF3B46E),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                'Join',
                style: TextStyle(
                  fontFamily: "Orbitron",
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _roomDetials(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ROOM 0030',
          style: TextStyle(
            fontFamily: "Orbitron",
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8),
        Row(
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
                child: SvgPicture.asset('assets/svg/userCheckers.svg'),
              ),
            )
          ],
        ),
      ],
    );
  }
}
