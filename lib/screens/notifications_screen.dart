import 'package:flutter/material.dart';
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
          Text("Sayfalar Arasi Geçiş")
    ]
      ),
        bottomNavigationBar: BottomMenu(),
    );
  }
}