import 'package:flutter/cupertino.dart' as cupertino;

class DecoratedButton extends cupertino.StatelessWidget {
  final cupertino.Widget label;
  final cupertino.IconData? icon;
  final Function callback;

  const DecoratedButton({
    cupertino.Key? key,
    required this.label,
    this.icon,
    required this.callback,
  }) : super(key: key);

  void _onButtonHandler() {
    this.callback();
  }

  cupertino.Widget build(cupertino.BuildContext context) {
    return cupertino.CupertinoButton(
      onPressed: _onButtonHandler,
      padding: cupertino.EdgeInsets.zero,
      child: cupertino.Flex(
        direction: cupertino.Axis.horizontal,
        mainAxisSize: cupertino.MainAxisSize.min,
        children: <cupertino.Widget>[
          if (this.icon != null)
            cupertino.Padding(
              padding: cupertino.EdgeInsets.only(right: 5.0),
              child: cupertino.IconTheme(
                data: cupertino.IconThemeData(),
                child: cupertino.Icon(this.icon),
              ),
            ),
          this.label,
        ],
      ),
    );
  }
}
