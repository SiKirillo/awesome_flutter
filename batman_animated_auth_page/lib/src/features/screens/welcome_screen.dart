import 'package:batman_animated_auth_page/constants.dart';
import 'package:batman_animated_auth_page/src/features/widgets/batman_alone.dart';
import 'package:batman_animated_auth_page/src/features/widgets/batman_background.dart';
import 'package:batman_animated_auth_page/src/features/widgets/batman_city.dart';
import 'package:batman_animated_auth_page/src/features/widgets/batman_logo.dart';
import 'package:batman_animated_auth_page/src/features/widgets/login_form.dart';
import 'package:batman_animated_auth_page/src/features/widgets/welcome_form.dart';
import 'package:batman_animated_auth_page/src/features/widgets/screen_title.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _welcomeController;
  late AnimationController _navigationController;

  late Animation<double> _animationLogoUp;
  late Animation<double> _animationLogoMovementUp;
  late Animation<double> _animationBatmanIn;
  late Animation<double> _animationButtonsUp;

  late Animation<double> _animationLogoDown;
  late Animation<double> _animationBatmanUp;
  late Animation<double> _animationBatmanCity;
  late Animation<double> _animationLoginIn;

  bool _isWelcomeScreen = true;
  bool _isLoginScreen = false;
  bool _isRegistrationScreen = false;

  final _welcomeAnimationTime = 4;
  final _navigationAnimationTime = 6;

  void _setupFirstAnimation() {
    _welcomeController = AnimationController(
      vsync: this,
      duration: Duration(seconds: _welcomeAnimationTime),
    );
    _animationLogoUp = Tween(begin: 30.0, end: 1.0).animate(CurvedAnimation(
      parent: _welcomeController,
      curve: const Interval(0.0, 0.25),
    ));
    _animationLogoMovementUp = CurvedAnimation(
      parent: _welcomeController,
      curve: const Interval(0.35, 0.5),
    );
    _animationBatmanIn = Tween(begin: 5.0, end: 1.0).animate(CurvedAnimation(
      parent: _welcomeController,
      curve: const Interval(
        0.7,
        1.0,
        curve: Curves.decelerate,
      ),
    ));
    _animationButtonsUp = CurvedAnimation(
      parent: _welcomeController,
      curve: const Interval(0.7, 1.0),
    );

    _welcomeController.forward();
  }

  void _setupSecondAnimation() {
    _navigationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: _navigationAnimationTime),
    );
    _animationLogoDown = CurvedAnimation(
      parent: _navigationController,
      curve: const Interval(0.0, 0.2),
    );
    _animationBatmanUp = CurvedAnimation(
      parent: _navigationController,
      curve: const Interval(0.35, 0.5),
    );
    _animationBatmanCity = CurvedAnimation(
      parent: _navigationController,
      curve: const Interval(0.6, 0.75),
    );
    _animationLoginIn = CurvedAnimation(
      parent: _navigationController,
      curve: const Interval(0.7, 1.0),
    );
  }

  @override
  void initState() {
    _setupFirstAnimation();
    _setupSecondAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _welcomeController.dispose();
    _navigationController.dispose();
    super.dispose();
  }

  void _onLoginHandler() {
    setState(() {
      _isWelcomeScreen = false;
      _isLoginScreen = true;
      _isRegistrationScreen = false;
    });
    _navigationController.forward(from: 0.0);
  }

  void _onRegistrationHandler() {
    setState(() {
      _isWelcomeScreen = false;
      _isLoginScreen = false;
      _isRegistrationScreen = true;
    });
    _navigationController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final animationDownPadding = size.height / 12;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: AnimatedBuilder(
          animation:
              Listenable.merge([_welcomeController, _navigationController]),
          builder: (context, _) {
            final Widget welcomeTitle = Opacity(
              opacity: _isWelcomeScreen
                  ? _animationLogoMovementUp.value
                  : (1.0 - _animationLogoDown.value),
              child: Transform.translate(
                offset: Offset(
                    0.0,
                    animationDownPadding *
                        (_isWelcomeScreen
                            ? (1.0 - _animationButtonsUp.value)
                            : _animationLogoDown.value)),
                child: const ScreenTitle(
                  subtitle: 'WELCOME TO',
                  title: 'GOTHAM CITY',
                  description: 'YOU NEED ACCESS TO ENTER THE CITY',
                ),
              ),
            );
            final Widget welcomeForm = Opacity(
              opacity: _isWelcomeScreen
                  ? _animationButtonsUp.value
                  : (1.0 - _animationLogoDown.value),
              child: Transform.translate(
                offset: Offset(
                    0.0,
                    animationDownPadding *
                        (_isWelcomeScreen
                            ? (1.0 - _animationButtonsUp.value)
                            : _animationLogoDown.value)),
                child: WelcomeForm(
                  primaryTitle: 'LOGIN',
                  primaryCallback: _onLoginHandler,
                  secondaryTitle: 'SIGN UP',
                  secondaryCallback: _onRegistrationHandler,
                ),
              ),
            );

            final Widget loginTitle = Opacity(
              opacity: _animationLoginIn.value,
              child: Transform.translate(
                offset: Offset(
                  0.0,
                  animationDownPadding * _animationLoginIn.value,
                ),
                child: const ScreenTitle(
                  title: 'WELCOME BACK',
                  description: 'ENTER YOUR EMAIL & PASSWORD',
                ),
              ),
            );
            final Widget loginForm = Opacity(
              opacity: _animationLoginIn.value,
              child: Transform.translate(
                offset: Offset(
                  0.0,
                  animationDownPadding * _animationLoginIn.value,
                ),
                child: LoginForm(
                  buttonTitle: 'SIGN IN',
                  buttonCallback: () {},
                  isLogin: true,
                ),
              ),
            );

            final Widget registrationTitle = Opacity(
              opacity: _animationLoginIn.value,
              child: Transform.translate(
                offset: Offset(
                  0.0,
                  animationDownPadding * _animationLoginIn.value,
                ),
                child: const ScreenTitle(
                  title: 'GET ACCESS',
                  description: 'CREATE ACCOUNT FOR GET PASSES',
                ),
              ),
            );
            final Widget registrationForm = Opacity(
              opacity: _animationLoginIn.value,
              child: Transform.translate(
                offset: Offset(
                  0.0,
                  animationDownPadding * _animationLoginIn.value,
                ),
                child: LoginForm(
                  buttonTitle: 'SIGN UP',
                  buttonCallback: () {},
                  isLogin: false,
                ),
              ),
            );

            Widget buildLoginFormAccordingTheStep() {
              return ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(overscroll: false),
                child: SingleChildScrollView(
                  child: Flex(
                    direction: Axis.vertical,
                    children: <Widget>[
                      /// Opacity is 0.0 to know the batman logo height
                      if (_isWelcomeScreen || _animationLogoDown.value < 0.3)
                        const Opacity(
                          opacity: 0.0,
                          child: BatmanLogo(),
                        ),
                      if (_isWelcomeScreen || _animationLogoDown.value < 0.3)
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                      if (_isWelcomeScreen || _animationLogoDown.value < 0.3)
                        welcomeTitle,
                      if (_isLoginScreen && _animationLogoDown.value > 0.3)
                        loginTitle,
                      if (_isRegistrationScreen &&
                          _animationLogoDown.value > 0.3)
                        registrationTitle,
                      SizedBox(
                        height: size.height *
                            (_isWelcomeScreen || _animationLogoDown.value < 0.3
                                ? 0.06
                                : 0.04),
                      ),
                      if (_isWelcomeScreen || _animationLogoDown.value < 0.3)
                        welcomeForm,
                      if (_isLoginScreen && _animationLogoDown.value > 0.3)
                        loginForm,
                      if (_isRegistrationScreen &&
                          _animationLogoDown.value > 0.3)
                        registrationForm,
                    ],
                  ),
                ),
              );
            }

            return Container(
              color: Colors.black,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  const Positioned(
                    top: 0.0,
                    right: 0.0,
                    left: 0.0,
                    child: BatmanBackground(),
                  ),
                  Positioned(
                    top: -(size.height / 50.0),
                    right: 0.0,
                    left: 0.0,
                    child: Transform.translate(
                      offset: Offset(
                          0.0,
                          animationDownPadding *
                              (_animationLogoDown.value -
                                  _animationBatmanUp.value)),
                      child: Transform.scale(
                        scale: _animationBatmanIn.value,
                        child: const BatmanAlone(),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height / 4.8,
                    right: size.width / 8.0,
                    left: size.width / 8.0,
                    child: BatmanCity(
                      animation: _animationBatmanCity,
                    ),
                  ),
                  Positioned(
                    top: _isWelcomeScreen || _animationLogoDown.value < 0.3
                        ? (size.height / 2.8)
                        : (size.height / 2.5),
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: buildLoginFormAccordingTheStep(),
                  ),

                  /// Animated Logo
                  Positioned(
                    top: (size.height /
                        (2.0 + 0.8 * _animationLogoMovementUp.value)),
                    child: Opacity(
                      opacity: (1.0 - _animationLogoDown.value),
                      child: Transform.scale(
                        scale: _animationLogoUp.value,
                        child: const BatmanLogo(),
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
