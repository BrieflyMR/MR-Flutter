import 'package:flutter/material.dart';
import 'package:flutter_app/screens/shopping_card.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_menu.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final products = [
      {
        'title': 'Doğum Günü Balonları',
        'price': '49.99',
        'rating': '4.5',
        'icon': Icons.cake,
      },
      {
        'title': 'Renkli Şapkalar',
        'price': '29.99',
        'rating': '4.3',
        'icon': Icons.emoji_people,
      },
      {
        'title': 'Konfeti Seti',
        'price': '19.99',
        'rating': '4.2',
        'icon': Icons.auto_awesome,
      },
      {
        'title': 'Yılbaşı Süsü',
        'price': '39.99',
        'rating': '4.6',
        'icon': Icons.star,
      },
      {
        'title': 'Parti Gözlüğü',
        'price': '24.99',
        'rating': '4.1',
        'icon': Icons.remove_red_eye,
      },
      {
        'title': 'Işıklı Aksesuar',
        'price': '59.99',
        'rating': '4.8',
        'icon': Icons.light_mode,
      },
      {
        'title': 'Yılbaşı Şapkası',
        'price': '34.99',
        'rating': '4.4',
        'icon': Icons.wb_incandescent,
      },
      {
        'title': 'Parti Bandı',
        'price': '14.99',
        'rating': '4.0',
        'icon': Icons.format_color_fill,
      },
      {
        'title': 'Hediye Kutusu',
        'price': '64.99',
        'rating': '4.7',
        'icon': Icons.card_giftcard,
      },
      {
        'title': 'Simli Perde',
        'price': '44.99',
        'rating': '4.5',
        'icon': Icons.blur_on,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mağaza',
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
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return _buildProductCard(context, product);
              },
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

  Widget _buildProductCard(BuildContext context, Map product) {
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
                product['icon'],
                size: 48,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 2,
          fit: FlexFit.loose,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['title'],
                  style: GoogleFonts.ubuntu(
                    fontSize: theme.textTheme.titleMedium?.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '₺${product['price']}',
                  style: GoogleFonts.ubuntu(
                    fontSize: theme.textTheme.titleLarge?.fontSize,
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, size: 16, color: theme.colorScheme.secondary),
                        const SizedBox(width: 4),
                        Text(product['rating'], style: GoogleFonts.ubuntu()),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.add_shopping_cart, color: theme.colorScheme.primary),
                      onPressed: () {},
                      iconSize: 20,
                      padding: EdgeInsets.zero, 
                      constraints: const BoxConstraints(),
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
