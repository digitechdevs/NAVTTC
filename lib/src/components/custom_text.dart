import 'package:navttc/src/core/theme/app_textstyles.dart';
import 'package:navttc/src/core/utils/app_exports.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final AlignmentGeometry? alignment;

  const CustomText(
    this.text, {
    super.key,
    this.alignment,
    this.textStyle,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.topLeft,
      child: Text(
        text,
        textAlign: textAlign ?? TextAlign.start,
        style: textStyle ?? AppTextStyles.simpleBlackTextStyle(),
      ),
    );
  }
}
