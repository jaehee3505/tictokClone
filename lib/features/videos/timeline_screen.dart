import 'package:flutter/material.dart';
import 'package:tictok_app/constants/Sizes.dart';
import 'package:tictok_app/features/videos/widgets/video_post.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({super.key});

  @override
  State<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  int _itemCount = 4;

  final Duration _scrollDuration = Duration(milliseconds: 250);
  final Curve _scrollCurves = Curves.linear;

  final PageController _pageController = PageController();
  void _onPageChange(int index) {
    _pageController.animateToPage(index,
        duration: _scrollDuration, curve: _scrollCurves);
    if (index == _itemCount - 1) {
      _itemCount += 4;
    }
    setState(() {});
  }

  void _onVideoFinished() {
    _pageController.nextPage(duration: _scrollDuration, curve: _scrollCurves);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: _pageController,
        onPageChanged: _onPageChange,
        scrollDirection: Axis.vertical,
        itemCount: _itemCount,
        itemBuilder: (context, index) =>
            VideoPost(onVideoFinished: _onVideoFinished, index: index));
  }
}