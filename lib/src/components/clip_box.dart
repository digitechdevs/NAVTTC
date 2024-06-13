import 'package:navttc/src/core/utils/app_exports.dart';

class ClipBox extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onTap;

  const ClipBox({
    super.key,
    this.onTap,
    this.icon,
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
        child: Icon(icon ?? Icons.attach_file_rounded),
      ),
    );
  }
}
