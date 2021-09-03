import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteButton extends StatefulWidget {
  final double radius;
  final bool isSmall;
  final Function callback;

  const FavoriteButton({
    Key? key,
    this.radius = 12.0,
    this.isSmall = true,
    required this.callback,
  }) : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _isTapped = false;

  void _onTapHandler() {
    setState(() {
      _isTapped = !_isTapped;
    });

    widget.callback();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.isSmall ? 22.0 : 36.0,
      width: widget.isSmall ? 22.0 : 36.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFFE3E2E3),
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
          elevation: 0.5,
        ),
        onPressed: _onTapHandler,
        child: SvgPicture.asset(
          'assets/icons/heart.svg',
          height: widget.isSmall ? 12.0 : 20.0,
          width: widget.isSmall ? 12.0 : 20.0,
          color: _isTapped ? Colors.red : Colors.white,
        ),
      ),
    );
  }
}
