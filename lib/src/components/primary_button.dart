import 'package:navttc/src/core/utils/app_exports.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool loader, enabled;
  final Color? backgroundColor, textColor, borderColor;
  final double height;
  final double width;

  const PrimaryButton({
    super.key,
    this.textColor,
    this.borderColor,
    this.height = 56,
    required this.text,
    required this.onTap,
    this.enabled = true,
    this.loader = false,
    this.backgroundColor,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: enabled ? onTap : null,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.5,
              color: borderColor ?? AppColors.borderGrey,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: enabled
              ? loader
                  ? AppColors.primaryColor
                  : (backgroundColor ?? AppColors.primaryColor)
              : AppColors.borderGrey,
          elevation: 0,
        ),
        child: loader == true
            ? const SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 4.0,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: text == 'Done',
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: SvgPicture.asset(AppAssets.iconCheck),
                    ),
                  ),
                  Text(
                    text,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: enabled
                              ? (textColor ?? Colors.white)
                              : AppColors.borderGrey,
                        ),
                  ),
                ],
              ),
      ),
    );
  }
}
