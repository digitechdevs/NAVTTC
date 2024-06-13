import 'package:flutter/cupertino.dart';
import 'package:navttc/src/core/utils/app_exports.dart';

class Prompts {
  static void showSnackBar(String message, {Duration? duration, Color? color}) {
    ScaffoldMessenger.of(AppRouter.context).clearSnackBars();
    ScaffoldMessenger.of(AppRouter.context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            message.contains('Exception:')
                ? message.replaceAll('Exception: ', '')
                : message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
        ),
        action: SnackBarAction(
          label: 'Close',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(AppRouter.navKey.currentContext!)
                .hideCurrentSnackBar();
          },
        ),
        duration: duration ?? const Duration(seconds: 5),
      ),
    );
  }

  static showLogoutAlert(
    context, {
    required String title,
    actionText,
    VoidCallback? onAction,
    content,
  }) {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => CupertinoAlertDialog(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        content: Text(
          content ?? "",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              "Cancel",
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          CupertinoDialogAction(
            onPressed: onAction ?? () => Navigator.of(context).pop(true),
            child: Text(
              actionText ?? "Logout",
              style: TextStyle(
                color: AppColors.errorRed,
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
