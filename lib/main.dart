import 'package:flutter/material.dart';
import 'package:instagram/data/model/constants.dart';
import 'package:instagram/screens/login_account_screen.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontSize: 16,
            fontFamily: 'GilroyBold',
            color: Colors.white,
          ),
          headlineSmall: TextStyle(
            fontSize: 14,
            fontFamily: 'GilroyBold',
            color: Colors.white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: pinkColor,
            minimumSize: Size(129, 46),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 0,
            textStyle: TextStyle(
              fontSize: 16,
              fontFamily: 'GilroyBold',
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    print('hello');
    _getLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/pattern.png'),
          repeat: ImageRepeat.repeatY,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(77),
              child: Image(
                image: AssetImage('images/logo_splash.png'),
              ),
            ),
            Positioned(
              bottom: 35,
              child: Column(
                children: [
                  Text('from', style: TextStyle(color: Colors.grey)),
                  Text('Moodinger', style: TextStyle(color: Colors.blue)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _getLogin() async {
    await Future.delayed(
      Duration(seconds: 2),
    );
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => LoginAccountScreen()),
    );
  }
}
