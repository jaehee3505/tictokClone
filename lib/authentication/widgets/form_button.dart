import 'package:flutter/material.dart';
import 'package:tictok_app/constants/Sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.isDisable,
    required this.onTap,
  });

  final bool isDisable;
  final void Function() onTap;

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
            color: isDisable ? Colors.grey : Theme.of(context).primaryColor,
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
              'Next',
            ),
          ),
        ),
      ),
    );
  }
}
