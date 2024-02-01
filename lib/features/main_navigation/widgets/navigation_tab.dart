import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_app/constants/Gaps.dart';

class NavigationTap extends StatelessWidget {
  const NavigationTap({
    super.key,
    required this.icon,
    required this.text,
    required this.isSelected,
    required this.onTap,
    required this.isSelectedIcon,
    required this.selectedIndex,
  });
  final int selectedIndex;
  final IconData icon;
  final IconData isSelectedIcon;
  final String text;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: selectedIndex == 0 ? Colors.black : Colors.white,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: isSelected ? 1 : 0.6,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  isSelected ? isSelectedIcon : icon,
                  color: selectedIndex == 0 ? Colors.white : Colors.black,
                ),
                Gaps.v10,
                Text(text,
                    style: TextStyle(
                      color: selectedIndex == 0 ? Colors.white : Colors.black,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
