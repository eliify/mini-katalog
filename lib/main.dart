import 'package:flutter/material.dart';

import 'models/product.dart';
import 'screens/cart_screen.dart';
import 'screens/home_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/product_list_screen.dart';

void main() {
  runApp(const MiniKatalogApp());
}

class MiniKatalogApp extends StatefulWidget {
  const MiniKatalogApp({super.key});

  @override
  State<MiniKatalogApp> createState() => _MiniKatalogAppState();
}

class _MiniKatalogAppState extends State<MiniKatalogApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final List<Product> _cartItems = [];
  final ValueNotifier<List<Product>> _cartNotifier = ValueNotifier([]);

  int get _cartCount => _cartItems.length;

  void _addToCart(Product product) {
    setState(() {
      _cartItems.add(product);
      _cartNotifier.value = List.from(_cartItems);
    });
  }

  void _removeFromCart(int index) {
    setState(() {
      _cartItems.removeAt(index);
      _cartNotifier.value = List.from(_cartItems);
    });
  }

  void _clearCart() {
    setState(() {
      _cartItems.clear();
      _cartNotifier.value = [];
    });
  }

  void _openProducts() {
    _navigatorKey.currentState?.pushNamed('/products');
  }

  void _openCart() {
    _navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (context) => ValueListenableBuilder<List<Product>>(
          valueListenable: _cartNotifier,
          builder: (context, items, _) {
            return CartScreen(
              cartItems: items,
              onRemoveItem: (index) {
                _removeFromCart(index);
                if (_cartItems.isEmpty) {
                  Navigator.of(context).pop();
                }
              },
              onClearCart: () {
                _clearCart();
                Navigator.of(context).pop();
              },
            );
          },
        ),
      ),
    );
  }

  void _openDetail(Product product) {
    _navigatorKey.currentState?.pushNamed(
      '/detail',
      arguments: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      title: 'Mini Katalog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(
              cartCount: _cartCount,
              onOpenProducts: _openProducts,
              onOpenCart: _openCart,
            ),
        '/products': (context) => ProductListScreen(
              cartCount: _cartCount,
              onOpenCart: _openCart,
              onProductTap: _openDetail,
            ),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          final product = settings.arguments as Product;
          return MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              product: product,
              cartCount: _cartCount,
              onOpenCart: _openCart,
              onAddToCart: () => _addToCart(product),
            ),
          );
        }
        return null;
      },
    );
  }
}
