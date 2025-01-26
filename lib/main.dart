import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Provider için gerekli
import 'package:flutter_app/core/themes.dart'; // Tema dosyası
import 'core/routes.dart'; // Rota dosyası

// Tema yönetimi için Provider sınıfı
class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter widget'larını başlat
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(), // ThemeProvider'ı global olarak tanımlıyoruz
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>(); // Tema durumunu dinliyoruz

    return MaterialApp.router(
      title: 'Flutter App',
      themeMode: themeProvider.isDark ? ThemeMode.dark : ThemeMode.light, // Tema modu
      theme: lightTheme, // Açık tema
      darkTheme: darkTheme, // Karanlık tema
      routerConfig: router, // go_router yapılandırmamızı kullan
      debugShowCheckedModeBanner: false, // Debug bandını kaldır
    );
  }
}
