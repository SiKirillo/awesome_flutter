import 'package:brew_coffee/models/brew.dart';
import 'package:brew_coffee/models/user.dart';
import 'package:brew_coffee/services/auth.dart';
import 'package:brew_coffee/services/database.dart';
import 'package:brew_coffee/services/locator.dart';
import 'package:brew_coffee/src/components/buttons/decorated.dart';
import 'package:brew_coffee/src/components/widgets/brews.dart';
import 'package:brew_coffee/src/components/widgets/settings.dart';
import 'package:brew_coffee/src/components/wrappers/content.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;
import 'package:provider/provider.dart' as provider;

class HomeScreen extends cupertino.StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends cupertino.State<HomeScreen> {
  void _onSettingsHandler() {
    cupertino.showCupertinoModalPopup(
      context: context,
      builder: (cupertino.BuildContext context) {
        return cupertino.SafeArea(
          child: cupertino.Container(
            height: cupertino.MediaQuery.of(context).size.height / 2.0,
            child: SettingsWidget(),
          ),
        );
      },
    );
  }

  void _onSignOutHandler() async {
    await locator<AuthService>().signOut();
  }

  @override
  cupertino.Widget build(cupertino.BuildContext context) {
    return cupertino.CupertinoPageScaffold(
      backgroundColor: material.Colors.brown[100],
      navigationBar: cupertino.CupertinoNavigationBar(
        backgroundColor: material.Colors.brown[400],
        leading: cupertino.Align(
          alignment: cupertino.Alignment.centerLeft,
          child: cupertino.Text(
            'Brew Crew',
            style: cupertino.TextStyle(
              color: material.Colors.white,
              fontWeight: cupertino.FontWeight.w500,
            ),
          ),
        ),
        trailing: cupertino.Flex(
          direction: cupertino.Axis.horizontal,
          mainAxisSize: cupertino.MainAxisSize.min,
          children: <cupertino.Widget>[
            DecoratedButton(
              label: cupertino.Text(
                'Settings',
                style: cupertino.TextStyle(
                  color: material.Colors.black,
                  fontWeight: cupertino.FontWeight.w500,
                ),
              ),
              icon: cupertino.CupertinoIcons.settings,
              callback: _onSettingsHandler,
            ),
            cupertino.SizedBox(
              width: 10.0,
            ),
            DecoratedButton(
              label: cupertino.Text(
                'Logout',
                style: cupertino.TextStyle(
                  color: material.Colors.black,
                  fontWeight: cupertino.FontWeight.w500,
                ),
              ),
              icon: cupertino.CupertinoIcons.person_crop_circle_badge_minus,
              callback: _onSignOutHandler,
            ),
          ],
        ),
      ),
      child: ContentWrapper(
        widget: provider.Consumer<User?>(
          builder: (context, user, _) {
            locator<DatabaseService>().updateUserUid(user!.uid);

            return provider.StreamProvider<List<Brew>>.value(
              value: locator<DatabaseService>().brews,
              initialData: [],
              child: BrewsWidget(),
            );
          },
        ),
      ),
    );
  }
}
