import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'package:flutter_app/core/themes.dart'; 
import 'core/routes.dart'; 
import 'providers/cart_provider.dart';


class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized(); 
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()), 
        ChangeNotifierProvider(create: (_) => CartProvider()),  
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>(); 

    return MaterialApp.router(
      title: 'Flutter App',
      themeMode: themeProvider.isDark ? ThemeMode.dark : ThemeMode.light, 
      theme: lightTheme,
      darkTheme: darkTheme, 
      routerConfig: router, 
      debugShowCheckedModeBanner: false, 
    );
  }
}
