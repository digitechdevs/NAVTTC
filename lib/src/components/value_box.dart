import 'package:navttc/src/core/utils/app_exports.dart';

class ValueBox extends StatelessWidget {
  final IconData? icon;
  final String? value;
  final VoidCallback? onTap;

  const ValueBox({
    super.key,
    this.icon,
    this.onTap,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 62.w,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.subtitle),
        ),
        child: Row(
          children: [
            10.pw,
            Icon(icon ?? Icons.attach_file_rounded),
            6.pw,
            Text(value ?? "Select"),
          ],
        ),
      ),
    );
  }
}
