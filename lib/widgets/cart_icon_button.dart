import 'package:flutter/material.dart';

class CartIconButton extends StatelessWidget {
  final int cartCount;
  final VoidCallback onTap;

  const CartIconButton({
    super.key,
    required this.cartCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      tooltip: 'Sepetim',
      icon: Badge(
        label: Text('$cartCount'),
        isLabelVisible: cartCount > 0,
        child: const Icon(Icons.shopping_cart_outlined),
      ),
    );
  }
}
