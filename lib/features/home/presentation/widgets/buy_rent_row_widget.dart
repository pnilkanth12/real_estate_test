import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_demo/core/app_colors.dart';
import 'package:real_estate_demo/core/app_text_style.dart';
import 'package:real_estate_demo/features/home/presentation/widgets/counter_text.dart';

class BuyRentRowWidget extends StatelessWidget {
  const BuyRentRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.sp),
      margin: EdgeInsets.only(top: 48.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: (MediaQuery.sizeOf(context).width-56.sp)/2,
            width: (MediaQuery.sizeOf(context).width-56.sp)/2,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(500.sp)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    padding: EdgeInsets.only(top: 12.sp),
                    child: Text('BUY', style: AppTextStyles.font16w500(context, fontSize: 16.sp, color: Colors.white),)),
                Container(
                  padding: EdgeInsets.only(top: 16.sp),
                  child: Column(
                    children: [
                      const NumberCountAnimation(end: 1034,),
                      Text('offers', style: AppTextStyles.font12w400(context, fontSize: 16.sp, color: Colors.white),),
                    ],
                  ),
                ),
                Text('', style: AppTextStyles.font16w500(context, fontSize: 16.sp, color: Colors.white),),
              ],
            ),
          ).animate().scale(duration: 1000.ms, alignment: FractionalOffset.center, delay: 1500.ms),
          SizedBox(width: 10.sp,),
          Container(
            height: (MediaQuery.sizeOf(context).width-56.sp)/2,
            width: (MediaQuery.sizeOf(context).width-56.sp)/2,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(24.sp)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    padding: EdgeInsets.only(top: 12.sp),
                    child: Text('RENT', style: AppTextStyles.font16w500(context, fontSize: 16.sp, color: AppColors.gradientColor2),)),
                Container(
                  padding: EdgeInsets.only(top: 16.sp),
                  child: Column(
                    children: [
                      const NumberCountAnimation(end: 2212, color: AppColors.gradientColor2,),
                      Text(
                        'offers',
                        style: AppTextStyles.font12w400(context,
                            fontSize: 16.sp, color: AppColors.gradientColor2),
                      ),
                    ],
                  ),
                ),
                Text('', style: AppTextStyles.font16w500(context, fontSize: 16.sp, color: Colors.white),),
              ],
            ),
          ).animate().scale(duration: 1000.ms, alignment: FractionalOffset.center, delay: 1500.ms),
        ],
      ),
    );
  }
}
