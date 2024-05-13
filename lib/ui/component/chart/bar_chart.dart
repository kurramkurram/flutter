import 'package:flutter/material.dart';
import 'package:flutter_app/util/log.dart';

class BarChart extends StatefulWidget {
  const BarChart({super.key});

  @override
  State<StatefulWidget> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  late Tween _tween;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _tween = Tween<double>(begin: 0, end: 1);

    _animation = _animationController.drive(_tween);
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          painter: _ChartPainter(animation: _animation.value),
          child: const SizedBox(
            width: 100,
            height: 500,
          ),
        );
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
    required this.animation,
  });

  final double animation;

  @override
  void paint(Canvas canvas, Size size) {
    final barOuter = Paint()
      ..color = Colors.blue.shade800
      ..strokeWidth = 30.0
      ..style = PaintingStyle.stroke;

    final barInner = Paint()
      ..color = Colors.red.shade100
      ..strokeWidth = 28.0
      ..style = PaintingStyle.stroke;
    Log.d('animation = $animation');
    canvas.drawLine(const Offset(100, 100), const Offset(100, 50), barOuter);
    canvas.drawLine(
        const Offset(100, 100), Offset(100, 100 - 40 * animation), barInner);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
