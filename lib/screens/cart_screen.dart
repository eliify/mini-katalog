import 'package:flutter/material.dart';

import '../models/product.dart';

class CartScreen extends StatelessWidget {
  final List<Product> cartItems;
  final void Function(int index) onRemoveItem;
  final VoidCallback onClearCart;

  const CartScreen({
    super.key,
    required this.cartItems,
    required this.onRemoveItem,
    required this.onClearCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sepetim'),
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text('Sepetiniz boş.'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final product = cartItems[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          leading: Image.network(
                            product.image,
                            width: 50,
                            height: 50,
                            fit: BoxFit.contain,
                            errorBuilder: (_, __, ___) {
                              return const Icon(Icons.image_not_supported);
                            },
                          ),
                          title: Text(product.name),
                          subtitle: Text(product.price),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_outline),
                            onPressed: () => onRemoveItem(index),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onClearCart,
                      child: Text('Sepeti Temizle (${cartItems.length} ürün)'),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
