import 'package:flutter/material.dart';
import 'package:tictok_app/constants/Sizes.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({super.key});

  @override
  State<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  int _itemCount = 4;
  List<Color> colors = [Colors.blue, Colors.yellow, Colors.teal, Colors.amber];

  final PageController _pageController = PageController();
  void _onPageChange(int index) {
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 150), curve: Curves.linear);
    if (index == _itemCount - 1) {
      _itemCount += 4;
      colors.addAll([Colors.blue, Colors.yellow, Colors.teal, Colors.amber]);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: _onPageChange,
      scrollDirection: Axis.vertical,
      itemCount: _itemCount,
      itemBuilder: (context, index) => Container(
        child: Center(
            child: Text('$index Screen',
                style: TextStyle(fontSize: Sizes.size48))),
        color: colors[index],
      ),
    );
  }
}
