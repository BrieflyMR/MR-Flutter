import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/core/constants.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final surface = lightColors["surface"]!;
    return Scaffold(
      backgroundColor: surface,
      body: SizedBox.expand(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: 500,
                height: 500,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            InkWell(
              onTap: () => context.go("/login"),
              child: SizedBox(
                width: 600,
                child: DotLottieLoader.fromAsset("assets/motions/loading3.lottie",
                      frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                    if (dotlottie != null) {
                      return Lottie.memory(dotlottie.animations.values.single);
                    } else {
                      return Container();
                    }
                  }),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}