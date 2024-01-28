import 'dart:ui';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:instagram/data/model/constants.dart';
import 'package:instagram/screens/share_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: false,
        title: Image.asset(
          'images/moodinger_logo.png',
          height: 24,
        ),
        actions: [
          Container(
            child: Image.asset(
              'images/icon_direct.png',
            ),
          )
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      barrierColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: ShareBottomSheet(),
                        );
                      },
                    );
                  },
                  child: Text('buttomSheet')),
            ),
            SliverToBoxAdapter(child: _getStoryList()),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _getPost(
                    imageName: 'boy_avatar2.jpg',
                    userId: 'MohammadJavad',
                    userName: 'محمد جواد',
                    imagePost: 'post_cover.png',
                  );
                },
                childCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getStoryList() {
    return Container(
      height: 120,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return index == 0 ? _getAddStoryBox() : _getStoryBox();
        },
      ),
    );
  }

  Widget _getPost({
    required String imageName,
    required String userId,
    required String userName,
    required String imagePost,
  }) {
    return Column(
      children: [
        SizedBox(height: 34),
        _getHeaderPost(imageName, userId, userName),
        _getBodyPost(imagePost),
      ],
    );
  }

  Widget _getBodyPost(
    String imagePost,
  ) {
    return Column(
      children: [
        SizedBox(
          height: 10,
          width: double.infinity,
        ),
        Container(
          height: 440,
          width: 394,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset('images/' + imagePost),
              ),
              Positioned(
                right: 15,
                top: 15,
                child: Image.asset('images/icon_video.png'),
              ),
              Positioned(
                bottom: 13,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 20,
                      sigmaY: 20,
                    ),
                    child: Container(
                      width: 340,
                      height: 46,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(255, 255, 255, 0.50),
                            Color.fromRGBO(255, 255, 255, 0.20)
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'images/icon_hart.png',
                              ),
                              SizedBox(width: 5),
                              Text(
                                '2.6 K',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset('images/icon_comments.png'),
                              SizedBox(width: 5),
                              Text(
                                '1.5 K',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              )
                            ],
                          ),
                          Image.asset('images/icon_share.png'),
                          Image.asset('images/icon_save.png'),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _getHeaderPost(String imageName, String userId, String userName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          _getProfileBox(imageName),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                userId,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'GilroyBold',
                  color: Colors.white,
                ),
              ),
              Text(
                userName,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'ShabnamMedium',
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Spacer(),
          Image.asset('images/icon_menu.png'),
        ],
      ),
    );
  }

  Widget _getStoryBox() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: DottedBorder(
            color: pinkColor,
            dashPattern: [14, 8],
            strokeWidth: 2,
            borderType: BorderType.RRect,
            radius: Radius.circular(17),
            padding: EdgeInsets.all(4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: 58,
                height: 58,
                child: Image.asset(
                  'images/boy_avatar2.jpg',
                ),
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

  Widget _getProfileBox(String ImageName) {
    return DottedBorder(
      color: pinkColor,
      dashPattern: [28, 5],
      strokeWidth: 2,
      borderType: BorderType.RRect,
      radius: Radius.circular(17),
      padding: EdgeInsets.all(3),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: 40,
          height: 40,
          child: Image.asset(
            'images/' + ImageName,
          ),
        ),
      ),
    );
  }

  Widget _getAddStoryBox() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          width: 66,
          height: 66,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(17)),
          child: Padding(
            padding: EdgeInsets.all(2),
            child: Container(
              width: 62,
              height: 62,
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
}
