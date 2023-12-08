import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_app/constants/Sizes.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
      {super.key,
      required this.buttonTitle,
      required this.buttonIcon,
      required this.onTap});

  final String buttonTitle;
  final FaIcon buttonIcon;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: Sizes.size10, vertical: Sizes.size12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade200,
              width: Sizes.size1,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(alignment: Alignment.centerLeft, child: buttonIcon),
              Text(
                '$buttonTitle',
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
