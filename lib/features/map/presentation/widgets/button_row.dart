import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_demo/core/app_colors.dart';
import 'package:real_estate_demo/core/app_images.dart';
import 'package:real_estate_demo/core/app_text_style.dart';

class ButtonRowWidget extends StatefulWidget {
  const ButtonRowWidget({super.key});

  @override
  State<ButtonRowWidget> createState() => _ButtonRowWidgetState();
}

class _ButtonRowWidgetState extends State<ButtonRowWidget> {
  GlobalKey stackKey = GlobalKey();

  String selectedPopupValue='c';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width-32.sp,
      margin: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            children: [
              GestureDetector(
                key: stackKey,
                onTap: (){
                  RenderBox box = stackKey.currentContext?.findRenderObject() as RenderBox;
                  Offset position = box.localToGlobal(Offset.zero); //this is global position
                  double y = position.dy;
                  double x = position.dx;
                  _showPopupMenu(x,y);
                },
                child: Container(
                  height: 50.sp,
                  width: 50.sp,
                  padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade500.withOpacity(0.7),
                      //color: AppColors.gradientColor2,
                      borderRadius: BorderRadius.all(Radius.circular(100.sp))
                  ),
                  child: Image.asset(
                    AppImages.stackIcon,
                    height: 16.sp,
                    width: 16.sp,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 8.sp,),
              Container(
                height: 50.sp,
                width: 50.sp,
                padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
                decoration: BoxDecoration(
                    color: Colors.grey.shade500.withOpacity(0.7),
                    //color: AppColors.gradientColor2,
                    borderRadius: BorderRadius.all(Radius.circular(100.sp))
                ),
                child: Image.asset(
                  AppImages.navigationIcon,
                  height: 16.sp,
                  width: 16.sp,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          Container(
            height: 50.sp,
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
            decoration: BoxDecoration(
                color: Colors.grey.shade500.withOpacity(0.7),
                //color: AppColors.gradientColor2,
                borderRadius: BorderRadius.all(Radius.circular(100.sp))
            ),
            child: Row(
              children: [
                Image.asset(
                  AppImages.menuIcon,
                  height: 16.sp,
                  width: 16.sp,
                  color: Colors.white,
                ),
                SizedBox(width: 8.sp,),
                Text('List of variant', style: AppTextStyles.font12w400(context, color: Colors.white, fontWeight: FontWeight.w400),)
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showPopupMenu(double? x,double? y) async {

    await showMenu(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.sp)),
      color: AppColors.popupMenuBackground,
      position: RelativeRect.fromLTRB(x!+8.sp, y!-154.sp, 100.sp, 100.sp),
      items: [
        popupMenuItem('a', AppImages.insuranceIcon, 'Cosy areas'),
        popupMenuItem('b', AppImages.walletIcon, 'Price'),
        popupMenuItem('c', AppImages.profileIcon, 'Infrastructure'),
        popupMenuItem('d', AppImages.stackIcon, 'Without any layer'),
      ],
      elevation: 8.0,
    );
  }

  PopupMenuItem popupMenuItem(String value,String icon, String string, ){
    return PopupMenuItem<String>(
      value: value,
      height: 32.sp,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(icon, height: 16.sp, width: 16.sp,color: selectedPopupValue==value?AppColors.primaryColor:Colors.grey),
          SizedBox(width: 8.sp,),
          Text(
            string,
            style: AppTextStyles.font12w400(context, color: selectedPopupValue==value?AppColors.primaryColor:Colors.grey),
          ),
        ],
      ),
      onTap: (){
        setState(() {
          selectedPopupValue=value;
        });
      },
    );
  }
}
