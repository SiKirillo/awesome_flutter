import 'package:flutter/material.dart';
import 'package:mobile_book_reader/core/constants.dart';

class ContentWrapper extends StatelessWidget {
  final Widget widget;

  const ContentWrapper({
    Key? key,
    required this.widget,
  }) : super(key: key);

  static double getWrapperPadding(BuildContext context) {
    final mq = MediaQuery.of(context);
    return StyleConstants.kDefaultPadding + mq.size.width * 0.03;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getWrapperPadding(context)),
      child: widget,
    );
  }
}
