import 'package:batman_animated_auth_page/constants.dart';
import 'package:batman_animated_auth_page/src/shared/content_wrapper.dart';
import 'package:batman_animated_auth_page/src/shared/login_form.dart';
import 'package:batman_animated_auth_page/src/shared/screen_title.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _splashController;
  // late AnimationController _buttonController;

  late Animation<double> _animationLogoUp;
  late Animation<double> _animationLogoMovementUp;
  late Animation<double> _animationBatmanUp;
  late Animation<double> _animationButtonsUp;

  // late Animation<double> _animationLogoDown;

  void _setupFirstAnimation() {
    _splashController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _animationLogoUp = Tween(begin: 30.0, end: 1.0).animate(CurvedAnimation(
      parent: _splashController,
      curve: const Interval(0.0, 0.25),
    ));
    _animationLogoMovementUp = CurvedAnimation(
      parent: _splashController,
      curve: const Interval(0.35, 0.5),
    );
    _animationBatmanUp = Tween(begin: 5.0, end: 1.0).animate(CurvedAnimation(
      parent: _splashController,
      curve: const Interval(
        0.7,
        1.0,
        curve: Curves.decelerate,
      ),
    ));
    _animationButtonsUp = CurvedAnimation(
      parent: _splashController,
      curve: const Interval(0.7, 1.0),
    );

    _splashController.forward();
  }

  // void _setupSecondAnimation() {
  //   _buttonController = AnimationController(
  //     vsync: this,
  //     duration: const Duration(seconds: 6),
  //   );
  //   _animationLogoDown = CurvedAnimation(
  //     parent: _buttonController,
  //     curve: const Interval(0.0, 0.15),
  //   );
  // }

  @override
  void initState() {
    _setupFirstAnimation();
    // _setupSecondAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _splashController.dispose();
    // _buttonController.dispose();
    super.dispose();
  }

  void _onSignUpHandler() {
    // _buttonController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: Listenable.merge([_splashController]),
          builder: (context, _) {
            return Container(
              color: Colors.black,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    top: 0.0,
                    right: 0.0,
                    left: 0.0,
                    child: Image.asset('assets/batman_background.png'),
                  ),
                  Positioned(
                    top: 0.0,
                    right: 0.0,
                    left: 0.0,
                    child: Transform.scale(
                      scale: _animationBatmanUp.value,
                      child: Image.asset('assets/batman_alone.png'),
                    ),
                  ),
                  Positioned(
                    top: size.height / 2.8,
                    child: ContentWrapper(
                      content: Flex(
                        direction: Axis.vertical,
                        children: <Widget>[
                          /// Opacity is 0.0 to know the batman logo height
                          Opacity(
                            opacity: 0.0,
                            child: Image.asset(
                              'assets/batman_logo.png',
                              height: size.height / 14.0,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Opacity(
                            opacity: _animationLogoMovementUp.value,
                            child: const ScreenTitle(
                              subtitle: 'WELCOME TO',
                              title: 'GOTHAM CITY',
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.06,
                          ),
                          Opacity(
                            opacity: _animationButtonsUp.value,
                            child: Transform.translate(
                              offset: Offset(
                                  0.0, 100.0 * (1 - _animationButtonsUp.value)),
                              child: LoginForm(
                                primaryTitle: 'LOGIN',
                                primaryCallback: _onSignUpHandler,
                                secondaryTitle: 'SIGN UP',
                                secondaryCallback: _onSignUpHandler,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// Animated Logo
                  Positioned(
                    top: (size.height /
                        (2.0 + 0.8 * _animationLogoMovementUp.value)),
                    child: Transform.scale(
                      scale: _animationLogoUp.value,
                      child: Image.asset(
                        'assets/batman_logo.png',
                        height: size.height / 14.0,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
