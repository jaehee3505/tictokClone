import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_app/constants/Sizes.dart';

import '../../constants/Gaps.dart';

class DiscoverScreen extends StatelessWidget {
  DiscoverScreen({super.key});

  final tabs = [
    'Top',
    'Users',
    'Videos',
    'Sounds',
    'LIVE',
    'Shopping',
    'Brands',
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          shadowColor: Colors.white,
          title: Text('Discover'),
          bottom: TabBar(
            tabAlignment: TabAlignment.start, // 최신버전이라 추가해야함
            splashFactory: NoSplash.splashFactory,
            padding: EdgeInsets.symmetric(horizontal: Sizes.size16),
            isScrollable: true,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
            ),
            unselectedLabelColor: Colors.grey.shade500,
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            tabs: [
              for (var tab in tabs) Tab(text: tab),
            ],
          ),
        ),
        body: TabBarView(children: [
          GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: Sizes.size5),
            itemCount: 20,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 9 / 20,
              crossAxisCount: 2,
              crossAxisSpacing: Sizes.size10,
              mainAxisSpacing: Sizes.size10,
            ),
            itemBuilder: (context, index) => Column(
              children: [
                AspectRatio(
                  aspectRatio: 9 / 16,
                  child: FadeInImage.assetNetwork(
                    fit: BoxFit.cover,
                    placeholder: 'assets/images/sample.png',
                    image:
                        "https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80",
                  ),
                ),
                Gaps.v10,
                Text(
                    'sfdsfddsfdsfdsfdsssdfsdfdsfwesfsfefesseffsdfsdfsdfsfsfsefsdffdsfdsfdsfds',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: Sizes.size10, fontWeight: FontWeight.bold)),
                Gaps.v5,
                DefaultTextStyle(
                  style: TextStyle(color: Colors.grey.shade500),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundImage: NetworkImage(
                            'https://avatars.githubusercontent.com/u/68673384?s=40&v=4'),
                      ),
                      Gaps.h4,
                      Expanded(
                          child: Text(
                        'MyAvatar is going to be very long',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                      Gaps.h4,
                      FaIcon(
                        FontAwesomeIcons.heart,
                        size: Sizes.size14,
                        color: Colors.grey.shade500,
                      ),
                      Gaps.h2,
                      Text(
                        '2.5M',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          for (var tab in tabs.skip(1))
            Center(
              child: Text(tab),
            )
        ]),
      ),
    );
  }
}
