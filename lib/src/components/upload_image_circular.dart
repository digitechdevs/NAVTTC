import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:navttc/src/components/custom_text.dart';
import 'package:navttc/src/core/utils/app_exports.dart';

class UploadImagecircular extends StatelessWidget {
  final XFile? pickedFile;
  final File? loadedFile;
  final Function()? onTap;

  const UploadImagecircular({
    super.key,
    this.onTap,
    this.pickedFile,
    this.loadedFile,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      // radius: 60.r,
      borderRadius: BorderRadius.circular(40.r),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Container(
          height: 80.h,
          width: 80.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              color: const Color.fromARGB(255, 52, 52, 52),
              width: 2,
            ),
          ),
          child: pickedFile != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    loadedFile!,
                    fit: BoxFit.cover,
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(CupertinoIcons.person, size: 30.sp),
                    CustomText(
                      "Upload Image",
                      alignment: Alignment.center,
                      textStyle: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryBlack.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
