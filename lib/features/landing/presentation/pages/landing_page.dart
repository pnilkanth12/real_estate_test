import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_demo/core/app_images.dart';
import 'package:real_estate_demo/core/app_text_style.dart';
import 'package:real_estate_demo/features/dashboard/presentation/pages/dashboard_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key, this.color});
  final Color? color;
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  @override
  void initState() {
    // TODO: implement initState
    if(widget.color==null) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => const DashboardPage(),
            ),
                (route) => false);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.deal,
            height: 120.sp,
            width: 120.sp,
          ),
          SizedBox(height: 24.sp,),
          Text(
            'Real Estate',
            style: AppTextStyles.font20w700(context, color: Colors.white, fontSize: 48.sp),
          ).animate().fade(duration: const Duration(seconds: 2))
        ],
      ),
    );
  }
}
