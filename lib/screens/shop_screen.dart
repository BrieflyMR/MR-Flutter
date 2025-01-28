import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/bottom_menu.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keşfet'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Filters
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                FilterChip(
                  label: const Text('Tümü'),
                  selected: true,
                  onSelected: (_) {},
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('Doğum Günü'),
                  selected: false,
                  onSelected: (_) {},
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('Yılbaşı'),
                  selected: false,
                  onSelected: (_) {},
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('Yeni Ürünler'),
                  selected: false,
                  onSelected: (_) {},
                ),
              ],
            ),
          ),

          // Product Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(15),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://picsum.photos/200/300?random=$index',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Parti Ürünü ${index + 1}',
                                  style: Theme.of(context).textTheme.titleMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '₺${(index + 1) * 50}',
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.star, size: 16, color: Colors.amber),
                                        Text('4.${index % 5 + 1}'),
                                      ],
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.shopping_cart_outlined),
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
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}