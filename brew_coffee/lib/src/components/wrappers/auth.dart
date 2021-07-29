import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;

class AuthWrapper extends cupertino.StatelessWidget {
  final cupertino.Widget widget;

  const AuthWrapper({cupertino.Key? key, required this.widget})
      : super(key: key);

  @override
  cupertino.Widget build(cupertino.BuildContext context) {
    return cupertino.Container(
      padding: cupertino.EdgeInsets.all(20.0),
      decoration: cupertino.BoxDecoration(
        color: material.Colors.brown[200],
        borderRadius:
            cupertino.BorderRadius.all(cupertino.Radius.circular(10.0)),
      ),
      child: this.widget,
    );
  }
}
