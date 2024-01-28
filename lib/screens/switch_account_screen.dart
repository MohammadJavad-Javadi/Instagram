import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:instagram/data/model/constants.dart';

class SwitchAccountScreen extends StatelessWidget {
  const SwitchAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/switch_account_background.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 275,
                  width: 340.0,
                  height: 351.0,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 28.0,
                        sigmaY: 28.0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromRGBO(255, 255, 255, 0.5),
                                Color.fromRGBO(255, 255, 255, 0.2),
                              ]),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 31),
                            ClipRRect(
                              child: Image(
                                image: AssetImage('images/boy_avatar.jpg'),
                                width: 129,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Mohammad_Javad',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Confirm',
                              ),
                              style:
                                  Theme.of(context).elevatedButtonTheme.style,
                            ),
                            SizedBox(height: 32),
                            Text(
                              'swith account',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            SizedBox(height: 31),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 132, bottom: 63),
            child: RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: 'dont have an account? / ',
                  style: TextStyle(
                    color: greyColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
