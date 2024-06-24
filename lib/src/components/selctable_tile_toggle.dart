import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SelectableTilewithToggle extends StatelessWidget {
  final String? title;
  final bool? selected;
  final VoidCallback? onTap;
  final bool showIcon;
  final bool showToggleSwitch;
  final bool toggleSwitchValue;
  final ValueChanged<bool>? onToggleSwitchChanged;

  const SelectableTilewithToggle({
    Key? key,
    this.title,
    this.selected = false,
    this.onTap,
    this.showIcon = true,
    this.showToggleSwitch = false,
    this.toggleSwitchValue = false,
    this.onToggleSwitchChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: selected! ? Colors.blue : Colors.white,
          border: Border.all(color: selected! ? Colors.white : Colors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            if (showIcon)
              Icon(Icons.business,
                  color: selected! ? Colors.white : Colors.blue),
            SizedBox(width: showIcon ? 10 : 0),
            Expanded(
              child: Text(
                title ?? "Default Title",
                style: TextStyle(
                  color: selected! ? Colors.white : Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (showToggleSwitch)
              Switch(
                value: toggleSwitchValue,
                onChanged: onToggleSwitchChanged,
                activeColor: Colors.blue,
              ),
          ],
        ),
      ),
    );
  }
}
