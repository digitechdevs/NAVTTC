import 'package:navttc/src/components/custom_text.dart';
import 'package:navttc/src/core/theme/app_textstyles.dart';
import 'package:navttc/src/core/utils/app_exports.dart';

class ScreenHeader extends StatelessWidget {
  final bool? showLogo;

  const ScreenHeader({super.key, this.showLogo});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight.h * 2.5,
      width: AppSize.maxWidth,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (showLogo ?? true)
                ? Image.asset(AppAssets.logo)
                : const SizedBox.shrink(),
            (showLogo ?? true)
                ? 20.pw : 0.pw,
            CustomText(
              "NAVTTC Monitoring",
              alignment: Alignment.center,
              textStyle: AppTextStyles.headWhiteBoldTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
