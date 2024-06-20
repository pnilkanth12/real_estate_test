import 'package:flutter/material.dart';
import 'package:real_estate_demo/core/app_colors.dart';

class PopUpMenuTile extends StatelessWidget {
  const PopUpMenuTile(
      {key,
        required this.icon,
        required this.title,
        this.isActive = false})
      : super(key: key);
  final IconData icon;
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(icon,
            color: isActive
                ? AppColors.primaryColor
                : Colors.black),
        const SizedBox(
          width: 8,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headline4?.copyWith(
              color: isActive
                  ? AppColors.primaryColor
                  : Colors.black),
        ),
      ],
    );
  }
}