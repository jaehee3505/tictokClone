import 'package:flutter/material.dart';
import 'package:tictok_app/constants/Sizes.dart';

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
              childAspectRatio: 9 / 16,
              crossAxisCount: 2,
              crossAxisSpacing: Sizes.size10,
              mainAxisSpacing: Sizes.size10,
            ),
            itemBuilder: (context, index) => Container(
              color: Colors.teal,
              child: Center(
                child: Text('$index'),
              ),
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
