import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/cart_provider.dart';

class ShoppingCard extends StatelessWidget {
  const ShoppingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cart, child) {
        if (cart.items.isEmpty) {
          return Scaffold(
            appBar: AppBar(
              leading: BackButton(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              backgroundColor: Theme.of(context).colorScheme.primary,
              title: Text(
                'Sepetim',
                style: GoogleFonts.ubuntu(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              elevation: 0,
            ),
            body: const Center(
              child: Text('Sepetiniz boş'),
            ),
          );
        }

        final theme = Theme.of(context);
        
        return Scaffold(
          appBar: AppBar(
            leading: BackButton(color: theme.colorScheme.onPrimary),
            backgroundColor: theme.colorScheme.primary,
            title: Text(
              'Sepetim',
              style: GoogleFonts.ubuntu(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: theme.colorScheme.onPrimary,
              ),
            ),
            elevation: 0,
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final item = cart.items[index];
                    return _buildCartItem(context, item, cart);
                  },
                ),
              ),
              _buildCheckoutSection(context, cart.totalPrice, theme, cart),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCartItem(BuildContext context, CartItem item, CartProvider cart) {
    final theme = Theme.of(context);
    
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      color: theme.colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.celebration,
                size: 32,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: GoogleFonts.ubuntu(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '₺${item.price.toStringAsFixed(2)}',
                    style: GoogleFonts.ubuntu(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove, color: theme.colorScheme.primary),
                  onPressed: () => cart.decreaseQuantity(item.name),
                ),
                Text(
                  '${item.quantity}',
                  style: GoogleFonts.ubuntu(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: theme.colorScheme.primary),
                  onPressed: () => cart.increaseQuantity(item.name),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckoutSection(
    BuildContext context,
    double total,
    ThemeData theme,
    CartProvider cart,
  ) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Toplam',
                style: GoogleFonts.ubuntu(
                  fontSize: 20,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              Text(
                '₺${total.toStringAsFixed(2)}',
                style: GoogleFonts.ubuntu(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Satın alma işlemi tamamlandı!')),
                );
                cart.clear();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                'Satın Al',
                style: GoogleFonts.ubuntu(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}