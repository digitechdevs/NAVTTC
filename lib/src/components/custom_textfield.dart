import 'package:flutter/services.dart';
import 'package:navttc/src/core/utils/app_exports.dart';

class CustomTextField extends StatelessWidget {
  final Widget? suffixIcon, prefix, prefixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool? obscureText, enabled;
  final String? label;
  final Color? fillColor, borderColor;
  final int? maxLines, maxLength;
  final AutovalidateMode? autoValidateMode;
  final List<TextInputFormatter>? inputformater;

  const CustomTextField({
    super.key,
    this.label,
    this.prefix,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.obscureText,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization,
    this.maxLines,
    this.enabled,
    this.fillColor,
    this.borderColor, this.autoValidateMode, this.maxLength, this.inputformater,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputformater ?? [],
      enabled: enabled ?? true,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.top,
      textInputAction: textInputAction ?? TextInputAction.next,
      textCapitalization: textCapitalization ?? TextCapitalization.words,
      controller: controller,
      obscureText: obscureText ?? false,
      autovalidateMode: autoValidateMode ?? AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validator,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      decoration: InputDecoration(
        counterText: "",
        filled: true,
        fillColor: fillColor ?? AppColors.fieldBg,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? AppColors.subtitle),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor ?? AppColors.subtitle),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor ?? AppColors.subtitle),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.errorRed),
        ),
        hintText: label ?? "",
        isDense: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintStyle: TextStyle(
          color: AppColors.primaryWhite,
          fontSize: 16,
        ),
      ),
    );
  }
}
