import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../core/constants.dart';
import '../widgets/bottom_menu.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Arama"),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Ne aramak istersiniz?",
              prefixIcon: Icon(Icons.search),
              suffixIcon: Icon(Icons.mic),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildChip(context, "Tümü", true),
                  _buildChip(context, "Elektronik", false),
                  _buildChip(context, "Giyim", false),
                  _buildChip(context, "Kitap", false),
                  _buildChip(context, "Spor", false),
                  _buildChip(context, "Ev & Yaşam", false),
                  _buildChip(context, "Kozmetik", false),
                ],
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Son Aramalar",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Tümünü Temizle"),
                ),
              ],
            ),
            SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 2,
              child: Column(
                children: [
                  _buildRecentSearch("iPhone 13", "2 saat önce"),
                  Divider(height: 1),
                  _buildRecentSearch("Spor ayakkabı", "1 gün önce"),
                  Divider(height: 1),
                  _buildRecentSearch("Python kitabı", "3 gün önce"),
                ],
              ),
            ),
            SizedBox(height: 25),
            Text(
              "Popüler Aramalar",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildTrendChip(context, "Akıllı saat", 1),
                    _buildTrendChip(context, "Laptop", 2),
                    _buildTrendChip(context, "Kablosuz kulaklık", 3),
                    _buildTrendChip(context, "Tablet", 4),
                    _buildTrendChip(context, "E-kitap", 5),
                    _buildTrendChip(context, "Akıllı telefon", 6),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildChip(BuildContext context, String label, bool isSelected) {
  return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (bool selected) {},
      backgroundColor: isSelected ? Theme.of(context).primaryColor : Colors.grey[200],
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.black87,
        fontWeight: FontWeight.w500,
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    ),
  );
}

Widget _buildRecentSearch(String search, String time) {
  return ListTile(
    leading: CircleAvatar(
      backgroundColor: Colors.grey[200],
      child: Icon(Icons.history, color: Colors.grey[600]),
    ),
    title: Text(
      search,
      style: TextStyle(fontWeight: FontWeight.w500),
    ),
    subtitle: Text(time),
    trailing: Icon(Icons.north_west),
    onTap: () {},
  );
}

Widget _buildTrendChip(BuildContext context, String label, int rank) {
  return ActionChip(
    avatar: CircleAvatar(
      backgroundColor: Theme.of(context).primaryColor,
      radius: 12,
      child: Text(
        rank.toString(),
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
    ),
    label: Text(label),
    backgroundColor: Colors.grey[200],
    onPressed: () {},
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  );
  }
}
