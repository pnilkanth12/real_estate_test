import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_demo/core/app_colors.dart';
import 'package:real_estate_demo/core/app_text_style.dart';

import '../../../home/presentation/widgets/greeting_quotes.dart';

class GreetingText extends StatelessWidget {
  const GreetingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 48.sp,),
          Text(
            'Hi, Marina',
            style: AppTextStyles.font16w500(context, fontSize: 24.sp, color: AppColors.gradientColor2),
          ).animate().fade(duration: 800.ms, delay: 600.ms),
          const GreetingQuotes(text: 'let\'s select your',),
          const GreetingQuotes(text: 'perfect place',),
        ],
      ),
    );
  }
}
