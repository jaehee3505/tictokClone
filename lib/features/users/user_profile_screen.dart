import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_app/constants/Gaps.dart';
import 'package:tictok_app/constants/Sizes.dart';
import 'package:tictok_app/main.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: CustomScrollView(
        physics: BouncingScrollPhysics(), //아래로 스크롤시 땡겨지는 것 추가
        slivers: [
          SliverAppBar(
            title: Text('네로'),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.gear,
                    size: Sizes.size20,
                  )),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(children: [
              CircleAvatar(
                radius: 50,
                foregroundColor: Colors.teal,
                foregroundImage: NetworkImage(MYGITHUBIMAGE),
                child: Text('네로'),
              ),
              Gaps.v20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '@네로',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: Sizes.size18,
                    ),
                  ),
                  Gaps.h5,
                  FaIcon(
                    FontAwesomeIcons.solidCircleCheck,
                    size: Sizes.size18,
                    color: Colors.blue.shade500,
                  ),
                ],
              ),
              Gaps.v24,
              SizedBox(
                height: Sizes.size56,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UsersLikes(),
                    VerticalDivider(
                      width: Sizes.size32,
                      color: Colors.grey.shade400,
                      thickness: Sizes.size1,
                      indent: Sizes.size14,
                      endIndent: Sizes.size14,
                    ),
                    UsersLikes(),
                    VerticalDivider(
                      width: Sizes.size32,
                      color: Colors.grey.shade400,
                      thickness: Sizes.size1,
                      indent: Sizes.size14,
                      endIndent: Sizes.size14,
                    ),
                    UsersLikes(),
                  ],
                ),
              ),
              Gaps.v14,
              FractionallySizedBox(
                widthFactor: 0.33,
                child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: Sizes.size12,
                    ),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(Sizes.size4),
                        )),
                    child: Text(
                      'Follow',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    )),
              ),
              Gaps.v14,
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizes.size32,
                  ),
                  child: Text(
                    'Aldldl sdfls dfdsf sfsfewiwf wef weof weff wef weofwe  fsdf af sadf ew',
                    textAlign: TextAlign.center,
                  )),
              Gaps.v14,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.link,
                    size: Sizes.size12,
                  ),
                  Gaps.h4,
                  Text('httpsdfsf;:dsfsdSFDS:S',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ))
                ],
              ),
              Gaps.v20,
              Container(
                decoration: BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(
                            color: Colors.grey.shade100, width: 0.5))),
                child: TabBar(
                  indicatorColor: Colors.black,
                  labelPadding: EdgeInsets.symmetric(
                    vertical: Sizes.size10,
                  ),
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: Colors.black,
                  tabs: [
                    Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.size20,
                        ),
                        child: Icon(Icons.grid_4x4_rounded)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.size20,
                      ),
                      child: FaIcon(FontAwesomeIcons.heart),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: TabBarView(children: [
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
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
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Sizes.size4,
                            ),
                          ),
                          child: AspectRatio(
                            aspectRatio: 9 / 16,
                            child: FadeInImage.assetNetwork(
                              fit: BoxFit.cover,
                              placeholder: 'assets/images/sample.png',
                              image:
                                  "https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80",
                            ),
                          ),
                        ),
                        Gaps.v10,
                        Text(
                            'sfdsfddsfdsfdsfdsssdfsdfdsfwesfsfefesseffsdfsdfsdfsfsfsefsdffdsfdsfdsfds',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: Sizes.size10,
                                fontWeight: FontWeight.bold)),
                        Gaps.v5,
                        DefaultTextStyle(
                          style: TextStyle(color: Colors.grey.shade500),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundImage: NetworkImage(MYGITHUBIMAGE),
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
                  Center(child: Text('page two')),
                ]),
              )
            ]),
          )
        ],
      ),
    );
  }

  Column UsersLikes() {
    return Column(
      children: [
        Text(
          '11297',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.size18,
          ),
        ),
        Gaps.v3,
        Text('Likes',
            style: TextStyle(
              color: Colors.grey.shade500,
            ))
      ],
    );
  }
}
