import 'package:flutter/material.dart';

class CustomRangeShape extends RangeSliderThumbShape {
  final double thumbRadius;
  final double min;
  final double max;

  const CustomRangeShape({
    required this.thumbRadius,
    required this.min,
    required this.max,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      bool isDiscrete = false,
      bool isEnabled = false,
      bool? isOnTop,
      required SliderThemeData sliderTheme,
      TextDirection? textDirection,
      Thumb? thumb,
      bool? isPressed}) {
    final Canvas canvas = context.canvas;
    // String titleText = "";

    final paint = Paint()
      ..color = const Color.fromRGBO(0, 213, 217, 1) //Thumb Background Color
      ..style = PaintingStyle.fill;

    TextSpan span = TextSpan(
        style: TextStyle(
          fontSize: thumbRadius * .7,
          color: Colors.white, //Text Color of Value on Thumb
        ),
        text: thumb == Thumb.start
            ? min.round().toString()
            : max.round().toString());

    TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    tp.layout();
    Offset textCenter =
        Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

    canvas.drawCircle(center, thumbRadius * .9, paint);
    tp.paint(canvas, textCenter);
  }
}
