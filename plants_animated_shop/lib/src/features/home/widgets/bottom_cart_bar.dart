import 'package:flutter/material.dart';
import 'package:plants_animated_shop/src/constants.dart';
import 'package:plants_animated_shop/src/controllers/home_controller.dart';
import 'package:plants_animated_shop/src/features/home/widgets/cart_details_view.dart';
import 'package:provider/provider.dart';

import 'cart_short_view.dart';

class BottomCartBar extends StatelessWidget {
  const BottomCartBar({Key? key}) : super(key: key);

  void _onVerticalGesture(DragUpdateDetails details, BuildContext context) {
    if (details.primaryDelta! < -0.9) {
      context.read<HomeController>().changeHomeState(HomeState.cart);
    } else if (details.primaryDelta! > 0.9) {
      context.read<HomeController>().changeHomeState(HomeState.normal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) => _onVerticalGesture(details, context),
      child: Container(
        color: kBottomBarColor,
        child: AnimatedSwitcher(
          duration: kPanelTransition,
          child: context.watch<HomeController>().homeState == HomeState.normal
              ? const CartShortView()
              : const CartDetailsView(),
        ),
      ),
    );
  }
}
