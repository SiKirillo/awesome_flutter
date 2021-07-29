import 'package:flutter/cupertino.dart' as cupertino;

class SettingsWrapper extends cupertino.StatelessWidget {
  final cupertino.Widget widget;

  const SettingsWrapper({cupertino.Key? key, required this.widget})
      : super(key: key);

  @override
  cupertino.Widget build(cupertino.BuildContext context) {
    return cupertino.Container(
      padding: cupertino.EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 20.0,
      ),
      child: this.widget,
    );
  }
}
