import 'package:flutter/cupertino.dart';
import 'package:navttc/src/components/custom_text.dart';
import 'package:navttc/src/core/theme/app_textstyles.dart';
import 'package:navttc/src/core/utils/app_exports.dart';

class SelectableTile extends StatelessWidget {
  final String? title;
  final bool? selected;
  final VoidCallback? onTap;

  const SelectableTile({
    super.key,
    this.onTap,
    this.title,
    this.selected = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20.sp),
        decoration: BoxDecoration(
          color: (selected ?? false)
              ? AppColors.primaryColor
              : AppColors.primaryWhite,
          border: Border.all(
              color: (selected ?? false)
                  ? AppColors.primaryWhite
                  : AppColors.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SvgPicture.asset(AppAssets.building,
                color: (selected ?? false)
                    ? AppColors.primaryWhite
                    : AppColors.primaryColor),
            10.pw,
            CustomText(
              title ?? "Instructor Details",
              alignment: Alignment.centerLeft,
              textStyle: AppTextStyles.middleBlackBoldTextStyle.copyWith(
                  color: (selected ?? false)
                      ? AppColors.primaryWhite
                      : AppColors.primaryColor),
            ),
            const Spacer(),
            (selected ?? false)
                ? Icon(CupertinoIcons.check_mark,
                    color: (selected ?? false)
                        ? AppColors.primaryWhite
                        : AppColors.primaryColor)
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
