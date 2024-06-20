import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_demo/core/app_colors.dart';

class ScaleAnimation extends StatefulWidget {
  const ScaleAnimation({super.key});

  @override
  State<ScaleAnimation> createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  //late Animation<Offset> _animOffset;
  late Animation<double> scaleAnim;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _animController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    final curve = CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    //_animOffset = Tween<Offset>(begin:const Offset(0.0,2.0),end: const Offset(5.0,2.0)).animate(_animController);

    scaleAnim =
        Tween<double>(begin: 0.0, end: (MediaQuery.sizeOf(context).width/2) - 50.sp)
            .animate(
      CurvedAnimation(
        parent: _animController,
        curve: Curves.easeInOut,
      ),
    );

    Timer(Duration.zero, () {
      _animController.forward();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: scaleAnim,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: scaleAnim.value,
                  height: 52.sp,
                  decoration: BoxDecoration(
                      color: AppColors.gradientColor4.withOpacity(0.6),
                      //color: Colors.red,
                      borderRadius: BorderRadius.circular(100.sp)),
                ),
              ],
            );
          },
        ),
      ],
    );

  }
}
