import 'package:ecoresturant/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CountButtonWidget extends StatelessWidget {
  final bool isAdd;
  final Function()? onTap;
  final double rightPadding;
  const CountButtonWidget({
    Key? key,
    this.isAdd = true,
    required this.onTap,
    required this.rightPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          left: 16,
          right: rightPadding,
        ),
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            shape: BoxShape.rectangle,
            color: isAdd ? AppColors.kTanColor : AppColors.kwhiteColor),
        child: Icon(
          isAdd == true ? Icons.add : Icons.remove,
          color: isAdd ? AppColors.kwhiteColor : AppColors.kblueColor,
        ),
      ),
    );
  }
}
