import 'dart:io';

import 'package:navttc/src/core/utils/app_exports.dart';

class ImageBox extends StatelessWidget {
  
  final VoidCallback? onTap;
  final IconData? icon;
  final File? image;

  const ImageBox({
    super.key,
    this.onTap,
    this.icon, required this.image,
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
        child: image != null ? Image.file(image!, fit: BoxFit.cover,) : Icon(
          icon ?? Icons.image,
          size: 90.sp,
          color: AppColors.subtitle,
        ),
      ),
    );
  }
}
