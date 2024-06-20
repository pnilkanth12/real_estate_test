import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_demo/core/app_colors.dart';

class SwipeAnimation extends StatefulWidget {
  const SwipeAnimation({super.key});

  @override
  State<SwipeAnimation> createState() => _SwipeAnimationState();
}

class _SwipeAnimationState extends State<SwipeAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<Offset> _animOffset;
  //late Animation<double> scaleAnim;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _animController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1290),);
    final curve = CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset = Tween<Offset>(begin:const Offset(-0.7,1.46),end: const Offset(1.65,1.46)).animate(_animController);


    Timer(Duration.zero, () {
      _animController.forward();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(top: 20.sp),
      child: SlideTransition(
        position: _animOffset,
        child: Container(
          margin: EdgeInsets.all(4.sp),
          height: 48.sp,
          width: 48.sp,
          decoration: BoxDecoration(
            //color: Colors.red,
            color: Colors.white,
            borderRadius: BorderRadius.circular(48.sp),
          ),
          child: Icon(
            Icons.arrow_forward_ios,
            color: AppColors.gradientColor2,
            size: 12.sp,
          ),
        ).animate().scaleX(),
      ),
    );

  }
}
