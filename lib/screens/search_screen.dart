import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_menu.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Arama",
        style: GoogleFonts.ubuntu(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: theme.colorScheme.onSurface,
        ),
        ),
        elevation: 0,
        backgroundColor: theme.colorScheme.surface,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: GoogleFonts.ubuntu(),
              decoration: InputDecoration(
                hintText: "Ne aramak istersiniz?",
                hintStyle: GoogleFonts.ubuntu(color: theme.colorScheme.onSurface.withOpacity(0.7)),
                prefixIcon: Icon(Icons.search, color: theme.colorScheme.primary),
                suffixIcon: Icon(Icons.mic, color: theme.colorScheme.primary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: theme.colorScheme.primary),
                ),
                filled: true,
                fillColor: theme.colorScheme.surface,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Kategoriler",
                style: GoogleFonts.ubuntu(
                  fontSize: theme.textTheme.titleLarge?.fontSize,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildChip(context, "Tümü", true),
                    _buildChip(context, "Doğum Günü", false),
                    _buildChip(context, "Yılbaşı", false),
                    _buildChip(context, "Kostümler", false),
                    _buildChip(context, "Dekorasyon", false),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Son Aramalar",
                    style: GoogleFonts.ubuntu(
                      fontSize: theme.textTheme.titleLarge?.fontSize,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Tümünü Temizle",
                      style: GoogleFonts.ubuntu(color: theme.colorScheme.secondary),
                    ),
                  ),
                ],
              ),
              Card(
                color: theme.colorScheme.surface,
                child: Column(
                  children: [
                    _buildRecentSearch(context, "Doğum günü süsleri", "2 saat önce"),
                    const Divider(height: 1),
                    _buildRecentSearch(context, "Parti kostümleri", "1 gün önce"),
                    const Divider(height: 1),
                    _buildRecentSearch(context, "Balon seti", "3 gün önce"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomMenu(currentIndex: 1),
    );
  }

  Widget _buildChip(BuildContext context, String label, bool isSelected) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: FilterChip(
        label: Text(label, style: GoogleFonts.ubuntu()),
        selected: isSelected,
        onSelected: (bool selected) {},
        backgroundColor: isSelected ? theme.colorScheme.primary : theme.colorScheme.surface,
        labelStyle: GoogleFonts.ubuntu(
          color: isSelected ? Colors.white : theme.colorScheme.onSurface,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildRecentSearch(BuildContext context, String search, String time) {
    final theme = Theme.of(context);
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
        child: Icon(Icons.history, color: theme.colorScheme.primary),
      ),
      title: Text(
        search,
        style: GoogleFonts.ubuntu(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(time, style: GoogleFonts.ubuntu()),
      trailing: Icon(Icons.north_west, color: theme.colorScheme.primary),
      onTap: () {},
    );
  }
}