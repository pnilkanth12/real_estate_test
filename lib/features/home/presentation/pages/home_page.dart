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
import 'package:real_estate_demo/features/home/presentation/widgets/counter_text.dart';
import 'package:real_estate_demo/features/home/presentation/widgets/greeting_quotes.dart';
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
  final scrollController = ScrollController();
  final listViewKey = GlobalKey();
  final animatedBoxKey = GlobalKey();
  late AnimationController animatedBoxEnterAnimationController;
  static const enterAnimationMinHeight = 100.0;

  @override
  void initState() {
    // TODO: implement initState
    animatedBoxEnterAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    scrollController.addListener(() {
      _updateAnimatedBoxEnterAnimation();
    });
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
        key: listViewKey,
        physics: const ClampingScrollPhysics(),
        controller: scrollController,
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
            greetingText(context),
            _buyRentRow(context),
            const Images(),
          ],
        ),
      ),
    );
  }

  Widget greetingText(BuildContext context) {
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

  Widget _buyRentRow(BuildContext context){
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

  _updateAnimatedBoxEnterAnimation() {
    if (animatedBoxEnterAnimationController.status != AnimationStatus.dismissed) {
      return; // animation already in progress/finished
    }

    RenderObject? listViewObject = listViewKey.currentContext?.findRenderObject();
    RenderObject? animatedBoxObject = animatedBoxKey.currentContext?.findRenderObject();
    if (listViewObject == null || animatedBoxObject == null) return;

    final listViewHeight = listViewObject.paintBounds.height;
    final animatedObjectTop = animatedBoxObject.getTransformTo(listViewObject).getTranslation().y;

    final animatedBoxVisible = (animatedObjectTop + enterAnimationMinHeight < listViewHeight);

    if (animatedBoxVisible) {
      // start animation
      animatedBoxEnterAnimationController.forward();
    }
  }
}
