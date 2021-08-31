import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plants_animated_shop/src/constants.dart';
import 'package:plants_animated_shop/src/features/home/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plants Grocery',
      debugShowCheckedModeBanner: false,
      home: Theme(
        data: ThemeData.light().copyWith(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(kDefaultPadding * 0.75),
              shape: StadiumBorder(),
              backgroundColor: kPrimaryColor,
            ),
          ),
        ),
        child: HomeScreen(),
      ),
    );
  }
}