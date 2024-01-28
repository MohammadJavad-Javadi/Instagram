import 'package:flutter/material.dart';
import 'package:instagram/data/model/constants.dart';
import 'package:instagram/screens/activity_screen.dart';
import 'package:instagram/screens/add_content_screen.dart';
import 'package:instagram/screens/home_screen.dart';
import 'package:instagram/screens/search_screen.dart';
import 'package:instagram/screens/user_profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedBottomNavigation = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xff272B40),
          currentIndex: _selectedBottomNavigation,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (int index) {
            setState(() {
              _selectedBottomNavigation = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: 'item1',
              icon: Image.asset('images/icon_home.png'),
              activeIcon: Image.asset('images/icon_active_home.png'),
            ),
            BottomNavigationBarItem(
              label: 'item2',
              icon: Image.asset('images/icon_search_navigation.png'),
              activeIcon:
                  Image.asset('images/icon_search_navigation_active.png'),
            ),
            BottomNavigationBarItem(
              label: 'item3',
              icon: Image.asset('images/icon_add_navigation.png'),
              activeIcon: Image.asset('images/icon_add_navigation_active.png'),
            ),
            BottomNavigationBarItem(
              label: 'item4',
              icon: Image.asset('images/icon_activity_navigation.png'),
              activeIcon:
                  Image.asset('images/icon_activity_navigation_active.png'),
            ),
            BottomNavigationBarItem(
              label: 'item5',
              icon: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.5, color: Color(0xffC5C5C5)),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset('images/boy_avatar3.jpg'),
                  )),
              activeIcon: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.5, color: pinkColor),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset('images/boy_avatar3.jpg'),
                  )),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedBottomNavigation,
        children: _getLayout(),
      ),
      // body: _getLayout().elementAt(_selectedBottomNavigation),
    );
  }

  List<Widget> _getLayout() {
    return <Widget>[
      HomeScreen(),
      SearchScreen(),
      AddContentScreen(),
      ActivityScreen(),
      UserProfileScreen(),
    ];
  }

  // void _getAddContentScreen() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => AddContentScreen()),
  //   );
  // }
}
