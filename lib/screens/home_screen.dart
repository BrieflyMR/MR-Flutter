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

  final Map<String, String> categoryEventDetails = {
    'Doğum Günü': 'Doğum günü partilerinizi heyecanla ve arkadaşlarınızla kutlamaya ne dersiniz ?',
    'Mezuniyet': 'Mezuniyet töreninizde tüm gözler sizin üzerinizde olsun.',
    'İş': 'İş bazen de eğlenmektir.',
    'Festival': 'Müzikle bu yazda eğlenmeye hazır mısın ?',
    'Diğer1': 'Çocuğunun cinsiyetini öğrenmenin eğlenceli bir yolu.',
    'Diğer2': 'Askere gitmeden önce sağlam bir gün geçirmeye ne dersin ?.',
  };

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
      const CircleAvatar(
        radius: 40,
        backgroundImage: AssetImage('assets/images/profile.jpg'),
        backgroundColor: Colors.transparent,  
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
    gradient: const LinearGradient(
      colors: [
        Color.fromRGBO(186, 85, 211, 0.7),  
        Color.fromRGBO(165, 42, 120, 0.5),  
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  child: Stack(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Opacity(
          opacity: 0.3,
          child: Image.asset(
            'assets/images/mezuniyet.jpg',  
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Mezuniyet Partisi',
              style: GoogleFonts.ubuntu(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.7),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '2-3 Temmuz • İstanbul',
              style: GoogleFonts.ubuntu(
                fontSize: 18,
                color: Colors.white70,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ],
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
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.4),
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              )
                            ]
                          : [],
                    ),
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
            if (selectedCategory != null) {
              if (selectedCategory == 'Diğer') {
                if (!eventCategories[index].toLowerCase().startsWith('diğer')) {
                  return const SizedBox.shrink();
                }
              } else if (eventCategories[index] != selectedCategory) {
                return const SizedBox.shrink();
              }
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
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
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
                subtitle: Text(eventDates[index], style: GoogleFonts.ubuntu()),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    final detail = categoryEventDetails[eventCategories[index]] ??
                        'Etkinlik detayları burada yer alacak.';

                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(events[index],
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 10),
                              Text('Tarih: ${eventDates[index]}',
                                  style: GoogleFonts.ubuntu()),
                              const SizedBox(height: 10),
                              Text(detail, style: GoogleFonts.ubuntu()),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            );
          }),
        ],
      ),
      bottomNavigationBar: const BottomMenu(currentIndex: 0),
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
  'Mezuniyet',
  'Doğum Günü Partisi',
  'İş Kutlaması',
  'Yaz Festivali',
  'Cinsiyet Partisi',
  'Asker Uğurlaması'
];
final List<String> eventDates = [
  '2-3 Temmuz • İstanbul',
  '20 Temmuz • Ankara',
  '25 Temmuz • İzmir',
  '30 Temmuz • Bursa',
  '5 Ağustos • Antalya',
  '10 Ağustos • Samsun'
];
final List<String> eventCategories = [
  'Mezuniyet',
  'Doğum Günü',
  'İş',
  'Festival',  
  'Diğer1',
  'Diğer2'
];
final List<IconData> eventIcons = [
  Icons.school,
  Icons.cake,
  Icons.work,
  Icons.music_note,  
  Icons.child_friendly,
  Icons.military_tech
];
