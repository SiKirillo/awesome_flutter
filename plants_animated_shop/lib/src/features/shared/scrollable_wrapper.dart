import 'package:flutter/material.dart';
import 'package:plants_animated_shop/src/constants.dart';

class ScrollableWrapper extends StatelessWidget {
  final List<Widget> widgets;
  final Axis direction;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const ScrollableWrapper({
    Key? key,
    required this.widgets,
    this.direction = Axis.vertical,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: direction == Axis.vertical
          ? const EdgeInsets.only(bottom: kDefaultPadding / 4.0)
          : null,
      scrollDirection: direction,
      physics: const BouncingScrollPhysics(),
      child: Flex(
        direction: direction,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: widgets,
      ),
    );
  }
}