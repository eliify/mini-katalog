import 'package:flutter/material.dart';

import '../data/product_service.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../widgets/cart_icon_button.dart';

class ProductListScreen extends StatefulWidget {
  final int cartCount;
  final VoidCallback onOpenCart;
  final void Function(Product product) onProductTap;

  const ProductListScreen({
    super.key,
    required this.cartCount,
    required this.onOpenCart,
    required this.onProductTap,
  });

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductService _service = ProductService();
  final TextEditingController _searchController = TextEditingController();

  List<Product> _allProducts = [];
  List<Product> _filteredProducts = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadProducts();
    _searchController.addListener(_filterProducts);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadProducts() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final products = await _service.getProducts();
      setState(() {
        _allProducts = products;
        _filteredProducts = products;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Ürünler yüklenemedi.';
        _loading = false;
      });
    }
  }

  void _filterProducts() {
    final query = _searchController.text.toLowerCase().trim();

    setState(() {
      if (query.isEmpty) {
        _filteredProducts = List.from(_allProducts);
      } else {
        _filteredProducts = _allProducts.where((product) {
          return product.name.toLowerCase().contains(query) ||
              product.tagline.toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ürün Listesi'),
        actions: [
          CartIconButton(
            cartCount: widget.cartCount,
            onTap: widget.onOpenCart,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Ürün ara...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                isDense: true,
              ),
            ),
          ),
          Expanded(child: _buildBody()),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_error!),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _loadProducts,
              child: const Text('Tekrar Dene'),
            ),
          ],
        ),
      );
    }

    if (_filteredProducts.isEmpty) {
      return const Center(child: Text('Aramanıza uygun ürün bulunamadı.'));
    }

    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.72,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: _filteredProducts.length,
      itemBuilder: (context, index) {
        final product = _filteredProducts[index];
        return ProductCard(
          product: product,
          onTap: () => widget.onProductTap(product),
        );
      },
    );
  }
}
