import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_demo/core/app_colors.dart';
import 'package:real_estate_demo/core/app_text_style.dart';

class GreetingQuotes extends StatefulWidget {
  const GreetingQuotes({super.key,required this.text, });
  final String text;

  @override
  State<GreetingQuotes> createState() => _GreetingQuotesState();
}

class _GreetingQuotesState extends State<GreetingQuotes> with SingleTickerProviderStateMixin {

  late AnimationController _animController;
  late Animation<Offset> _animOffset;

  @override
  void initState() {
    // TODO: implement initState
    _animController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 1500),);
    final curve =
    CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset =
        Tween<Offset>(begin: const Offset(0.0, 0.35), end: Offset.zero)
            .animate(curve,);

    Timer(Duration(milliseconds: 1000), () {
      _animController.forward();
    });
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.sp,
      child: FadeTransition(
        opacity: _animController,
        child: SlideTransition(
          position: _animOffset,
          child: Text(
            widget.text,
            style: AppTextStyles.font16w500(context, fontSize: 40.sp,),
          ),
        ),
      ),
    );
  }
}
