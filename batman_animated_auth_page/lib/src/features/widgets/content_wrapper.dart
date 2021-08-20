import 'package:flutter/material.dart';

class ContentWrapper extends StatelessWidget {
  final Widget content;

  const ContentWrapper({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      constraints: BoxConstraints(
        maxWidth: size.width * 0.8,
      ),
      child: content,
    );
  }
}
