// import 'package:flutter/material.dart';
//
// class CirclePainter extends CustomPainter {
//   CirclePainter({required this.color});
//
//   final Color color;
//   final _paint = Paint()
//     ..color = color
//     ..strokeWidth = 1
//   // Use [PaintingStyle.fill] if you want the circle to be filled.
//     ..style = PaintingStyle.stroke;
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     canvas.drawOval(
//       Rect.fromLTWH(0, 0, size.width, size.height),
//       _paint,
//     );
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }

import 'package:flutter/material.dart';

class CustomCircle extends StatelessWidget {
  const CustomCircle({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16,
      height: 16,
      child: Center(
        child: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: color,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}

