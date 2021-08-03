import 'package:flutter/material.dart';
import 'package:mobile_auth_page/constants.dart';
import 'package:mobile_auth_page/src/features/login/screens/login_screen.dart';
import 'package:mobile_auth_page/src/features/welcome/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: WelcomeScreen.routeName,
      routes: <String, Widget Function(BuildContext)>{
        LoginScreen.routeName: (BuildContext context) => LoginScreen(),
      },
      home: WelcomeScreen(),
    );
  }
}