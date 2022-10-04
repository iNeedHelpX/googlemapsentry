import 'package:flutter/material.dart';
import 'package:googlemapsentry/start/loading.dart';
import 'package:flutter_gradients_reborn/flutter_gradients_reborn.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: FlutterGradients.confidentCloud(
        type: GradientType.linear,
        tileMode: TileMode.clamp,
      )),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(
              height: 10,
            ),
            Loading()
          ],
        ),
      ),
    );
  }
}
