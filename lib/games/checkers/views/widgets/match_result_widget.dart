import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/ui_widgets.dart';

class MatchResultWidget extends StatelessWidget {
  const MatchResultWidget({
    super.key,
    required this.title,
    required this.value,
    required this.icon
  });

  final String title, value;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.orbitron(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          SvgPicture.asset("assets/svg/line_gradient.svg", width: double.infinity, height: 2),
          Container(
            width: double.infinity,
            height: 42,
            color: Color(0xFF72401D),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value,
                  style: GoogleFonts.orbitron(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                horizontalSpace(4.0),
                icon
              ],
            ),
          ),
          SvgPicture.asset("assets/svg/line_gradient.svg", width: double.infinity, height: 2),
        ],
      ),
    );
  }
}
