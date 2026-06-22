import 'package:flutter/material.dart';

import '../data/product_service.dart';

import '../widgets/cart_icon_button.dart';

class HomeScreen extends StatelessWidget {
  final int cartCount;
  final VoidCallback onOpenProducts;
  final VoidCallback onOpenCart;

  const HomeScreen({
    super.key,
    required this.cartCount,
    required this.onOpenProducts,
    required this.onOpenCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini Katalog'),
        actions: [
          CartIconButton(
            cartCount: cartCount,
            onTap: onOpenCart,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: double.infinity,
              height: 180,
              child: Image.network(
                ProductService.bannerUrl,
                fit: BoxFit.contain,
                alignment: Alignment.center,
                errorBuilder: (_, __, ___) {
                  return Container(
                    color: Colors.grey.shade200,
                    child: const Center(child: Icon(Icons.store, size: 64)),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Teknoloji Ürünleri',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Telefon, bilgisayar ve aksesuarları inceleyin. '
                    'Ürünlere sepete ekleyerek basit bir sepet simülasyonu yapabilirsiniz.',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton.icon(
                onPressed: onOpenProducts,
                icon: const Icon(Icons.grid_view),
                label: const Text('Ürünleri Gör'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
