import 'dart:ui';
import 'package:flutter/material.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      maxChildSize: 0.6,
      minChildSize: 0.2,
      builder: (context, scrollController) {
        return ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(255, 255, 255, 0.50),
                    Color.fromRGBO(255, 255, 255, 0.20),
                  ],
                ),
              ),
              height: 567,
              padding: EdgeInsets.symmetric(
                horizontal: 44,
              ),
              child: _getContent(scrollController, context),
            ),
          ),
        );
      },
    );
  }

  Widget _getContent(ScrollController controller, BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(
          controller: controller,
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    width: 67,
                    height: 5,
                    margin: EdgeInsets.only(
                      top: 10,
                      bottom: 22,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Share',
                        style: TextStyle(
                          fontFamily: 'GilroyBold',
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      Image.asset('images/icon_share_bottomsheet.png'),
                    ],
                  ),
                  SizedBox(height: 32),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color.fromRGBO(255, 255, 255, 0.40),
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
                  SizedBox(height: 32),
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _getItemGrid();
                },
                childCount: 40,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 21,
                mainAxisSpacing: 20,
                mainAxisExtent: 90,
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 90),
            ),
          ],
        ),
        Positioned(
          bottom: 47,
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Send'),
          ),
        ),
      ],
    );
  }

  Widget _getItemGrid() {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(bottom: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'images/Rectangle5.png',
              width: 60,
              height: 60,
            ),
          ),
        ),
        Text(
          'Your Story',
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'GilroyBold',
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
