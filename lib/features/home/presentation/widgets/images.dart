import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_demo/core/app_images.dart';
import 'package:real_estate_demo/features/home/presentation/widgets/landscape_image/landscape_image.dart';
import 'package:real_estate_demo/features/home/presentation/widgets/portrait_image/portrait_image.dart';
import 'package:real_estate_demo/features/home/presentation/widgets/top_square_image/top_square_image.dart';

class Images extends StatefulWidget {
  const Images({super.key});

  @override
  State<Images> createState() => _ImagesState();
}

class _ImagesState extends State<Images> with SingleTickerProviderStateMixin {

  late AnimationController _animController;
  late Animation<Offset> _animOffset;

  @override
  void initState() {
    // TODO: implement initState
    _animController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 800),);
    final curve =
    CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset =
        Tween<Offset>(begin: const Offset(0.0, 0.35), end: Offset.zero)
            .animate(curve,);

    Timer(const Duration(milliseconds: 2000), () {
      _animController.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animController,
      child: SlideTransition(
        position: _animOffset,
        child: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 32.sp),
      padding: EdgeInsets.only(
        left: 8.sp,
        right: 8.sp,
        top: 8.sp,
      ),
      width: double.infinity,
      height: 600.sp,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.sp),
          topRight: Radius.circular(32.sp),
        ),
      ),
      child: Column(
        children: [
          const LandscapeImage(),
          SizedBox(height: 12.sp,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const PortraitImage(),
              Column(
                children: [
                  const TopSquareImage(image: AppImages.realEstate4Image, text: 'Trefoleva St. 43',),
                  SizedBox(
                    height: 12.sp,
                  ),
                  const TopSquareImage(image: AppImages.realEstate3Image, text: 'Sedova St., 22',),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
