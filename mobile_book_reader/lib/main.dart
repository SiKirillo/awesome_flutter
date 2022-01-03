import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_book_reader/core/constants.dart';
import 'package:mobile_book_reader/features/home/screens/home_screen.dart';
import 'package:mobile_book_reader/features/reader/screens/reader_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: StyleConstants.kBackgroundColor,
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case ReaderScreen.routeName:
            {
              return PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 500),
                reverseTransitionDuration: const Duration(milliseconds: 500),
                pageBuilder: (context, first, second) {
                  return FadeTransition(
                    opacity: first,
                    child: ReaderScreen(
                      pdfSrc: settings.arguments as String,
                    ),
                  );
                },
              );
            }
        }
      },
      home: const HomeScreen(),
    );
  }
}
