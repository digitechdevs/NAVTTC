import 'package:flutter/cupertino.dart';
import 'package:navttc/src/components/image_box.dart';
import 'package:navttc/src/core/utils/app_exports.dart';

void attendanceDetailsAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 24),
        backgroundColor: AppColors.primaryWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          // width: double.infinity,
          padding: EdgeInsets.all(16.sp),
          decoration: BoxDecoration(
            color: AppColors.primaryWhite,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  20.pw,
                  const Text(
                    '21 May 2024',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(CupertinoIcons.xmark),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Text(
                    'Class Start Time   ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.access_time),
                  Text(' 9:30 AM'),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Text(
                    'Class End Time   ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.access_time),
                  Text(' 4:00 PM'),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Picture',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const ImageBox(image: null,),
              150.ph,
            ],
          ),
        ),
      );
    },
  );
}

