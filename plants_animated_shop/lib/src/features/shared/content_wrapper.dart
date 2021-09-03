import 'package:flutter/material.dart';

import '../../constants.dart';

class ContentWrapper extends StatelessWidget {
  final Widget widget;

  const ContentWrapper({
    Key? key,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: widget,
    );
  }
}
