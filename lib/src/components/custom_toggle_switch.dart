import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomToggleSwitch extends HookWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomToggleSwitch({
    required this.value,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
      activeColor: CupertinoColors.activeGreen,
      trackColor: CupertinoColors.inactiveGray,
    );
    // return GestureDetector(
    //   onTap: () => onChanged(!value),
    //   child: Container(
    //     width: 60,
    //     height: 30,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(15),
    //       color: Colors.transparent,
    //     ),
    //     child: Stack(
    //       alignment: Alignment.center,
    //       children: [
    //         CupertinoSwitch(
    //           value: value,
    //           onChanged: onChanged,
    //           activeColor: CupertinoColors.activeGreen,
    //           trackColor: CupertinoColors.inactiveGray,
    //         ),
    //         Positioned(
    //           left: 6,
    //           child: Text(
    //             "Yes",
    //             style: TextStyle(
    //               color: value ? CupertinoColors.white : CupertinoColors.black,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //         ),
    //         Positioned(
    //           right: 6,
    //           child: Text(
    //             "No",
    //             style: TextStyle(
    //               color: value ? CupertinoColors.black : CupertinoColors.white,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    //);
  }
}
