import 'package:flutter/material.dart';
import 'package:plants_animated_shop/src/constants.dart';
import 'package:plants_animated_shop/src/controllers/home_controller.dart';
import 'package:plants_animated_shop/src/features/home/widgets/bottom_cart_bar.dart';
import 'package:plants_animated_shop/src/features/home/widgets/home_header.dart';
import 'package:plants_animated_shop/src/features/home/widgets/product_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: kBottomBarColor,
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  final productListHeight =
                      constraints.maxHeight - kHeaderHeight - kCartBarHeight;
                  final bottomBarHeight = controller.homeState ==
                          HomeState.normal
                      ? kCartBarHeight
                      : constraints.maxHeight - kHeaderHeight - kCartBarHeight;

                  return Stack(
                    children: <Widget>[
                      AnimatedPositioned(
                        duration: kPanelTransition,
                        top: controller.homeState == HomeState.normal
                            ? kHeaderHeight
                            : -size.height * 0.45,
                        right: 0.0,
                        left: 0.0,
                        height: productListHeight,
                        child: const ProductList(),
                      ),
                      AnimatedPositioned(
                        duration: kPanelTransition,
                        top: controller.homeState == HomeState.normal
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
                        child: const BottomCartBar(),
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
