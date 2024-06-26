import 'package:flutter/material.dart';
import 'package:navttc/src/components/custom_text.dart';
import 'package:navttc/src/core/theme/app_textstyles.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool showIcon;
  final String? title;

  const CustomButton({
    super.key,
    this.onTap,
    this.showIcon = true,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            if (showIcon)
              Icon(
                Icons.person,
                color: Colors.white,
              ),
            if (showIcon) SizedBox(width: 10),
            Expanded(
              child: CustomText(
                title ?? "",
                alignment: Alignment.centerLeft,
                textStyle: AppTextStyles.middleBlackBoldTextStyle.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
