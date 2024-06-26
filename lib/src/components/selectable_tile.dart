import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:navttc/src/components/custom_text.dart';
import 'package:navttc/src/core/theme/app_textstyles.dart';
import 'package:navttc/src/core/utils/app_exports.dart';

class SelectableTile extends StatelessWidget {
  final String? title;
  final bool? selected;
  final bool? isGray;
  final Widget? suffix;
  final VoidCallback? onTap;
  final bool showIcon;

  const SelectableTile({
    super.key,
    this.onTap,
    this.title,
    this.selected = true,
    this.isGray = false,
    this.showIcon = true, this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    Color getBackgroundColor() {
      if (isGray ?? false) {
        return AppColors.tradegray;
      }
      return (selected ?? false) ? AppColors.primaryColor : AppColors.primaryWhite;
    }

    Color getTextColor() {
      if (isGray ?? false) {
        return AppColors.primaryBlack;
      }
      return (selected ?? false) ? AppColors.primaryWhite : AppColors.primaryColor;
    }

    Color getBorderColor() {
      if (isGray ?? false) {
        return AppColors.primaryBlack;
      }
      return (selected ?? false) ? AppColors.primaryWhite : AppColors.primaryColor;
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          color: getBackgroundColor(),
          border: Border.all(color: getBorderColor()),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            if (showIcon)
              SvgPicture.asset(
                AppAssets.building,
                color: getTextColor(),
              ),
              
            if (showIcon) SizedBox(width: 10.sp),
            Expanded(
              child: CustomText(
                title ?? "Instructor Details",
                alignment: Alignment.centerLeft,
                textStyle: AppTextStyles.middleBlackBoldTextStyle.copyWith(
                  color: getTextColor(),
                ),
              ),
            ),
            if ((selected ?? false) && !(isGray ?? false))
            const Spacer(),
            if ((selected ?? false) && !(isGray ?? false))
              Icon(
                CupertinoIcons.check_mark,
                color: getTextColor(),
              ),
            suffix  ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

