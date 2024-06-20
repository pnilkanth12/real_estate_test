import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_demo/core/app_text_style.dart';

class NumberCountAnimation extends StatefulWidget {
  const NumberCountAnimation({super.key, this.start=0, this.end, this.color});
  final int? start;
  final int? end;
  final Color? color;


  @override
  _NumberCountAnimationState createState() => _NumberCountAnimationState();
}

class _NumberCountAnimationState extends State<NumberCountAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = IntTween(begin: widget.start, end: widget.end).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    Timer(Duration(milliseconds: 1200), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${_animation.value}',
      style: AppTextStyles.font20w700(context,
          fontSize: 44.sp,
          fontWeight: FontWeight.w900,
          color: widget.color ?? Colors.white),
    );
  }
}