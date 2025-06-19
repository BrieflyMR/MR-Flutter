import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_menu.dart';
import 'shopping_card.dart';
import '../providers/cart_provider.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final products = [
      {
        'baslik': 'Doğum Günü Balonları',
        'fiyat': '49.99',
        'degerlendirme': '4.5',
        'imageUrl': 'assets/images/doğumgünübalonları.jpg',
      },
      {
        'baslik': 'Doğum Günü Şapkaları',
        'fiyat': '29.99',
        'degerlendirme': '4.3',
        'imageUrl': 'assets/images/doğumgünüşapkaları.jpg',
      },
      {
        'baslik': 'Konfeti Seti',
        'fiyat': '19.99',
        'degerlendirme': '4.2',
        'imageUrl': 'assets/images/konfeti.jpg',
      },
      {
        'baslik': 'Yılbaşı Süsü',
        'fiyat': '39.99',
        'degerlendirme': '4.6',
        'imageUrl': 'assets/images/yilbaşisüsü.jpg',
      },
      {
        'baslik': 'Parti Gözlüğü',
        'fiyat': '24.99',
        'degerlendirme': '4.1',
        'imageUrl': 'assets/images/partigözlüğü.jpg',
      },
      {
        'baslik': 'Neon Işıklar',
        'fiyat': '59.99',
        'degerlendirme': '4.8',
        'imageUrl': 'assets/images/neonışıklar.jpg',
      },
      {
        'baslik': 'Yılbaşı Şapkası',
        'fiyat': '34.99',
        'degerlendirme': '4.4',
        'imageUrl': 'assets/images/yılbaşışapkası.png',
      },
      {
        'baslik': 'Parti Düdüğü',
        'fiyat': '14.99',
        'degerlendirme': '4.0',
        'imageUrl': 'assets/images/partidüdüğü.jpg',
      },
      {
        'baslik': 'Hediye Kutusu',
        'fiyat': '64.99',
        'degerlendirme': '4.7',
        'imageUrl': 'assets/images/hediyekutusu.jpg',
      },
      {
        'baslik': 'Parti Balonları',
        'fiyat': '44.99',
        'degerlendirme': '4.5',
        'imageUrl': 'assets/images/partibalonları.jpg',
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
          Consumer<CartProvider>(
            builder: (context, cart, child) {
              return Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.shopping_cart_outlined,
                        color: theme.colorScheme.primary),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ShoppingCard()),
                      );
                    },
                  ),
                  if (cart.itemCount > 0)
                    Positioned(
                      right: 6,
                      top: 6,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 20,
                          minHeight: 20,
                        ),
                        child: Text(
                          cart.itemCount.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                ],
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
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
      bottomNavigationBar: const BottomMenu(currentIndex: 2),
    );
  }

  Widget _buildProductCard(BuildContext context, Map product) {
    final theme = Theme.of(context);
    final cart = Provider.of<CartProvider>(context, listen: false);
    final price = double.tryParse(product['fiyat']) ?? 0.0;

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
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15)),
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary.withOpacity(0.1),
                    theme.colorScheme.secondary.withOpacity(0.1),
                  ],
                ),
              ),
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  product['imageUrl'],
                  fit: BoxFit.cover,
                  width: double.infinity,
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
                    product['baslik'],
                    style: GoogleFonts.ubuntu(
                      fontSize: theme.textTheme.titleMedium?.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '₺${price.toStringAsFixed(2)}',
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
                          Icon(Icons.star,
                              size: 16, color: theme.colorScheme.secondary),
                          const SizedBox(width: 4),
                          Text(product['degerlendirme'],
                              style: GoogleFonts.ubuntu()),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.add_shopping_cart,
                            color: theme.colorScheme.primary),
                        onPressed: () {
                          cart.addItem(product['baslik'], price);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${product['baslik']} sepete eklendi!'),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
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
