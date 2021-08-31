import 'package:flutter/material.dart';
import 'package:plants_animated_shop/src/constants.dart';
import 'package:plants_animated_shop/src/controllers/home_controller.dart';
import 'package:plants_animated_shop/src/features/home/widgets/home_header.dart';
import 'package:plants_animated_shop/src/features/home/widgets/product_card.dart';
import 'package:plants_animated_shop/src/models/product.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _controller = HomeController();

  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < -0.9) {
      _controller.changeHomeState(HomeState.cart);
    } else if (details.primaryDelta! > 0.9) {
      _controller.changeHomeState(HomeState.normal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: const Color(0xFFEAEAEA),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    children: <Widget>[
                      AnimatedPositioned(
                        duration: kPanelTransition,
                        top: _controller.homeState == HomeState.normal
                            ? kHeaderHeight
                            : -200.0,
                        right: 0.0,
                        left: 0.0,
                        height: constraints.maxHeight -
                            kHeaderHeight -
                            kCartBarHeight,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft:
                                  Radius.circular(kDefaultPadding * 1.5),
                              bottomRight:
                                  Radius.circular(kDefaultPadding * 1.5),
                            ),
                          ),
                          child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: demoProducts.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                              mainAxisSpacing: kDefaultPadding,
                              crossAxisSpacing: kDefaultPadding,
                            ),
                            itemBuilder: (context, index) => ProductCard(
                              product: demoProducts[index],
                              callback: () {},
                            ),
                          ),
                        ),
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
                        height: _controller.homeState == HomeState.normal
                            ? kCartBarHeight
                            : constraints.maxHeight -
                                kHeaderHeight -
                                2 * kCartBarHeight,
                        child: GestureDetector(
                          onVerticalDragUpdate: _onVerticalGesture,
                          child: Container(
                            color: Colors.red,
                          ),
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
