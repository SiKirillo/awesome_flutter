import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;
import 'package:flutter_spinkit/flutter_spinkit.dart' as spinkit;

class LoadingWidget extends cupertino.StatelessWidget {
  const LoadingWidget({cupertino.Key? key}) : super(key: key);

  @override
  cupertino.Widget build(cupertino.BuildContext context) {
    return cupertino.Container(
      child: cupertino.Center(
        child: spinkit.SpinKitChasingDots(
          color: material.Colors.brown,
          size: 50.0,
        ),
      ),
    );
  }
}
