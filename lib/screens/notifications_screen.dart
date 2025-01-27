import 'package:flutter/material.dart';
import 'package:flutter_app/core/routes.dart';
import 'package:go_router/go_router.dart';
import '../core/constants.dart';
import '../widgets/bottom_menu.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final surface = lightColors["surface"]!;
    return Scaffold(
            backgroundColor: surface,
      body:ListView(
		children:[
          const Text("Sayfalar Arasi Geçiş"),
          ElevatedButton(
            onPressed: () {
              context.go("/login");
            }, 
            child: const Text("Giriş Yapiniz Go İle")),
          Divider(),
          ElevatedButton(
            onPressed: () {
              context.push("/login");
            }, 
            child: const Text("Giriş Yapiniz Push İle"))
    ]
      ),
        bottomNavigationBar: BottomMenu(),
    );
  }
}