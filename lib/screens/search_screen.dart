import 'dart:math';

import 'package:flutter/material.dart';
import 'package:instagram/data/model/constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _getSearchBox(),
            ),
            SliverToBoxAdapter(
              child: _getCategories(),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 17),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.amber,
                      child: ClipRRect(
                        child: Image.asset(
                          'images/item${Random().nextInt(10)}.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  childCount: 40,
                ),
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: [
                    QuiltedGridTile(2, 1),
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getSearchBox() {
    return Container(
      margin: EdgeInsets.only(top: 20, right: 18, left: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: Color.fromRGBO(39, 43, 64, 1),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                hintText: 'Search...',
                hintStyle: TextStyle(
                  fontFamily: 'GilroyBold',
                  fontSize: 14,
                  color: Colors.white,
                ),
                prefixIcon: Image.asset('images/icon_search.png'),
              ),
            ),
          ),
          Image.asset('images/icon_scan.png'),
          SizedBox(width: 10)
        ],
      ),
    );
  }

  Widget _getCategories() {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      height: 25,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 7.5),
            decoration: BoxDecoration(
              color: Color.fromRGBO(39, 43, 64, 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 4,
                ),
                child: Text(
                  'Account $index',
                  style: TextStyle(
                    fontFamily: 'GilroySemiBold',
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
      ),
    );
  }
}
