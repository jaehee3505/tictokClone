import 'package:flutter/material.dart';
import 'package:tictok_app/constants/Sizes.dart';
import 'package:tictok_app/utils.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.isDisable,
    required this.onTap,
    required this.text,
  });

  final bool isDisable;
  final void Function() onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: AnimatedContainer(
          duration: Duration(seconds: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isDisable
                ? isDarkMode(context)
                    ? Colors.grey.shade800
                    : Colors.grey.shade300
                : Theme.of(context).primaryColor,
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            vertical: Sizes.size10,
          ),
          child: AnimatedDefaultTextStyle(
            duration: Duration(
              seconds: 3,
            ),
            style: TextStyle(
              fontSize: Sizes.size14,
              fontWeight: FontWeight.w600,
              color: isDisable ? Colors.black : Colors.white,
            ),
            child: Text(
              text,
            ),
          ),
        ),
      ),
    );
  }
}
