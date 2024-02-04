import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_app/constants/Sizes.dart';
import 'package:tictok_app/utils.dart';

class PostVideoButton extends StatelessWidget {
  const PostVideoButton({
    super.key,
    required this.inverted,
  });

  final bool inverted;
  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: 20,
          child: Container(
            height: 30,
            width: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.size8),
              color: Colors.blue,
            ),
          ),
        ),
        Positioned(
          left: 20,
          child: Container(
            height: 30,
            width: 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.size8),
                color: Colors.red),
          ),
        ),
        Container(
          height: 30,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.size5),
            color: inverted || isDark ? Colors.white : Colors.black,
          ),
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.plus,
              size: Sizes.size16,
              color: inverted || isDark ? Colors.black : Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
