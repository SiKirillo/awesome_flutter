import 'package:flutter/material.dart';

import '../../constants.dart';

class ContentWrapper extends StatelessWidget {
  final Widget widget;
  final double? maxHeight;

  const ContentWrapper({
    Key? key,
    required this.widget,
    this.maxHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      constraints: maxHeight != null
          ? BoxConstraints(
              maxHeight: maxHeight!,
            )
          : null,
      child: widget,
    );
  }
}
