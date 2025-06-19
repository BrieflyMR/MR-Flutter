import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController epostaYonetici = TextEditingController();
  TextEditingController sifreYonetici = TextEditingController();

  girisYap() {
  String email = epostaYonetici.text.trim();
  String password = sifreYonetici.text;

  bool isValidEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);

  if (email.isEmpty || password.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Bilgilerinizi Giriniz", style: GoogleFonts.ubuntu()),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Theme.of(context).colorScheme.error,
        showCloseIcon: true,
      ),
    );
  } else if (!isValidEmail) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Geçerli bir e-posta giriniz", style: GoogleFonts.ubuntu()),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Theme.of(context).colorScheme.error,
        showCloseIcon: true,
      ),
    );
  } else if (password.length < 8) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Şifreniz 8 karakterden kısa olamaz", style: GoogleFonts.ubuntu()),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Theme.of(context).colorScheme.error,
        showCloseIcon: true,
      ),
    );
  } else {
    context.go("/home");
  }
}

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.colorScheme.primary),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: epostaYonetici,
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
                controller: sifreYonetici,
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
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: girisYap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Giriş Yap", 
                    style: GoogleFonts.ubuntu(fontSize: 16, color: theme.colorScheme.onPrimary)),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () => context.pushReplacement("/register"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Kayıt Ol", 
                    style: GoogleFonts.ubuntu(fontSize: 16, color: theme.colorScheme.onSurface)),
                ),
              ),
              SizedBox(height: 20),
              Text("veya", 
                style: GoogleFonts.ubuntu(color: theme.colorScheme.onSurface.withOpacity(0.6))),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.apple, color: theme.colorScheme.onSurface),
                  label: Text("Apple ile devam et", 
                    style: GoogleFonts.ubuntu(color: theme.colorScheme.onSurface)),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.g_mobiledata, size: 30, color: theme.colorScheme.onSurface),
                  label: Text("Google ile devam et", 
                    style: GoogleFonts.ubuntu(color: theme.colorScheme.onSurface)),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
