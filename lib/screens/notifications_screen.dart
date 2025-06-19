import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_menu.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bildirimler',
          style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        elevation: 0,
        backgroundColor: theme.colorScheme.surface,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionTitle('Bugün', context),
          const SizedBox(height: 8),
          const NotificationTile(
            icon: Icons.celebration,
            iconColor: Colors.purpleAccent,
            title: 'Yeni Parti!',
            description: 'Yakınınızda yeni bir parti oluşturuldu',
            time: '2 saat önce',
            onTapMessage: 'Parti detaylarına yönlendiriliyor...',
          ),
          const NotificationTile(
            icon: Icons.person_add,
            iconColor: Colors.blueAccent,
            title: 'Yeni Takipçi',
            description: 'Keyvan sizi takip etmeye başladı',
            time: '5 saat önce',
            onTapMessage: 'Keyvan\'ın profiline gidiliyor...',
          ),
          const SizedBox(height: 24),
          _buildSectionTitle('Bu Hafta', context),
          const SizedBox(height: 8),
          const NotificationTile(
            icon: Icons.favorite,
            iconColor: Colors.redAccent,
            title: 'Beğeni Aldınız',
            description: 'Paylaşımınız 50 beğeni aldı',
            time: '2 gün önce',
            onTapMessage: 'Beğenilen paylaşım görüntüleniyor...',
          ),
          const NotificationTile(
            icon: Icons.event_available,
            iconColor: Colors.green,
            title: 'Etkinlik Hatırlatması',
            description: 'Yarınki parti için son hazırlıklar',
            time: '3 gün önce',
            onTapMessage: 'Etkinlik detayları açılıyor...',
          ),
        ],
      ),
      bottomNavigationBar: const BottomMenu(currentIndex: 0),
    );
  }

  Widget _buildSectionTitle(String title, BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.ubuntu(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String time;
  final Color iconColor;
  final String onTapMessage;

  const NotificationTile({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.time,
    required this.onTapMessage,
    this.iconColor = Colors.deepPurple,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(onTapMessage),
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: Icon(icon, color: iconColor, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: GoogleFonts.ubuntu(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(height: 4),
                    Text(description,
                        style: GoogleFonts.ubuntu(fontSize: 14)),
                    const SizedBox(height: 8),
                    Text(time,
                        style: GoogleFonts.ubuntu(
                          fontSize: 12,
                          color: Colors.grey[600],
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
