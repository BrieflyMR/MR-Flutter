import 'package:flutter/material.dart';
import 'package:flutter_app/screens/shopping_card.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_menu.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Mağaza',
        style: GoogleFonts.ubuntu(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: theme.colorScheme.onSurface,
        ),
        ),
        elevation: 0,
        backgroundColor: theme.colorScheme.surface,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: theme.colorScheme.primary),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: theme.colorScheme.primary),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ShoppingCard()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: theme.colorScheme.surface,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _buildFilterChip(context, 'Tümü', true),
                  _buildFilterChip(context, 'Doğum Günü', false),
                  _buildFilterChip(context, 'Yılbaşı', false),
                  _buildFilterChip(context, 'Yeni Ürünler', false),
                  _buildFilterChip(context, 'İndirimli', false),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: 10,
              itemBuilder: (context, index) => _buildProductCard(context, index),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomMenu(currentIndex: 2),
    );
  }

  Widget _buildFilterChip(BuildContext context, String label, bool isSelected) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label, style: GoogleFonts.ubuntu()),
        selected: isSelected,
        onSelected: (_) {},
        backgroundColor: theme.colorScheme.surface,
        selectedColor: theme.colorScheme.primary.withOpacity(0.2),
        labelStyle: GoogleFonts.ubuntu(
          color: isSelected ? theme.colorScheme.primary : theme.colorScheme.onSurface,
          fontWeight: FontWeight.w500,
        ),
        side: BorderSide(
          color: isSelected ? theme.colorScheme.primary : theme.colorScheme.onSurface.withOpacity(0.2),
        ),
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, int index) {
    final theme = Theme.of(context);
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary.withOpacity(0.1),
                    theme.colorScheme.secondary.withOpacity(0.1),
                  ],
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.celebration,
                  size: 48,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Parti Malzemesi ${index + 1}',
                    style: GoogleFonts.ubuntu(
                      fontSize: theme.textTheme.titleMedium?.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '₺${(index + 1) * 99}.99',
                    style: GoogleFonts.ubuntu(
                      fontSize: theme.textTheme.titleLarge?.fontSize,
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, size: 16, color: theme.colorScheme.secondary),
                          const SizedBox(width: 4),
                          Text('4.${index % 5 + 1}', style: GoogleFonts.ubuntu()),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.add_shopping_cart, color: theme.colorScheme.primary),
                        onPressed: () {},
                        iconSize: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}