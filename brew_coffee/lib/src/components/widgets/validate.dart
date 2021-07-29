import 'package:brew_coffee/models/authenticate.dart';
import 'package:brew_coffee/src/components/buttons/input.dart';
import 'package:brew_coffee/src/components/decoration/text_form.dart';
import 'package:brew_coffee/src/components/wrappers/auth.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;

class ValidateWidget extends cupertino.StatefulWidget {
  final AuthenticateMode mode;
  final Function callback;

  const ValidateWidget({
    cupertino.Key? key,
    required this.mode,
    required this.callback,
  }) : super(key: key);

  @override
  _ValidateWidgetState createState() => _ValidateWidgetState();
}

class _ValidateWidgetState extends cupertino.State<ValidateWidget> {
  String _name = '';
  late String _email;
  late String _password;

  String? _error;
  bool _isValidate = true;

  void _onNameFieldHandler(String value) {
    setState(() {
      _name = value;
      _isValidate = true;
    });
  }

  void _onEmailFieldHandler(String value) {
    setState(() {
      _email = value;
      _isValidate = true;
    });
  }

  void _onPasswordFieldHandler(String value) {
    setState(() {
      _password = value;
      _isValidate = true;
    });
  }

  Future _onValidateButtonHandler() async {
    if (_name.length < 4 && this.widget.mode == AuthenticateMode.SIGN_UP) {
      setState(() {
        _error = 'Name must be more than 3 characters';
        _isValidate = false;
      });

      return;
    }

    if (!_email.contains('@')) {
      setState(() {
        _error = 'Email must have \"@\"';
        _isValidate = false;
      });

      return;
    }

    if (_password.length < 6) {
      setState(() {
        _error = 'Password must be more than 5 characters';
        _isValidate = false;
      });

      return;
    }

    setState(() {
      _isValidate = true;
    });

    this.widget.callback(_name, _email, _password);
  }

  @override
  cupertino.Widget build(cupertino.BuildContext context) {
    return material.Material(
      child: AuthWrapper(
        widget: cupertino.Form(
          child: cupertino.Flex(
            direction: cupertino.Axis.vertical,
            mainAxisSize: cupertino.MainAxisSize.min,
            children: <cupertino.Widget>[
              cupertino.Text(
                'Welcome ot Brew Crew',
                style: cupertino.TextStyle(
                  fontSize: 20.0,
                  fontWeight: cupertino.FontWeight.bold,
                ),
              ),
              cupertino.SizedBox(
                height: 15.0,
              ),
              if (this.widget.mode == AuthenticateMode.SIGN_UP)
                material.TextFormField(
                  decoration: TextFormDecoration.copyWith(hintText: 'Name'),
                  onChanged: (val) => _onNameFieldHandler(val),
                ),
              if (this.widget.mode == AuthenticateMode.SIGN_UP)
                cupertino.SizedBox(
                  height: 20.0,
                ),
              material.TextFormField(
                decoration: TextFormDecoration.copyWith(hintText: 'Email'),
                onChanged: (val) => _onEmailFieldHandler(val),
              ),
              cupertino.SizedBox(
                height: 20.0,
              ),
              material.TextFormField(
                decoration: TextFormDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
                onChanged: (val) => _onPasswordFieldHandler(val),
              ),
              cupertino.SizedBox(
                height: 20.0,
              ),
              InputButton(
                label: this.widget.mode == AuthenticateMode.SIGN_IN
                    ? 'Sign in'
                    : 'Sign up',
                callback: _onValidateButtonHandler,
              ),
              if (!_isValidate)
                cupertino.SizedBox(
                  height: 20.0,
                ),
              if (!_isValidate)
                cupertino.Text(
                  _error!,
                  style: cupertino.TextStyle(
                    color: cupertino.CupertinoColors.destructiveRed,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
