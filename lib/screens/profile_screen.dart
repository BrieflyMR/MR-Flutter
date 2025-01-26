import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../core/constants.dart';
import '../widgets/bottom_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Profile Screen"),
          const Text("Briefly MR"),
          const Text("brieflymr@gmail.com"),
          if (Navigator.canPop(context))
            IconButton(
              onPressed: () {
                // Geri git
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ElevatedButton(
            onPressed: () {
              // Hesaptan çıkış yap
            },
            child: const Text("Hesaptan Çıkış Yap"),
          ),
          if (context.read<ThemeProvider>().isDark)
            IconButton(
              icon: const Icon(CupertinoIcons.sun_max),
              onPressed: () {
                context.read<ThemeProvider>().toggleTheme();
              },
            )
          else
            IconButton(
              icon: const Icon(CupertinoIcons.moon),
              onPressed: () {
                context.read<ThemeProvider>().toggleTheme();
              },
            ),
        ],
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}