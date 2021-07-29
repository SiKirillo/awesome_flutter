import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;

class InputButton extends cupertino.StatelessWidget {
  final String label;
  final Function callback;

  const InputButton({
    cupertino.Key? key,
    required this.label,
    required this.callback,
  }) : super(key: key);

  void _onButtonHandler() {
    this.callback();
  }

  @override
  cupertino.Widget build(cupertino.BuildContext context) {
    return cupertino.CupertinoButton(
      onPressed: _onButtonHandler,
      padding: cupertino.EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      color: material.Colors.pinkAccent,
      child: cupertino.Flex(
        direction: cupertino.Axis.horizontal,
        mainAxisSize: cupertino.MainAxisSize.min,
        children: <cupertino.Widget>[
          cupertino.Text(
            this.label,
            style: cupertino.TextStyle(
              color: material.Colors.white,
              fontWeight: cupertino.FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
