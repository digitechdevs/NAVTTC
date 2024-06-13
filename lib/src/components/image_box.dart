import 'package:navttc/src/core/utils/app_exports.dart';

class ImageBox extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData? icon;

  const ImageBox({
    super.key,
    this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: AppSize.maxWidth,
        height: 200.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.subtitle),
        ),
        child: Icon(
          icon ?? Icons.image,
          size: 90.sp,
          color: AppColors.subtitle,
        ),
      ),
    );
  }
}
