import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_demo/core/app_text_style.dart';


import 'app_colors.dart';

class AppSearchTextFormField extends StatefulWidget {
  const AppSearchTextFormField({
    super.key,
    required this.controller,
    this.hint,
    required this.hints,
    this.maxLine,
    this.textInputType,
    this.inputFormatters,
    this.validator,
    this.prefixIcon,
    this.isReadOnly,
    this.borderColor,
    this.focusBorderColor,
    this.onChange,
    this.onSearchClick,
    this.textColor
  });

  final TextEditingController controller;
  final String? hint;
  final int? maxLine;
  final TextInputType? textInputType;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final List<String>? hints;
  final String? Function(String?)? validator;
  final bool? isReadOnly;
  final Color? borderColor;
  final Color? focusBorderColor;
  final Color? textColor;
  final Function(String? value)? onChange;
  final Function(String? value)? onSearchClick;

  @override
  State<AppSearchTextFormField> createState() => _AppSearchTextFormFieldState();
}

class _AppSearchTextFormFieldState extends State<AppSearchTextFormField> {

  int i=0;

  @override
  void initState() {
    // TODO: implement initState
    Timer.periodic(
      const Duration(seconds: 3),
          (Timer t){
        if(widget.controller.text.isEmpty) {
          getHints();
        }
      },
    );

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: widget.textInputType ?? TextInputType.text,
      validator: widget.validator,
      maxLines: widget.maxLine??1,
      readOnly: widget.isReadOnly??false,
      inputFormatters: widget.inputFormatters??[],
      style: AppTextStyles.font14w600(context, fontSize: 14.sp, color: widget.textColor??Colors.black.withOpacity(0.5),),
      onChanged: (val){
        print('Change Val:: $val');
        if(widget.onChange!=null){
          widget.onChange!(val);
        }
      },
      decoration: InputDecoration(
        //prefixIcon: widget.prefixIcon,
        fillColor: Colors.white,
        filled: true,
        hintText: widget.hints!.isNotEmpty?widget.hints![i]:widget.hint,
        //hintFadeDuration: const Duration(seconds: 1),
        //labelText: hint,
        prefixIcon: IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.black38,
            size: 24.sp,
          ),
          onPressed: () {
            if (widget.onSearchClick != null) {
              widget.onSearchClick!(widget.controller.text);
            }
          },
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.sp,vertical: 4.sp),
        hintStyle: TextStyle(fontSize: 14.sp, color: AppColors.black.withOpacity(0.5), fontWeight: FontWeight.w400,),
        labelStyle: TextStyle(fontSize: 18.sp, color: AppColors.black,),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100.sp)),
          borderSide: const BorderSide(color: AppColors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100.sp)),
          borderSide: const BorderSide(color: AppColors.black),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100.sp)),
          borderSide: const BorderSide(color:  AppColors.black),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100.sp)),
          borderSide: const BorderSide(color:  AppColors.black),
        ),
      ),
    );
  }

  String? getHints() {
    String? hintString;
    if (widget.hints!.isNotEmpty) {
      hintString = widget.hints![i];
      //debugLogPrint('Hints is...$hintString');
      if (i == widget.hints!.length - 1) {
        i = 0;
      } else {
        i++;
      }
      if (widget.controller.text.isEmpty) {
        setState(() {});
      }
      return hintString;
    } else {
      return 'Search...';
    }
  }
}
