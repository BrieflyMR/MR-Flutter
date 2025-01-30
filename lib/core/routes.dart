import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/loading_screen.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/notifications_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/register_screen.dart';
import '../screens/search_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/shop_screen.dart';
import '../screens/shopping_card.dart';

final router = GoRouter(
  initialLocation: '/',  
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => NoTransitionPage(
        child: const LoadingScreen(),
      ),
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) => NoTransitionPage(
        child:  HomeScreen(),
      ),
    ),
    GoRoute(
      path: '/profile',
      pageBuilder: (context, state) => NoTransitionPage(
        child: const ProfileScreen(),
      ),
    ),
    GoRoute(
      path: '/notifications',
      pageBuilder: (context, state) => NoTransitionPage(
        child: const NotificationsScreen(),
      ),
    ),
    GoRoute(
      path: '/shop',
      pageBuilder: (context, state) => NoTransitionPage(
        child: const ShopScreen(),
      ),
    ),
    GoRoute(
      path: '/search',
      pageBuilder: (context, state) => NoTransitionPage(
        child: const SearchScreen(),
      ),
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) => NoTransitionPage(
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
      path: '/register',
      pageBuilder: (context, state) => NoTransitionPage(
        child: const RegisterScreen(),
      ),
    ),
    GoRoute(
      path: '/settings',
      pageBuilder: (context, state) => NoTransitionPage(
        child: const SettingsScreen(),
      ),
    ),
    GoRoute(
      path: '/shopping',
      pageBuilder: (context, state) => NoTransitionPage(
        child: const ShoppingCard(),
      ),
    ),
  ],
);