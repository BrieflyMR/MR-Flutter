// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/notification_card.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bildirimler'),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Bugün',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          NotificationCard(
            icon: Icons.celebration,
            title: 'Yeni Parti!',
            description: 'Yakınınızda yeni bir parti oluşturuldu',
            time: '2 saat önce',
          ),
          NotificationCard(
            icon: Icons.person_add,
            title: 'Yeni Takipçi',
            description: 'Ahmet sizi takip etmeye başladı',
            time: '5 saat önce',
          ),
          const SizedBox(height: 24),
          const Text(
            'Bu Hafta',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          NotificationCard(
            icon: Icons.favorite,
            title: 'Beğeni Aldınız',
            description: 'Paylaşımınız 50 beğeni aldı',
            time: '2 gün önce',
          ),
          NotificationCard(
            icon: Icons.event_available,
            title: 'Etkinlik Hatırlatması',
            description: 'Yarınki parti için son hazırlıklar',
            time: '3 gün önce',
          ),
        ],
      ),
    );
  }
}
