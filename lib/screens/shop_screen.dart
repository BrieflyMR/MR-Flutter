import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../core/constants.dart';
import '../widgets/bottom_menu.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: ListView(
      children: [
        Text("Merhaba Arkadaşlar"),

  InkWell(
    onTap: () {
    context.go("/profile"); 
  },
  splashColor: Theme.of(context).colorScheme.primary,
  child: Row(
    children: [
      Icon(Icons.person, size: 38, color: Theme.of(context).colorScheme.primary),
      const SizedBox(width: 5.0),
      Text(
        "Profil",
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    ),

  InkWell(
    onTap: () {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Uyarı"),
          content: const Text("Hesabınızı silmek istediğinizden emin misiniz?"),
          actions: [
            IconButton(
              onPressed: () {
              },
              icon: const Icon(Icons.check_circle),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.cancel),
            ),
          ],
        ),
      );
    },
    splashColor: Theme.of(context).colorScheme.error,
    child: Row(
      children: [
        Icon(Icons.delete, size: 38, color: Theme.of(context).colorScheme.error),
        const SizedBox(width: 5.0),
        Text(
          "Hesabı Sil",
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}