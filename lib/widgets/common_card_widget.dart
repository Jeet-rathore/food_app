import 'package:flutter/material.dart';
import 'package:food_app/Them/colour.dart';
import 'package:food_app/Them/sizeconfig.dart';
import 'package:food_app/appconfig/assets.dart';
import 'package:food_app/widgets/appbutton.dart';

import 'package:food_app/Them/spacing.dart';

class CommonCardWidget extends StatelessWidget {
  final String imagePath;
  final String labelTop;
  final String labelBottom;
  final VoidCallback onTap;

  const CommonCardWidget({
    Key? key,
    required this.imagePath,
    required this.labelTop,
    required this.labelBottom,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context); // ensure initialization

    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipOval(
                child: Container(
                  width: SizeConfig.getProportionalWidth(context, 180),
                  height: SizeConfig.getProportionalHeight(context, 180),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(Assets.Ellips),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: SizeConfig.getProportionalWidth(context, 160),
                height: SizeConfig.getProportionalHeight(context, 160),
                child: Image.asset(imagePath, fit: BoxFit.contain),
              ),
            ],
          ),
          SizedBox(height: Spacing.space(3)), // 12px spacing
          CommonButton(
            text: "$labelTop\n$labelBottom",
            onPressed: onTap,
            width: SizeConfig.getProportionalWidth(context, 160),
            height: null,
            textStyle: const TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w800,
              fontSize: 17,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
