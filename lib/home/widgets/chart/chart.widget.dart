import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatefulWidget {
  final double percent;

  const ChartWidget({
    Key? key,
    required this.percent,
  }) : super(key: key);

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  void _initAnimation() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation =
        Tween<double>(begin: 0.0, end: widget.percent).animate(_controller);

    _controller.forward();
  }

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) => Stack(
          children: <Widget>[
            Center(
              child: Container(
                height: 70,
                width: 70,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  value: _animation.value,
                  backgroundColor: AppColors.chartSecondary,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                ),
              ),
            ),
            Center(
                child: Text("${(_animation.value * 100).toInt()}%",
                    style: AppTextStyles.heading)),
          ],
        ),
      ),
    );
  }
}
