import 'dart:math';
import 'package:flutter/material.dart';
import 'package:instagram/data/model/constants.dart';
import 'package:instagram/model/enums/activity_type_enums.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: TabBar(
                controller: _tabController,
                labelStyle: TextStyle(
                  fontFamily: 'GilroyBold',
                  fontSize: 16,
                ),
                indicatorColor: pinkColor,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 17),
                indicatorWeight: 2,
                tabs: [
                  Tab(
                    text: 'Following',
                  ),
                  Tab(
                    text: 'You',
                  )
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _getSampleList(),
                  _getSampleList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSampleList() {
    return CustomScrollView(
      slivers: [
        _getSliverTitle('New'),
        _getSliverList(
            status: [ActivityStatus.following, ActivityStatus.likes], count: 2),
        _getSliverTitle('Today'),
        _getSliverList(
            status: [ActivityStatus.followBack, ActivityStatus.likes],
            count: 3),
        _getSliverTitle('This Week'),
        _getSliverList(
            status: [ActivityStatus.following, ActivityStatus.likes], count: 2),
        _getSliverList(
            status: [ActivityStatus.followBack, ActivityStatus.likes],
            count: 3),
        _getSliverList(
            status: [ActivityStatus.followBack, ActivityStatus.following],
            count: 5),
      ],
    );
  }

  Widget _getSliverTitle(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(left: 30, top: 32),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'GilroyBold',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _getSliverList(
      {required List<ActivityStatus> status, required int count}) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return _getRow(Random().nextInt(2) == 0 ? status[0] : status[1]);
        },
        childCount: count,
      ),
    );
  }

  Widget _getRow(ActivityStatus status) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 17),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: pinkColor, shape: BoxShape.circle),
          ),
          SizedBox(width: 7),
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('images/boy_avatar2.jpg', fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'mohammadjavadi',
                    style: TextStyle(
                      fontFamily: 'GilroyBold',
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Started following',
                    style: TextStyle(
                      fontFamily: 'GilroyMedium',
                      fontSize: 12,
                      color: Color(0xffC5C5C5),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    'You',
                    style: TextStyle(
                      fontFamily: 'GilroyMedium',
                      fontSize: 12,
                      color: Color(0xffC5C5C5),
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    '3min',
                    style: TextStyle(
                      fontFamily: 'GilroyBold',
                      fontSize: 10,
                      color: Color(0xffC5C5C5),
                    ),
                  ),
                ],
              )
            ],
          ),
          Spacer(),
          _getActionActivityStatus(status)
        ],
      ),
    );
  }

  Widget _getActionActivityStatus(ActivityStatus status) {
    switch (status) {
      case ActivityStatus.followBack:
        return ElevatedButton(
          onPressed: () {},
          child: Text(
            'Follow',
            style: TextStyle(
              fontFamily: 'GilroyBold',
              fontSize: 12,
            ),
          ),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(70, 36),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        );
      case ActivityStatus.likes:
        return SizedBox(
          width: 40,
          height: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset('images/post_cover.png', fit: BoxFit.cover),
          ),
        );
      default:
        return OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Color(0xffc5c5c5)),
          ),
          child: Text(
            'Message',
            style: TextStyle(
              color: Color(0xffc5c5c5),
              fontFamily: 'GilroyBold',
            ),
          ),
        );
    }
  }
}
