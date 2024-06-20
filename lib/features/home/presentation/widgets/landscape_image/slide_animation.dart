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

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _animController = AnimationController(vsync: this, duration: const Duration(milliseconds: 960),);
    _animOffset = Tween<Offset>(begin:const Offset(-0.5,2.1),end: const Offset(5.25,2.1)).animate(_animController);

    Timer(const Duration(milliseconds: 2800), () {
      _animController.forward();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // return SlideTransition(
    //   position: _animOffset,
    //   child: Container(
    //     margin: EdgeInsets.all(4.sp),
    //     height: 48.sp,
    //     width: 48.sp,
    //     decoration: BoxDecoration(
    //         color: Colors.red, borderRadius: BorderRadius.circular(48.sp)),
    //     child: Icon(
    //       Icons.arrow_forward_ios,
    //       color: AppColors.gradientColor2,
    //       size: 12.sp,
    //     ),
    //   ).animate().scaleX(),
    // );

    return Padding(
      padding: EdgeInsets.only(top: 20.sp),
      child: SlideTransition(
        position: _animOffset,
        child: Container(
          margin: EdgeInsets.all(4.sp),
          height: 46.sp,
          width: 46.sp,
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

    return Positioned(
      bottom: 12.sp,
      left: 12.sp,
      right: 12.sp,
      child: Center(
        child: Stack(
          children: [
            Container(
              height: 56.sp,
              width: MediaQuery.sizeOf(context).width-40,
              decoration: BoxDecoration(
                  color: AppColors.background2.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(52.sp)
              ),
            ),
            SlideTransition(
              position: _animOffset,
              child: Positioned(
                right: 2,
                child: Container(
                  margin: EdgeInsets.all(4.sp),
                  height: 48.sp,
                  width: 48.sp,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(48.sp)
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.gradientColor2,
                    size: 12.sp,
                  ),
                ),
              ).animate().scaleX(),
            ),
          ],
        ),
      ),
    );
  }
}
