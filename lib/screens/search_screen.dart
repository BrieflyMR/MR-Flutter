import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_menu.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  final List<String> allItems = [
    "Doğum günü pastası",
    "Parti düdüğü",
    "Doğum günü balonları",
    "Yılbaşı şapkası",
    "Konfeti seti",
    "Neon ışıklar",
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    List<String> filteredItems = allItems
        .where((item) =>
            item.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Arama",
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
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              style: GoogleFonts.ubuntu(),
              decoration: InputDecoration(
                hintText: "Ne aramak istersiniz?",
                hintStyle: GoogleFonts.ubuntu(
                    color: theme.colorScheme.onSurface.withOpacity(0.7)),
                prefixIcon:
                    Icon(Icons.search, color: theme.colorScheme.primary),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear,
                            color: theme.colorScheme.primary),
                        onPressed: () {
                          _searchController.clear();
                          setState(() {
                            _searchQuery = "";
                          });
                        },
                      )
                    : Icon(Icons.mic, color: theme.colorScheme.primary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: theme.colorScheme.primary),
                ),
                filled: true,
                fillColor: theme.colorScheme.surface,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                "Sonuçlar",
                style: GoogleFonts.ubuntu(
                  fontSize: theme.textTheme.titleLarge?.fontSize,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 15),
              filteredItems.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Text(
                          "Sonuç bulunamadı.",
                          style: GoogleFonts.ubuntu(
                            fontSize: 18,
                            color: theme.colorScheme.onSurface.withOpacity(0.7),
                          ),
                        ),
                      ),
                    )
                  : Column(
                      children: filteredItems
                          .map((item) => ListTile(
                                title: Text(
                                  item,
                                  style: GoogleFonts.ubuntu(),
                                ),
                                leading: Icon(Icons.search,
                                    color: theme.colorScheme.primary),
                              ))
                          .toList(),
                    ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomMenu(currentIndex: 1),
    );
  }
}
