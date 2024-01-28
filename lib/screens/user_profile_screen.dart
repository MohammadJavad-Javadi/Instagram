import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:instagram/data/model/constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18, right: 15),
                    child: Icon(Icons.menu, size: 35),
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(10),
                  child: Container(
                    height: 14,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                  ),
                ),
                expandedHeight: 170,
                backgroundColor: backgroundColor,
                flexibleSpace: FlexibleSpaceBar(
                  background:
                      Image.asset('images/item5.png', fit: BoxFit.cover),
                ),
              ),
              SliverToBoxAdapter(
                child: _getProfileHeader(),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 12)),
              SliverToBoxAdapter(
                child: _getUserDetails(),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 120,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return index == 0
                          ? _getAddStoryBox()
                          : _getStoryBox(index);
                    },
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: TabBarViewDelegate(
                  TabBar(
                    indicatorColor: pinkColor,
                    indicatorPadding: EdgeInsets.only(left: 18, right: 18),
                    tabs: [
                      Tab(
                        icon: Image.asset('images/icon_tab_posts.png'),
                      ),
                      Tab(
                        icon: Image.asset('images/icon_tab_bookmark.png'),
                      )
                    ],
                  ),
                ),
              )
            ];
          },
          body: TabBarView(
            children: [
              _getGridView(),
              _getGridView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getStoryBox(index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width: 60,
              height: 60,
              child: Image.asset(
                'images/Rectangle-${index - 1}.png',
              ),
            ),
          ),
        ),
        SizedBox(height: 3),
        Text(
          'Your Story',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'GilroyBold',
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _getAddStoryBox() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(17)),
          child: Padding(
            padding: EdgeInsets.all(2),
            child: Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(
                'images/icon_plus.png',
              ),
            ),
          ),
        ),
        SizedBox(height: 2),
        Text(
          'Your Story',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'GilroyBold',
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _getGridView() {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          // padding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          padding: EdgeInsets.only(top: 16, right: 14, left: 14, bottom: 70),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: 30,
              (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.amber,
                    child: Image.asset(
                        'images/item${Random().nextInt(10).toString()}.png',
                        fit: BoxFit.cover),
                  ),
                );
              },
            ),
            gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: [
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(2, 2),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                ]),
          ),
        )
      ],
    );
  }

  Widget _getUserDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'برنامه‌نویسی فلاتر و اندروید ، مدرس محبوب‌ترین \nدوره مـکتـبـخونـه و بـرنـامـه نـویـس سـابـق زریـن پـال\nتـخـصـص بـرنـامـه‌نـویسی یعنی اینده و تاثیر گذاری\n آموزش رایگان 👇',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Shabnam',
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Image.asset('images/link.png'),
              SizedBox(width: 6),
              Text(
                'yek.link/Amirahmad',
                style: TextStyle(
                  color: Color(0xff55B9F7),
                  fontFamily: 'GilroyBold',
                ),
              )
            ],
          ),
          SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('images/work.png'),
              SizedBox(width: 5),
              Text(
                'Developer',
                style: TextStyle(
                  color: Color(0xffC5C5C5),
                  fontFamily: 'GilroyBold',
                ),
              ),
              SizedBox(width: 15),
              Image.asset('images/location.png'),
              SizedBox(width: 5),
              Text(
                'IRAN',
                style: TextStyle(
                  color: Color(0xffC5C5C5),
                  fontFamily: 'GilroyBold',
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '23 ',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'GilroyBold',
                        fontSize: 18,
                      ),
                    ),
                    TextSpan(
                      text: 'Posts',
                      style: TextStyle(
                        color: Color(0xffC5C5C5),
                        fontFamily: 'GilroyMedium',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 15),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '16.2K ',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'GilroyBold',
                        fontSize: 18,
                      ),
                    ),
                    TextSpan(
                      text: 'Followers',
                      style: TextStyle(
                        color: Color(0xffC5C5C5),
                        fontFamily: 'GilroyMedium',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 15),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '280 ',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'GilroyBold',
                        fontSize: 18,
                      ),
                    ),
                    TextSpan(
                      text: 'Following',
                      style: TextStyle(
                        color: Color(0xffC5C5C5),
                        fontFamily: 'GilroyMedium',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 32),
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(177, 48),
                ),
                onPressed: () {},
                child: Text(
                  'Follow',
                  style: TextStyle(
                    fontFamily: 'GilroyBold',
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(width: 20),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    minimumSize: Size(177, 48),
                    side: BorderSide(
                      width: 2,
                      color: Color(0xffC5C5C5),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                onPressed: () {},
                child: Text(
                  'Message',
                  style: TextStyle(
                    color: Color(0xffC5C5C5),
                    fontFamily: 'GilroyBold',
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getProfileHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 68,
            height: 68,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: pinkColor,
              ),
              borderRadius: BorderRadius.circular(17),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image.asset(
                'images/boy_avatar2.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 17),
          Container(
            height: 70,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'محمد جواد جوادی',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Shabnam',
                        fontSize: 14),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'MohammadJavadJavadi',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Image.asset('images/icon_profile_edit.png'),
        ],
      ),
    );
  }
}

class TabBarViewDelegate extends SliverPersistentHeaderDelegate {
  TabBarViewDelegate(this._tabBar);
  final TabBar _tabBar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: backgroundColor,
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
