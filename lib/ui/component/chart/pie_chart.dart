import 'dart:math';

import 'package:flutter/material.dart';

class PieChart extends StatefulWidget {
  const PieChart({
    super.key,
    required this.readCount,
    required this.targetCount,
  });

  final int readCount;
  final int targetCount;

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  static final  _tween = Tween<double>(begin: 0, end: 1);

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    final curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    _tween.animate(curvedAnimation);

    _animation = _animationController.drive(_tween);
    _animationController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double parentHeight = constraints.maxHeight;

        return AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Stack(
                children: [
                  CustomPaint(
                    painter: _ChartPainter(
                      readCount: widget.readCount,
                      targetCount: widget.targetCount,
                      arcAnimation: _animationController.value,
                    ),
                    child: Container(),
                  ),
                  Positioned(
                    top: parentHeight / 3.5,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: widget.readCount >= widget.targetCount
                          ? Column(
                              children: [
                                Text(
                                  "${(widget.readCount * _animationController.value).round()}/${widget.targetCount.round()}",
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Text(
                                "${(widget.readCount * _animationController.value).round()}/${widget.targetCount.round()}",
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                    ),
                  ),
                ],
              );
            });
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class _ChartPainter extends CustomPainter {
  _ChartPainter({
    required this.readCount,
    required this.targetCount,
    required this.arcAnimation,
  });

  final int readCount;
  final int targetCount;
  final double arcAnimation;

  @override
  void paint(Canvas canvas, Size size) {
    final percentage = readCount / targetCount;
    final centerOffset = Offset(size.width / 2, size.height / 3);
    final radius = min(size.width / 2, size.height / 2);

    final gradientColor = <Color>[
      Colors.blue,
      Colors.green,
    ];
    final gradientStops = [0.1, 0.9];

    final shaderRect = Rect.fromCircle(center: centerOffset, radius: radius);
    final pie = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: gradientColor,
        stops: gradientStops,
      ).createShader(shaderRect);

    final outerPaint = Paint()
      ..color = Colors.blue.shade800
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = 30.0
      ..style = PaintingStyle.stroke;

    final innerPaint = Paint()
      ..color = Colors.blue.shade100
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = 25.0
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(shaderRect.center, size.width / 3.0, pie);

    if (readCount < targetCount) {
      canvas.drawArc(
        Rect.fromCircle(center: centerOffset, radius: radius / 1.5),
        pi / 2,
        2 * pi,
        false,
        outerPaint,
      );

      canvas.drawArc(
        Rect.fromCircle(center: centerOffset, radius: radius / 1.5),
        pi / 2,
        2 * pi * percentage * arcAnimation,
        false,
        innerPaint,
      );
    }
  }

  @override
  bool shouldRepaint(_ChartPainter oldDelegate) => true;
}
