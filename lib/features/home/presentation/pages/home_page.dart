import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_demo/core/app_colors.dart';
import 'package:real_estate_demo/core/app_images.dart';
import 'package:real_estate_demo/core/app_text_style.dart';
import 'package:real_estate_demo/features/home/presentation/widgets/buy_rent_row_widget.dart';
import 'package:real_estate_demo/features/home/presentation/widgets/counter_text.dart';
import 'package:real_estate_demo/features/home/presentation/widgets/greeting_quotes.dart';
import 'package:real_estate_demo/features/home/presentation/widgets/greeting_text.dart';
import 'package:real_estate_demo/features/home/presentation/widgets/images.dart';
import 'package:real_estate_demo/features/home/presentation/widgets/landscape_image/landscape_image.dart';
import 'package:real_estate_demo/features/home/presentation/widgets/portrait_image/portrait_image.dart';
import 'package:real_estate_demo/features/home/presentation/widgets/top_square_image/top_square_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final animatedBoxKey = GlobalKey();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _blocBody(context),
    );
  }

  Widget _blocBody(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
          colors: [
            AppColors.gradientColor1.withOpacity(0.0),
            AppColors.gradientColor1.withOpacity(0.1),
            AppColors.primaryColor.withOpacity(0.3),
          ],
        ),
      ),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.sp,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:EdgeInsets.symmetric(horizontal: 16.sp, vertical: 12.sp),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.sp)
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.location_on, color: AppColors.gradientColor2,size: 24.sp,),
                        Text(
                          'Saint Petersburg',
                          style: AppTextStyles.font12w600(
                            context,
                            fontSize: 12.sp,
                            color: AppColors.gradientColor2,
                          ),
                        ),
                      ],
                    ).animate().fade(duration: 400.ms,delay: 600.ms),
                  ).animate().scale(duration: 800.ms, alignment: FractionalOffset.centerLeft),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                      ),
                      child: Image.asset(
                        AppImages.profileIcon,
                        height: 40.sp,
                        width: 40.sp,
                      ),
                    ),
                  ).animate().scale(duration: 800.ms, alignment: FractionalOffset.center),
                ],
              ),
            ),
            const GreetingText(),
            const BuyRentRowWidget(),
            const Images(),
          ],
        ),
      ),
    );
  }
}
