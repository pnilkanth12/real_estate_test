import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_demo/core/app_images.dart';
import 'package:real_estate_demo/core/app_text_style.dart';
import 'package:real_estate_demo/features/home/presentation/widgets/portrait_image/scale_animation.dart';
import 'package:real_estate_demo/features/home/presentation/widgets/portrait_image/slide_animation.dart';

class PortraitImage extends StatelessWidget {
  const PortraitImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24.sp),
          child: Image.asset(
            AppImages.realEstate2Image,
            width: (MediaQuery.sizeOf(context).width-40.sp)/2,
            height: 352.sp,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          left: 12.sp,
          right: 12.sp,
          bottom: 14.sp,
          child: const ScaleAnimation(),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 12.0),
          child: SwipeAnimation(),
        ),
        Positioned(
          left: 12.sp,
          bottom: 14.sp,
          child: Container(
            height: 50.sp,
            width: (MediaQuery.sizeOf(context).width/2)-60.sp,
            padding: EdgeInsets.only(left: 12.sp, right: 50.sp),
            child: Center(
              child: Text(
                'Gabina St., 11',
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.font20w700(
                    context,
                    fontSize: 16.sp,
                    color: Colors.black.withOpacity(0.5)
                ),
              ).animate().fade(duration: 500.ms,delay: 1000.ms),
            ),
          ),
        ),
      ],
    );
  }
}
