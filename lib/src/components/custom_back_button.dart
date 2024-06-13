import 'dart:core';

import 'package:navttc/src/core/utils/app_exports.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onTap;

  const CustomBackButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? AppRouter.pop,
      child: Container(
        width: AppSize.buttonHeight,
        height: AppSize.buttonHeight,
        decoration: BoxDecoration(
          color: AppColors.primaryWhite,
          boxShadow: [
            BoxShadow(
              color: AppColors.subtitle.withOpacity(0.3),
              offset: const Offset(5.0, 5.0),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.primaryBlack,
          size: AppSize.iconSize,
        ),
      ),
    );
  }
}

class PlainBackButton extends StatelessWidget {
  final VoidCallback? onTap;

  const PlainBackButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap ?? AppRouter.pop,
      icon: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: AppColors.primaryBlack,
        size: AppSize.iconSize,
      ),
    );
  }
}
