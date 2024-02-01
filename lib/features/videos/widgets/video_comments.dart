import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_app/constants/Gaps.dart';
import 'package:tictok_app/constants/Sizes.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  bool _isWriting = false;

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  void _onXmarkTap() {
    Navigator.of(context).pop();
  }

  void _stopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      clipBehavior: Clip.hardEdge,
      height: size.height * 0.7,
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
              onPressed: _onXmarkTap,
              icon: FaIcon(
                FontAwesomeIcons.xmark,
              ),
            ),
          ],
          title: Text('22793 comments'),
        ),
        body: GestureDetector(
          onTap: _stopWriting,
          child: Stack(
            children: [
              ListView.separated(
                separatorBuilder: (context, index) => Gaps.v20,
                padding: EdgeInsets.symmetric(
                    vertical: Sizes.size10, horizontal: Sizes.size16),
                itemCount: 10,
                itemBuilder: (context, index) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 18,
                      child: Text('네로'),
                    ),
                    Gaps.h10,
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('네로',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Sizes.size14,
                              color: Colors.grey.shade500,
                            )),
                        Gaps.v3,
                        Text('sdfsdfdsfsdfsdfdsfsdfdsfdssdfsdfsdfsfsdfsf'),
                      ],
                    )),
                    Gaps.v10,
                    Column(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.heart,
                          size: Sizes.size20,
                          color: Colors.grey.shade500,
                        ),
                        Gaps.v2,
                        Text(
                          '62.2k',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                width: size.width,
                bottom: 0,
                child: BottomAppBar(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizes.size16,
                    vertical: Sizes.size10,
                  ),
                  color: Colors.white,
                  child: Row(children: [
                    CircleAvatar(
                      radius: 18,
                      child: Text('네로'),
                      backgroundColor: Colors.grey.shade500,
                      foregroundColor: Colors.white,
                    ),
                    Gaps.h10,
                    Expanded(
                      child: SizedBox(
                        height: Sizes.size44,
                        child: TextField(
                          onTap: _onStartWriting,
                          expands: true,
                          minLines: null,
                          maxLines: null,
                          textInputAction: TextInputAction.newline,
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                              suffixIcon: Padding(
                                padding: EdgeInsets.only(
                                  right: Sizes.size14,
                                ),
                                child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.at,
                                        color: Colors.grey.shade900,
                                      ),
                                      Gaps.h14,
                                      FaIcon(
                                        FontAwesomeIcons.gift,
                                        color: Colors.grey.shade900,
                                      ),
                                      Gaps.h14,
                                      FaIcon(
                                        FontAwesomeIcons.faceSmile,
                                        color: Colors.grey.shade900,
                                      ),
                                      Gaps.h14,
                                      if (_isWriting)
                                        GestureDetector(
                                          onTap: _stopWriting,
                                          child: FaIcon(
                                            FontAwesomeIcons.circleArrowUp,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                    ]),
                              ),
                              hintText: 'Write a comment...',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    Sizes.size12,
                                  ),
                                  borderSide: BorderSide.none),
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: Sizes.size12,
                                vertical: Sizes.size10,
                              ),
                              fillColor: Colors.grey.shade200),
                        ),
                      ),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
