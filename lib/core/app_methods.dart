import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_demo/core/app_colors.dart';
import 'package:real_estate_demo/core/app_text_style.dart';

class AppMethods{
  static Future<BitmapDescriptor> createCustomMarkerBitmap1(BuildContext context, String title, IconData icon) async {
    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = AppColors.primaryColor;
    final double size = 120.sp;

    // Draw the background
    canvas.drawRect(
      Rect.fromLTWH(0.0, 0.0, 300.sp, 100.sp),
      paint,
    );

    // Draw the icon
    TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);
    textPainter.text = TextSpan(
      text: String.fromCharCode(icon.codePoint),
      style: AppTextStyles.font12w600(context, color: Colors.white, fontSize: 32.sp),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(size.sp * 0.25, size.sp * 0.05));

    // Draw the text
    textPainter.text = TextSpan(
      text: title,
      style: AppTextStyles.font12w600(context, color: Colors.white, fontSize: 20.sp),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(size.sp * 0.1, size.sp * 0.65));

    final img = await pictureRecorder.endRecording().toImage(size.sp.toInt(), size.sp.toInt());
    final data = await img.toByteData(format: ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
  }
}