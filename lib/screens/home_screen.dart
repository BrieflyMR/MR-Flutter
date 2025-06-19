import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Partyverse',
          style: GoogleFonts.ubuntu(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined,
                color: Theme.of(context).colorScheme.onPrimary),
            onPressed: () => context.push('/notifications'),
          ),
          IconButton(
            icon: Icon(Icons.search_outlined,
                color: Theme.of(context).colorScheme.onPrimary),
            onPressed: () => context.push('/search'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    child: Icon(Icons.person, size: 40,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Partyverse',
                    style: GoogleFonts.ubuntu(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: Text('Ana Sayfa', style: GoogleFonts.ubuntu()),
              onTap: () => context.go('/home'),
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag_outlined),
              title: Text('Mağaza', style: GoogleFonts.ubuntu()),
              onTap: () => context.push('/shop'),
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: Text('Profil', style: GoogleFonts.ubuntu()),
              onTap: () => context.push('/profile'),
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: Text('Ayarlar', style: GoogleFonts.ubuntu()),
              onTap: () => context.push('/settings'),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            height: 200,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ],
              ),
            ),
            child: Center(
              child: Text(
                '🎉 Yakındaki Partiler',
                style: GoogleFonts.ubuntu(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Text(
            'Kategoriler',
            style: GoogleFonts.ubuntu(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = selectedCategory == category;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = isSelected ? null : category;
                    });
                  },
                  child: Card(
                    margin: const EdgeInsets.only(right: 10),
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.surface,
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            categoryIcons[index],
                            size: 40,
                            color: isSelected
                                ? Theme.of(context).colorScheme.onPrimary
                                : Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            category,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.ubuntu(
                              fontSize: 12,
                              color: isSelected
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Text(
            selectedCategory != null
                ? '$selectedCategory Etkinlikleri'
                : 'Popüler Etkinlikler',
            style: GoogleFonts.ubuntu(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 10),
          ...List.generate(events.length, (index) {
            if (selectedCategory != null &&
                eventCategories[index] != selectedCategory) {
              return const SizedBox.shrink();
            }
            return Card(
              margin: const EdgeInsets.only(bottom: 10),
              color: Theme.of(context).colorScheme.surface,
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    eventIcons[index],
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                title: Text(
                  events[index],
                  style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold),
                ),
                subtitle:
                    Text(eventDates[index], style: GoogleFonts.ubuntu()),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {},
                ),
              ),
            );
          }),
        ],
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}

final List<String> categories = [
  'Doğum Günü',
  'Mezuniyet',
  'İş',
  'Festival',
  'Diğer'
];
final List<IconData> categoryIcons = [
  Icons.cake,
  Icons.school,
  Icons.work,
  Icons.festival,
  Icons.more_horiz
];
final List<String> events = [
  'Yaz Festivali',
  'Doğum Günü Partisi',
  'İş Kutlaması',
  'Mezuniyet'
];
final List<String> eventDates = [
  '15 Temmuz • İstanbul',
  '20 Temmuz • Ankara',
  '25 Temmuz • İzmir',
  '30 Temmuz • Bursa'
];
final List<String> eventCategories = [
  'Festival',
  'Doğum Günü',
  'İş',
  'Mezuniyet',
  'Diğer'
];
final List<IconData> eventIcons = [
  Icons.music_note,
  Icons.cake,
  Icons.work,
  Icons.school
];