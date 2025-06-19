import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController = TextEditingController();

  void kayitOl() {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;
    final repeatPassword = repeatPasswordController.text;

    final isEmailValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
    final isNameValid = RegExp(r'^[a-zA-ZçÇğĞıİöÖşŞüÜ0-9]+$').hasMatch(name);

    if (name.isEmpty || email.isEmpty || password.isEmpty || repeatPassword.isEmpty) {
      showError("Lütfen tüm alanları doldurun");
    } else if (!isNameValid) {
      showError("Ad Soyad sadece harf ve sayı içermelidir, boşluk ve özel karakter kullanmayın");
    } else if (!isEmailValid) {
      showError("Geçerli bir e-posta adresi giriniz");
    } else if (password.length < 8) {
      showError("Şifre en az 8 karakter olmalıdır");
    } else if (password != repeatPassword) {
      showError("Şifreler uyuşmuyor");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Başarıyla kayıt olundu", style: GoogleFonts.ubuntu()),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          showCloseIcon: true,
        ),
      );
      Future.delayed(const Duration(seconds: 1), () {
        context.go("/home");
      });
    }
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: GoogleFonts.ubuntu()),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Theme.of(context).colorScheme.error,
        showCloseIcon: true,
      ),
    );
  }

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
                controller: nameController,
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
              const SizedBox(height: 15),
              TextField(
                controller: emailController,
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
              const SizedBox(height: 15),
              TextField(
                controller: passwordController,
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
              const SizedBox(height: 15),
              TextField(
                controller: repeatPasswordController,
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
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: kayitOl,
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
              const SizedBox(height: 15),
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
