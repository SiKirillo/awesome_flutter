import 'package:flutter/material.dart';
import 'package:plants_animated_shop/src/constants.dart';
import 'package:plants_animated_shop/src/controllers/home_controller.dart';

class BottomCartBar extends StatelessWidget {
  final HomeController controller;

  const BottomCartBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < -0.9) {
      controller.changeHomeState(HomeState.cart);
    } else if (details.primaryDelta! > 0.9) {
      controller.changeHomeState(HomeState.normal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: _onVerticalGesture,
      child: Container(
        color: kBottomBarColor,
      ),
    );
  }
}
