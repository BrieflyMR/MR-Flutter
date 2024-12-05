import 'package:flutter/material.dart';
import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo bölümü
            SizedBox(
              width: 150,
              height: 150,
              child: Image.asset(
                'assets/images/testresmi.jpg',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 30), // Boşluk

            // Yükleniyor animasyonu
            DotLottieLoader.fromAsset(
              "assets/motions/loading.json",
              frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                if (dotlottie != null) {
                  return Lottie.asset(
                    'assets/motions/loading.json',
                    width: 100,
                    height: 100,
                  );
                } else {
                  return const CircularProgressIndicator(); // Yüklenememe durumunda alternatif
                }
              },
            ),

            const SizedBox(height: 20), // Boşluk
            const Text(
              "Yükleniyor...",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
