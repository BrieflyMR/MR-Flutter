import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../core/constants.dart';
import '../widgets/bottom_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil",
          style: GoogleFonts.ubuntu(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: theme.colorScheme.onSurface,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              context.read<ThemeProvider>().isDark 
                ? CupertinoIcons.sun_max 
                : CupertinoIcons.moon,
              color: theme.colorScheme.primary,
            ),
            onPressed: () => context.read<ThemeProvider>().toggleTheme(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: theme.colorScheme.primary,
                child: Icon(Icons.person, size: 50, color: theme.colorScheme.onPrimary),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.person_outline, color: theme.colorScheme.primary),
                      title: Text("Briefly MR", style: GoogleFonts.ubuntu()),
                      subtitle: Text("Kullanıcı Adı", style: GoogleFonts.ubuntu()),
                    ),
                    const Divider(),
                    ListTile(
                      leading: Icon(Icons.email_outlined, color: theme.colorScheme.primary),
                      title: Text("brieflymr@gmail.com", style: GoogleFonts.ubuntu()),
                      subtitle: Text("E-posta", style: GoogleFonts.ubuntu()),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton.icon(
                onPressed: () => context.go('/login'),
                icon: const Icon(Icons.logout),
                label: Text("Hesaptan Çıkış Yap", style: GoogleFonts.ubuntu()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.error,
                  foregroundColor: theme.colorScheme.onError,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}