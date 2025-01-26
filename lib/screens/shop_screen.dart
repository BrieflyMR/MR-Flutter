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
        // Basit bir metin
        Text("Merhaba Arkadaşlar"),

        // İlk Inkwell örneği
        InkWell(
          onTap: () {
            // Tıklama kodu buraya gelecek
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

        // İkinci Inkwell örneği
        InkWell(
          onTap: () {
            // Tıklama kodu buraya gelecek
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

        // Inkwell ile tıklama ve uyarı diyaloğu
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Uyarı"),
                content: const Text("Silmekten emin misiniz?"),
                actions: [
                  IconButton(
                    onPressed: () {
                      // Onaylandı
                    },
                    icon: const Icon(Icons.check_circle),
                  ),
                  IconButton(
                    onPressed: () {
                      // Profili aç
                      context.push("/profile");
                    },
                    icon: const Icon(Icons.cancel),
                  ),
                ],
              ),
            );
          },
          splashColor: Theme.of(context).colorScheme.primary,
          child: Row(
            children: [
              const SizedBox(width: 5.0),
              Text(
                "Silme Uyarısı",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
}