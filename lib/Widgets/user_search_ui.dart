import 'package:flutter/material.dart';

class DrawArc extends CustomPainter {
  final double maxWidth;
  final double maxHeight;
  const DrawArc(this.maxWidth, this.maxHeight);

  @override
  void paint(Canvas canvas, Size size) {

    var baseRadious = maxWidth/2;
    var color = Colors.white.withOpacity(0.6);
    var paint1 = Paint()
      ..color = const Color.fromRGBO(229, 229, 229, 1)
      ..style = PaintingStyle.fill;

    var paint2 = Paint()..color = color;

    var paint3 = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    var paint4 = Paint()
      ..color = color
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    var paint5 = Paint()
      ..color = color
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;

    var xPos = maxWidth/2;
    var yPos = maxHeight/2;
    var offSet = Offset(xPos, yPos);

    canvas.drawCircle(offSet, baseRadious - 130, paint2,);
    canvas.drawCircle(offSet, baseRadious - 140, paint1);
    canvas.drawCircle(offSet, baseRadious - 100, paint3);
    canvas.drawCircle(offSet, baseRadious - 50, paint4);
    canvas.drawCircle(offSet, baseRadious, paint5);

    // Rect rect = Rect.fromCircle(
    //     center: Offset(size.height / 2, size.width / 2), radius: 70);
    // Rect rect2 = Rect.fromCircle(
    //     center: Offset(size.height / 2, size.width / 2), radius: 90);

    // canvas.drawCircle(const Offset(0, 0), maxSize / 2, paint2);
    // canvas.drawCircle(const Offset(0, 0), 200, paint2);
    // canvas.drawCircle(const Offset(0, 0), 150, paint2);
    // canvas.drawCircle(const Offset(0, 0), 100, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class DrawCircle extends CustomPainter {
  var paint1 = Paint()..color = Colors.redAccent;
  var paint2 = Paint()..color = Colors.amber[100]!;
  // ..strokeWidth = 16
  // ..style = PaintingStyle.stroke;
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(const Offset(0.0, 0.0), 50, paint1);
    canvas.drawCircle(const Offset(0.0, 0.0), 40, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}


/*

@override
  void paint(Canvas canvas, Size size) {
    var baseRadious = maxSize / 2 - 20;
    var color = Colors.white.withOpacity(0.6);
    var paint1 = Paint()
      ..color = Colors.blueAccent.withOpacity(0.8)
      ..style = PaintingStyle.fill;

    var paint2 = Paint()..color = Colors.white;

    var paint3 = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    var paint4 = Paint()
      ..color = color
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    var paint5 = Paint()
      ..color = color
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;

    var paint6 = Paint()
      ..color = Colors.blueAccent.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    var xPos = size.width / 2;
    var yPos = size.height / 2;
    var offSet = Offset(xPos, yPos);
    Rect rect = Rect.fromCircle(center: offSet, radius: baseRadious);

    // canvas.drawArc(rect, -1, -1, true, paint6);
    canvas.drawCircle(offSet, baseRadious - 100, paint3);
    canvas.drawCircle(offSet, baseRadious - 50, paint4);
    canvas.drawArc(rect, -1, -1, true, paint6);
    canvas.drawCircle(offSet, baseRadious, paint5);
    canvas.drawCircle(
      offSet,
      baseRadious - 130,
      paint2,
    );
    canvas.drawCircle(offSet, baseRadious - 140, paint1);

    // Rect rect2 = Rect.fromCircle(
    //     center: Offset(size.height / 2, size.width / 2), radius: 90);

    // canvas.drawCircle(const Offset(0, 0), maxSize / 2, paint2);
    // canvas.drawCircle(const Offset(0, 0), 200, paint2);
    // canvas.drawCircle(const Offset(0, 0), 150, paint2);
    // canvas.drawCircle(const Offset(0, 0), 100, paint2);
  }





*/