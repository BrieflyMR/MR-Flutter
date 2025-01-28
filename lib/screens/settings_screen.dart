import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

// SettingsScreen'in State sınıfı
class _SettingsScreenState extends State<SettingsScreen> {

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Ayarlar'),
      elevation: 0,
    ),

    body: ListView(
      children: [
        const SizedBox(height: 16),

       // Profil Bölümü
        ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: const Text('Profil Ayarları'),
          subtitle: const Text('Hesap bilgilerini düzenle'),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () => context.push('/profile'),
        ),

        const Divider(),

       // Bildirim Ayarları
        SwitchListTile(
          secondary: const Icon(Icons.notifications_outlined),
          title: const Text('Bildirimler'),
          subtitle: const Text('Bildirim tercihlerini yönet'),
          value: true,
          onChanged: (bool value) {},
        ),

       // Tema Ayarı
        SwitchListTile(
          secondary: const Icon(Icons.dark_mode_outlined),
          title: const Text('Koyu Tema'),
          subtitle: const Text('Uygulama temasını değiştir'),
          value: false,
          onChanged: (bool value) {},
        ),

        const Divider(),

       // Güvenlik
        ListTile(
          leading: const Icon(Icons.security),
          title: const Text('Güvenlik'),
          subtitle: const Text('Şifre ve güvenlik ayarları'),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {},
        ),

       // Gizlilik
        ListTile(
          leading: const Icon(Icons.privacy_tip_outlined),
          title: const Text('Gizlilik'),
          subtitle: const Text('Gizlilik tercihlerini yönet'),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {},
        ),

        const Divider(),

       // Yardım
        ListTile(
          leading: const Icon(Icons.help_outline),
          title: const Text('Yardım'),
          subtitle: const Text('SSS ve destek'),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {},
        ),

       // Hakkında
        ListTile(
          leading: const Icon(Icons.info_outline),
          title: const Text('Hakkında'),
          subtitle: const Text('Uygulama bilgileri'),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {},
        ),

        const Divider(),

       // Çıkış
        ListTile(
          leading: const Icon(Icons.logout, color: Colors.red),
          title: const Text('Çıkış Yap', 
            style: TextStyle(color: Colors.red),
          ),
          onTap: () => context.go('/login'),
        ),
      ],
    ),
  );
}
}