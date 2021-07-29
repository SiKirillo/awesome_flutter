import 'package:brew_coffee/models/authenticate.dart';
import 'package:brew_coffee/services/auth.dart';
import 'package:brew_coffee/services/locator.dart';
import 'package:brew_coffee/src/components/buttons/decorated.dart';
import 'package:brew_coffee/src/components/widgets/loading.dart';
import 'package:brew_coffee/src/components/widgets/validate.dart';
import 'package:brew_coffee/src/components/wrappers/content.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;

class AuthenticateScreen extends cupertino.StatefulWidget {
  @override
  _AuthenticateScreenState createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends cupertino.State<AuthenticateScreen> {
  AuthenticateMode _mode = AuthenticateMode.SIGN_IN;
  bool _isLoading = false;

  void _onChangeModeHandler() {
    setState(() {
      _mode = AuthenticateMode.values.firstWhere((mode) => _mode != mode);
    });
  }

  void _onSignInHandler(String name, String email, String password) async {
    setState(() {
      _isLoading = true;
    });

    _mode == AuthenticateMode.SIGN_IN
        ? await locator<AuthService>().loginWithEmail(email, password)
        : await locator<AuthService>().registerWithEmail(name, email, password);
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
            _mode == AuthenticateMode.SIGN_IN
                ? 'Sign in to Brew Crew'
                : 'Sign up to Brew Crew',
            style: cupertino.TextStyle(
              color: material.Colors.white,
              fontWeight: cupertino.FontWeight.w500,
            ),
            softWrap: false,
            overflow: cupertino.TextOverflow.visible,
          ),
        ),
        trailing: DecoratedButton(
          label: cupertino.Text(
            _mode == AuthenticateMode.SIGN_IN ? 'Sign up' : 'Sign in',
            style: cupertino.TextStyle(
              color: material.Colors.black,
              fontWeight: cupertino.FontWeight.w500,
            ),
          ),
          icon: cupertino.CupertinoIcons.person,
          callback: _onChangeModeHandler,
        ),
      ),
      child: ContentWrapper(
        widget: _isLoading
            ? LoadingWidget()
            : ValidateWidget(
                mode: _mode,
                callback: _onSignInHandler,
              ),
      ),
    );
  }
}
