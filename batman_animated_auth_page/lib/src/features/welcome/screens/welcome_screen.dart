import 'package:batman_animated_auth_page/constants.dart';
import 'package:batman_animated_auth_page/src/shared/primary_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: 0.0,
                right: 0.0,
                left: 0.0,
                child: Image.asset('assets/batman_background.png'),
              ),
              Positioned(
                top: 0.0,
                right: 0.0,
                left: 0.0,
                child: Image.asset('assets/batman_alone.png'),
              ),
              Positioned(
                top: size.height / 2.8,
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Image.asset(
                      'assets/batman_logo.png',
                      height: 50.0,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(
                      'WELCOME TO',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                    ),
                    Text(
                      'GOTHAM CITY',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.06,
                    ),
                    Form(
                      child: Flex(
                        direction: Axis.vertical,
                        children: <Widget>[
                          PrimaryButton(
                            title: 'LOGIN',
                            callback: () {},
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          PrimaryButton(
                            title: 'SIGN UP',
                            callback: () {},
                            isLeft: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
