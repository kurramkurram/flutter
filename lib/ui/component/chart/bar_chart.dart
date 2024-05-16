import 'package:flutter/material.dart';

class BarChart extends StatefulWidget {
  const BarChart({
    super.key,
    required this.read,
    required this.max,
    required this.delay,
  });

  final int read;
  final int max;
  final int delay;

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
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Future.delayed(Duration(milliseconds: widget.delay * 100), () {
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Stack(
          children: [
            CustomPaint(
              painter: _ChartPainter(
                read: widget.read,
                max: widget.max,
                animation: _animation.value,
              ),
              child: const SizedBox(
                width: 40,
                height: 150,
              ),
            ),
            SizedBox(
              width: 40,
              child: Center(child: Text('${widget.read}')),
            ),
          ],
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
    required this.read,
    required this.max,
    required this.animation,
  });

  final int read;
  final int max;
  final double animation;

  @override
  void paint(Canvas canvas, Size size) {
    final barOuter = Paint()
      ..color = Colors.blue.shade800
      ..strokeWidth = 28.0
      ..style = PaintingStyle.stroke;

    final barInner = Paint()
      ..color = Colors.red.shade100
      ..strokeWidth = 25.0
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(size.width / 2, 0),
      Offset(size.width / 2, 150),
      barOuter,
    );

    double percentage = read / max;
    canvas.drawLine(
      Offset(size.width / 2, 150 - 150 * percentage * animation),
      Offset(size.width / 2, 150),
      barInner,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
