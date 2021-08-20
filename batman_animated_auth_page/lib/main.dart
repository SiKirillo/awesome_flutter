import 'package:batman_animated_auth_page/src/features/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Batman Auth',
      debugShowCheckedModeBanner: false,
      home: Theme(
        data: ThemeData.light().copyWith(
          textTheme: GoogleFonts.vidalokaTextTheme(),
        ),
        child: const WelcomeScreen(),
      ),
    );
  }
}
