import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  void _onXmarkTap() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Scaffold(
          backgroundColor: Colors.grey.shade50,
          appBar: AppBar(
            backgroundColor: Colors.grey.shade50,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                  onPressed: _onXmarkTap, icon: FaIcon(FontAwesomeIcons.xmark)),
            ],
            title: Text('22793 comments'),
          ),
          body: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => Container(
                    child: Text('im a comment'),
                  ))),
    );
  }
}
