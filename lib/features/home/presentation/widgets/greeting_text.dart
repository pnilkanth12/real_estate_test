import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_demo/core/app_colors.dart';
import 'package:real_estate_demo/core/app_text_style.dart';

class GreetingText extends StatefulWidget {
  const GreetingText({super.key});

  @override
  State<GreetingText> createState() => _GreetingTextState();
}

class _GreetingTextState extends State<GreetingText> {

  double opacity = 0.5;
  String text = 'Hi, Marina';

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    toggleOpacity();
    super.didChangeDependencies();
  }

  void toggleOpacity() {
    setState(() {
      opacity = opacity == 1.0 ? 0.5 : 1.0;
      text = opacity == 1.0 ? 'GeeksforGeeks' : 'Geeks Premier League 2023';
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Text(
    //   text??'Hello',
    //   //'Hi, Marina',
    //   style: AppTextStyles.font16w500(
    //     context,
    //     fontSize: 24.sp,
    //     color: AppColors.gradientColor2,
    //   ),
    // );
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(seconds: 3), // Animation duration
      child: Text(
        text??'Hello',
        //'Hi, Marina',
        style: AppTextStyles.font16w500(
          context,
          fontSize: 24.sp,
          color: AppColors.gradientColor2,
        ),
      ),
    );
  }
}
