import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/cart_icon_button.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  final int cartCount;
  final VoidCallback onOpenCart;
  final VoidCallback onAddToCart;

  const ProductDetailScreen({
    super.key,
    required this.product,
    required this.cartCount,
    required this.onOpenCart,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        actions: [
          CartIconButton(
            cartCount: cartCount,
            onTap: onOpenCart,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                product.image,
                height: 220,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) {
                  return Container(
                    height: 220,
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.image_not_supported, size: 48),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(
              product.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              product.tagline,
              style: TextStyle(color: Colors.grey.shade700),
            ),
            const SizedBox(height: 12),
            Text(
              product.price,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Açıklama',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(product.description),
            if (product.specs.isNotEmpty) ...[
              const SizedBox(height: 16),
              const Text(
                'Özellikler',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ...product.specs.entries.map(
                (entry) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text('${entry.key}: ${entry.value}'),
                ),
              ),
            ],
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                onAddToCart();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product.name} sepete eklendi')),
                );
              },
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text('Sepete Ekle'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
