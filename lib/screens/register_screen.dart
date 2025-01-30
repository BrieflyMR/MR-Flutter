import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                style: GoogleFonts.ubuntu(),
                decoration: InputDecoration(
                  hintText: "Ad Soyad",
                  hintStyle: GoogleFonts.ubuntu(color: theme.colorScheme.onSurface.withOpacity(0.6)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: theme.colorScheme.primary),
                  ),
                  prefixIcon: Icon(Icons.person, color: theme.colorScheme.primary),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                style: GoogleFonts.ubuntu(),
                decoration: InputDecoration(
                  hintText: "E-Posta",
                  hintStyle: GoogleFonts.ubuntu(color: theme.colorScheme.onSurface.withOpacity(0.6)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: theme.colorScheme.primary),
                  ),
                  prefixIcon: Icon(Icons.email, color: theme.colorScheme.primary),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                obscureText: true,
                style: GoogleFonts.ubuntu(),
                decoration: InputDecoration(
                  hintText: "Şifre",
                  hintStyle: GoogleFonts.ubuntu(color: theme.colorScheme.onSurface.withOpacity(0.6)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: theme.colorScheme.primary),
                  ),
                  prefixIcon: Icon(Icons.lock, color: theme.colorScheme.primary),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                obscureText: true,
                style: GoogleFonts.ubuntu(),
                decoration: InputDecoration(
                  hintText: "Şifre Tekrar",
                  hintStyle: GoogleFonts.ubuntu(color: theme.colorScheme.onSurface.withOpacity(0.6)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: theme.colorScheme.primary),
                  ),
                  prefixIcon: Icon(Icons.lock_outline, color: theme.colorScheme.primary),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () => context.push("/home"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Kayıt Ol", 
                    style: GoogleFonts.ubuntu(fontSize: 16, color: theme.colorScheme.onPrimary)),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () => context.push("/login"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Giriş Yap", 
                    style: GoogleFonts.ubuntu(fontSize: 16, color: theme.colorScheme.onSurface)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
        }
      }