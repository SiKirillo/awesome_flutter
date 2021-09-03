import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plants_animated_shop/src/constants.dart';
import 'package:plants_animated_shop/src/controllers/home_controller.dart';
import 'package:plants_animated_shop/src/features/details/screens/details_screen.dart';
import 'package:plants_animated_shop/src/features/home/screens/home_screen.dart';
import 'package:plants_animated_shop/src/models/product.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeController()),
      ],
      child: MaterialApp(
        title: 'Plants Grocery',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case DetailsScreen.routeName:
              {
                return PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 500),
                  reverseTransitionDuration: const Duration(milliseconds: 500),
                  pageBuilder: (context, first, second) {
                    return FadeTransition(
                      opacity: first,
                      child: DetailsScreen(
                        product: settings.arguments as Product,
                      ),
                    );
                  },
                );
              }
          }
        },
        home: Theme(
          data: ThemeData.light().copyWith(
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(kDefaultPadding * 0.75),
                shape: const StadiumBorder(),
                backgroundColor: kPrimaryColor,
              ),
            ),
          ),
          child: const HomeScreen(),
        ),
      ),
    );
  }
}
