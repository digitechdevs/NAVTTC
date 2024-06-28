import 'package:navttc/src/core/utils/app_exports.dart';
import 'dart:math' as math;


class ClipBox extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onTap;
  final double? height, width;
  final String? text;

  const ClipBox({
    super.key,
    this.onTap,
    this.icon,  this.height,  this.width ,this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? 62.w,
        height: height?? 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.subtitle),
        ),
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                    
                    Text(
                      text??'',
                      style: TextStyle(
                        color: AppColors.primaryBlack
                        
                      ),
                    ),
                  Transform.rotate(
              angle: math.pi / 3.5,
              child: Icon(icon ?? Icons.attach_file_rounded),
            ),

                    
          ],
        )
        
        
        
        
        
        
        
        
      ),
    );
  }
}
