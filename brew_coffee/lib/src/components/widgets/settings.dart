import 'package:brew_coffee/models/user.dart';
import 'package:brew_coffee/services/database.dart';
import 'package:brew_coffee/services/locator.dart';
import 'package:brew_coffee/src/components/buttons/input.dart';
import 'package:brew_coffee/src/components/decoration/text_form.dart';
import 'package:brew_coffee/src/components/widgets/loading.dart';
import 'package:brew_coffee/src/components/wrappers/settings.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;

class SettingsWidget extends cupertino.StatefulWidget {
  const SettingsWidget({cupertino.Key? key}) : super(key: key);

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends cupertino.State<SettingsWidget> {
  final _formKey = cupertino.GlobalKey<cupertino.FormState>();
  final List<int> _dropdownSugars = [0, 1, 2, 3, 4];

  late String _uid;
  late String _name;
  late int _sugars;
  late int _strength;
  bool _isRendered = false;

  void _onNameFieldHandler(String value) {
    setState(() {
      _name = value;
    });
  }

  void _onSugarsFieldHandler(int value) {
    setState(() {
      _sugars = value;
    });
  }

  void _onStrengthFieldHandler(double value) {
    setState(() {
      _strength = value.round();
    });
  }

  void _onUpdateButtonHandler() {
    locator<DatabaseService>().updateUserData(
      _uid,
      _name,
      _sugars,
      _strength,
    );
    cupertino.Navigator.of(context).pop();
  }

  void _updateLocalUserData(UserData userData) {
    _uid = userData.uid ?? 'Unknown';
    _name = userData.name ?? 'Unknown';
    _sugars = userData.sugars ?? 0;
    _strength = userData.strength ?? 100;
    _isRendered = true;
  }

  cupertino.Widget _settingsWidget() {
    return cupertino.Flex(
      direction: cupertino.Axis.vertical,
      mainAxisSize: cupertino.MainAxisSize.min,
      children: <cupertino.Widget>[
        cupertino.Text(
          'Update your brew settings',
          style: cupertino.TextStyle(
            fontSize: 20.0,
          ),
        ),
        cupertino.SizedBox(
          height: 20.0,
        ),
        material.TextFormField(
          initialValue: _name,
          decoration: TextFormDecoration.copyWith(hintText: 'Name'),
          onChanged: (val) => _onNameFieldHandler(val),
        ),
        cupertino.SizedBox(
          height: 20.0,
        ),
        material.DropdownButtonFormField<int>(
          value: _sugars,
          decoration: TextFormDecoration,
          onChanged: (val) => _onSugarsFieldHandler(val!),
          items: _dropdownSugars.map((sugar) {
            return material.DropdownMenuItem(
              value: sugar,
              child: cupertino.Text('$sugar sugars'),
            );
          }).toList(),
        ),
        cupertino.SizedBox(
          height: 20.0,
        ),
        material.Slider(
          min: 100.0,
          max: 900.0,
          divisions: 8,
          activeColor: material.Colors.brown[_strength],
          inactiveColor: material.Colors.brown[_strength],
          value: _strength.toDouble(),
          onChanged: (val) => _onStrengthFieldHandler(val),
        ),
      ],
    );
  }

  @override
  cupertino.Widget build(cupertino.BuildContext context) {
    return material.Material(
      child: SettingsWrapper(
        widget: cupertino.StreamBuilder<UserData>(
          stream: locator<DatabaseService>().userData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (!_isRendered) {
                UserData? userData = snapshot.data;
                _updateLocalUserData(userData!);
              }

              return cupertino.Form(
                key: _formKey,
                child: cupertino.Flex(
                  direction: cupertino.Axis.vertical,
                  mainAxisAlignment: cupertino.MainAxisAlignment.spaceBetween,
                  children: <cupertino.Widget>[
                    _settingsWidget(),
                    cupertino.SizedBox(
                      height: 20.0,
                    ),
                    InputButton(
                      label: 'Update',
                      callback: _onUpdateButtonHandler,
                    ),
                  ],
                ),
              );
            } else {
              return LoadingWidget();
            }
          },
        ),
      ),
    );
  }
}
