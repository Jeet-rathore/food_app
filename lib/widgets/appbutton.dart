import 'package:flutter/material.dart';
import 'package:food_app/Them/colour.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final List<Color>? gradientColors;

  const CommonButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.textStyle,
    this.gradientColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration;

    if (gradientColors == null) {
      // default gradient
      decoration = BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.lightYellow, AppColors.darkYellow],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(8),
      );
    } else if (gradientColors!.length == 1) {
      // single color background
      decoration = BoxDecoration(
        color: gradientColors![0],
        borderRadius: BorderRadius.circular(8),
      );
    } else {
      // gradient with multiple colors
      decoration = BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors!,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(8),
      );
    }

    return Container(
      width: width ?? double.infinity,
      height: height,
      decoration: decoration,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: textStyle ??
              const TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
        ),
      ),
    );
  }
}
