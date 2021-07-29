import 'package:brew_coffee/models/user.dart';
import 'package:brew_coffee/services/auth.dart';
import 'package:brew_coffee/services/locator.dart';
import 'package:brew_coffee/src/screens/authenticate.dart';
import 'package:brew_coffee/src/screens/home.dart';
import 'package:firebase_core/firebase_core.dart' as core;
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;
import 'package:provider/provider.dart' as provider;

void main() async {
  cupertino.WidgetsFlutterBinding.ensureInitialized();
  await core.Firebase.initializeApp();
  setupLocator();
  cupertino.runApp(MyApp());
}

class MyApp extends cupertino.StatelessWidget {
  @override
  cupertino.Widget build(cupertino.BuildContext context) {
    return provider.StreamProvider<User?>.value(
      value: locator<AuthService>().user,
      initialData: null,
      child: cupertino.CupertinoApp(
        localizationsDelegates: [
          material.DefaultMaterialLocalizations.delegate,
          material.DefaultWidgetsLocalizations.delegate,
          cupertino.DefaultCupertinoLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        home: MyAppRouteWrapper(),
      ),
    );
  }
}

class MyAppRouteWrapper extends cupertino.StatelessWidget {
  @override
  cupertino.Widget build(cupertino.BuildContext context) {
    return provider.Provider(
      create: (_) => User,
      child:
      context.watch<User?>() == null ? AuthenticateScreen() : HomeScreen(),
    );
  }
}
