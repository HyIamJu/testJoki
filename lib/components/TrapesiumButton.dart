import 'package:flutter/material.dart';

class TrapesiumButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const TrapesiumButton(
      {super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(
        children: [
          CustomPaint(
            painter: TrapesiumPainter(
                color: Colors.white, style: PaintingStyle.stroke),
            child: const SizedBox(
              width: 185,
              height: 40,
            ),
          ),
          Positioned(
            right: 0,
            child: CustomPaint(
              painter: TrapesiumPainter(
                  color: const Color.fromRGBO(25, 176, 0, 1),
                  style: PaintingStyle.fill),
              child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 165,
                  child: const Center(
                      child: Text(
                    'Get Start > ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ))),
            ),
          ),
        ],
      ),
    );
  }
}

class TrapesiumPainter extends CustomPainter {
  final Color color;
  final PaintingStyle style;

  TrapesiumPainter({required this.color, required this.style});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = style;

    // final path = Path()
    //   ..moveTo(0, size.height)//kiri bawah
    //   ..lineTo(20, 0) //kanan bawah
    //   ..lineTo(size.width, 0) //kanan atas
    //   ..lineTo(size.width, size.height)// ttup
    //   ..close();

    final path = Path()
      ..moveTo(0, 0) // kiri atas
      ..lineTo(size.width, 0) // kanan atas
      ..lineTo(size.width, size.height) // kanan bawah
      ..lineTo(20, size.height) // kiri bawah
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
