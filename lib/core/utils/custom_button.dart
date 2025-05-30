import 'package:flutter/material.dart';
import 'package:mutual_fund_assignment/common/app_colors.dart';
import 'package:mutual_fund_assignment/common/app_text_styles.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final double? height;
  final double? width;
  final double? borderRadius;
  final Color? buttonColor;
  final Color? textColor;
  final double? textSize;
  final Function()? onTap;
  final bool? isLoader;
  final bool? isBorder;
  const CustomButton({
    super.key,
    required this.buttonName,
    this.height,
    this.width,
    this.borderRadius,
    this.buttonColor,
    this.textColor,
    this.textSize,
    this.onTap,
    this.isLoader = false,
    this.isBorder,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (isLoader != null && !isLoader!) ? onTap : null,
      child: Container(
        height: height ?? size.width * 0.1,
        width: width ?? size.width * 0.5,
        decoration: BoxDecoration(
            border: (isBorder != null && isBorder!)
                ? Border.all(color: AppColors.buttonColor)
                : null,
            color: buttonColor ?? AppColors.buttonColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 5)),
        child: Center(
          child: MyText(
                  text :buttonName,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  textStyle: AppTextStyle.boldStyle().copyWith(
                    color: textColor ?? AppColors.buttonTextColor,
                    fontSize: textSize ?? 16,
                  ),
                )

        ),
      ),
    );
  }
}
