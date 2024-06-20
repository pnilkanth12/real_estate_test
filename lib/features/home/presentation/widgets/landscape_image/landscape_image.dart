import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_demo/core/app_images.dart';
import 'package:real_estate_demo/core/app_text_style.dart';
import 'package:real_estate_demo/features/home/presentation/widgets/landscape_image/scale_animation.dart';
import 'package:real_estate_demo/features/home/presentation/widgets/landscape_image/slide_animation.dart';

class LandscapeImage extends StatelessWidget {
  const LandscapeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24.sp),
          child: Image.asset(
            AppImages.realEstate1Image,
            width: double.infinity,
            height: 200.sp,
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
          padding: EdgeInsets.only(left: 24.0),
          child: SwipeAnimation(),
        ),
        Positioned(
          left: 12.sp,
          bottom: 14.sp,
          child: SizedBox(
            height: 48.sp,
            width: MediaQuery.sizeOf(context).width-60.sp,
            child: Center(
              child: Text(
                'Gladkova St., 25',
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
