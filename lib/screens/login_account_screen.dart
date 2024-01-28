import 'package:flutter/material.dart';
import 'package:instagram/data/model/constants.dart';
import 'package:instagram/main.dart';
import 'package:instagram/screens/main_screen.dart';

class LoginAccountScreen extends StatefulWidget {
  LoginAccountScreen({super.key});

  @override
  State<LoginAccountScreen> createState() => _LoginAccountScreenState();
}

class _LoginAccountScreenState extends State<LoginAccountScreen> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode1.addListener(() {
      setState(() {});
    });
    focusNode2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(50, 58, 153, 1),
            Color.fromRGBO(249, 139, 252, 1),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 60,
              child: _getImageContainer(),
            ),
            _getBoxContainer(),
          ],
        ),
      ),
    );
  }

  Widget _getBoxContainer() {
    return Column(
      children: [
        Expanded(child: Container()),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(28, 31, 46, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  _getBoxTitle(),
                  SizedBox(
                    height: 36,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 44),
                    child: _getTextField('Email', focusNode1),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 44),
                    child: _getTextField('Password', focusNode2),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainScreen()));
                    },
                    child: Text('Sign In'),
                    style: Theme.of(context).elevatedButtonTheme.style,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  RichText(
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getImageContainer() {
    return Column(
      children: [
        Expanded(
          child: Image(
            image: AssetImage('images/rocket.png'),
          ),
        ),
        Expanded(
          child: Container(),
        )
      ],
    );
  }

  Widget _getBoxTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Sign in to ',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'GilroyBold',
            fontSize: 20,
          ),
        ),
        Image(
          image: AssetImage('images/minilogo.png'),
        ),
      ],
    );
  }

  Widget _getTextField(String labelText, FocusNode focusNode) {
    return TextField(
      focusNode: focusNode,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        labelStyle: TextStyle(
            color: focusNode.hasFocus ? pinkColor : greyColor,
            fontSize: 20,
            fontFamily: 'GilroyMedium'),
        labelText: '$labelText',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: greyColor,
            width: 3,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: pinkColor,
            width: 3,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    super.dispose();
  }
}
