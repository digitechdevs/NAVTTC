import '../utils/app_exports.dart';

class AppDecorations {
  static BoxDecoration topCurved({Color? color}) => BoxDecoration(
    color: color ?? AppColors.primaryWhite,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(AppSize.borderRadius * 2),
      topRight: Radius.circular(AppSize.borderRadius * 2),
    ),
  );

  static BoxDecoration allCurved({Color? color}) {
    return BoxDecoration(
      color: color ?? AppColors.primaryWhite,
      boxShadow: [
        BoxShadow(color: color ?? AppColors.borderGrey),
      ],
      borderRadius: BorderRadius.all(
        Radius.circular(AppSize.borderRadius),
      ),
    );
  }
}
