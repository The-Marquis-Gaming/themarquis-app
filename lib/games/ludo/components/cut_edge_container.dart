import 'package:flutter/material.dart';

class CutEdgesContainer extends StatelessWidget {
  const CutEdgesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          SizedBox(
            height: 15,
            width: MediaQuery.of(context).size.width,
          ),
          ClipPath(
            clipper: BottomHalfClipper(),
            child: Container(
              height: 15,
              width: 217,
              color: const Color(0XFF00ECFF),
            ),
          ),
          Positioned(
            top: 7.5,
            left: 213,
            child: Container(
              height: 1,
              width: MediaQuery.of(context).size.width - 217,
              color: const Color(0XFF00ECFF),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomHalfClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double cutSize = 10.0;
    Path path = Path();

    path.moveTo(0, size.height / 2);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - cutSize, size.height);
    path.lineTo(cutSize, size.height);
    path.lineTo(0, size.height / 2);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
