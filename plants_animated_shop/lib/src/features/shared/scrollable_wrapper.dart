import 'package:flutter/material.dart';

class ScrollableWrapper extends StatelessWidget {
  final List<Widget> widgets;
  final Axis direction;

  const ScrollableWrapper({
    Key? key,
    required this.widgets,
    this.direction = Axis.vertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: direction,
      child: Flex(
        direction: direction,
        children: widgets,
      ),
    );
  }
}
