import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram/data/model/constants.dart';

class AddContentScreen extends StatefulWidget {
  const AddContentScreen({super.key});

  @override
  State<AddContentScreen> createState() => _AddContentScreenState();
}

class _AddContentScreenState extends State<AddContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 37,
              left: 17,
              right: 17,
              child: _getHeader(),
            ),
            Positioned(
              top: 83,
              left: 17,
              right: 17,
              bottom: 73,
              child: _getWholeContent(),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: _getBottom(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getHeader() {
    return Row(
      children: [
        Text(
          'Post',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'GilroyBold',
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Image.asset(
          'images/icon_arrow_down.png',
          height: 10,
        ),
        Spacer(),
        Text(
          'Next',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'GilroyBold',
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Image.asset(
          'images/icon_arrow_right_box.png',
          height: 26,
        ),
      ],
    );
  }

  Widget _getSelectedImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 375,
        width: double.infinity,
        child: Image.asset(
          'images/Rectangle_53.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _getWholeContent() {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: _getSelectedImage(),
        ),
        Positioned(
          top: 380,
          right: 0,
          left: 0,
          bottom: 0,
          child: _getScrollableContent(),
        ),
      ],
    );
  }

  Widget _getScrollableContent() {
    return CustomScrollView(
      slivers: [
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) => ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: 128,
                height: 128,
                color: Colors.amberAccent,
                child: Image.asset(
                  'images/item${Random().nextInt(10)}.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            childCount: 30,
          ),
        ),
        SliverPadding(padding: EdgeInsets.only(bottom: 40)),
      ],
    );
  }

  Widget _getBottom() {
    return Container(
      margin: EdgeInsets.only(bottom: 7),
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromRGBO(39, 43, 64, 1),
      ),
      padding: EdgeInsets.only(
        top: 10,
        left: 17,
        right: 17,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Draft',
              style: TextStyle(
                fontFamily: 'GilroyBold',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Gallery',
              style: TextStyle(
                fontFamily: 'GilroyBold',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Take',
              style: TextStyle(
                fontFamily: 'GilroyBold',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
