import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_demo/core/app_colors.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({super.key, this.icon});
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(child: Icon(icon, size: 50.sp, color: AppColors.primaryColor,)),
    );
  }
}
