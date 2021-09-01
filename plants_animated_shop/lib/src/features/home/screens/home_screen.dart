import 'package:flutter/material.dart';
import 'package:plants_animated_shop/src/constants.dart';
import 'package:plants_animated_shop/src/controllers/home_controller.dart';
import 'package:plants_animated_shop/src/features/home/widgets/bottom_cart_bar.dart';
import 'package:plants_animated_shop/src/features/home/widgets/home_header.dart';
import 'package:plants_animated_shop/src/features/home/widgets/product_list.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: kBottomBarColor,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  final productListHeight =
                      constraints.maxHeight - kHeaderHeight - kCartBarHeight;
                  final bottomBarHeight =
                      _controller.homeState == HomeState.normal
                          ? kCartBarHeight
                          : constraints.maxHeight -
                              kHeaderHeight -
                              2 * kCartBarHeight;

                  return Stack(
                    children: <Widget>[
                      AnimatedPositioned(
                        duration: kPanelTransition,
                        top: _controller.homeState == HomeState.normal
                            ? kHeaderHeight
                            : -200.0,
                        right: 0.0,
                        left: 0.0,
                        height: productListHeight,
                        child: const ProductList(),
                      ),
                      AnimatedPositioned(
                        duration: kPanelTransition,
                        top: _controller.homeState == HomeState.normal
                            ? 0.0
                            : -kHeaderHeight,
                        right: 0.0,
                        left: 0.0,
                        height: kHeaderHeight,
                        child: const HomeHeader(),
                      ),
                      AnimatedPositioned(
                        duration: kPanelTransition,
                        bottom: 0.0,
                        right: 0.0,
                        left: 0.0,
                        height: bottomBarHeight,
                        child: BottomCartBar(
                          controller: _controller,
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
