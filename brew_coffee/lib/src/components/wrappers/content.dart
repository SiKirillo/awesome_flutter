import 'package:flutter/cupertino.dart' as cupertino;

class ContentWrapper extends cupertino.StatelessWidget {
  final cupertino.Widget widget;

  const ContentWrapper({cupertino.Key? key, required this.widget}) : super(key: key);

  @override
  cupertino.Widget build(cupertino.BuildContext context) {
    return cupertino.Container(
      decoration: cupertino.BoxDecoration(
        image: cupertino.DecorationImage(
          image: cupertino.AssetImage('assets/coffee_bg.png'),
          fit: cupertino.BoxFit.cover,
        ),
      ),
      padding: cupertino.EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: cupertino.Flex(
        direction: cupertino.Axis.vertical,
        children: <cupertino.Widget>[
          this.widget,
        ],
      ),
    );
  }
}
