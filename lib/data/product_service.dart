import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

import '../models/product.dart';
import 'product_translations.dart';

class ProductService {
  static const String apiUrl = 'https://wantapi.com/products.php';
  static const String bannerUrl = 'https://wantapi.com/assets/banner.png';

  Future<List<Product>> getProducts() async {
    try {
      final jsonText = await _fetchFromApi();
      return _parseProductList(jsonText)
          .map(ProductTranslations.apply)
          .toList();
    } catch (_) {
      final localJson = await rootBundle.loadString('assets/products.json');
      return _parseProductList(localJson)
          .map(ProductTranslations.apply)
          .toList();
    }
  }

  Future<String> _fetchFromApi() async {
    final client = HttpClient();
    try {
      final request = await client.getUrl(Uri.parse(apiUrl));
      final response = await request.close();

      if (response.statusCode != HttpStatus.ok) {
        throw Exception('API hatası: ${response.statusCode}');
      }

      return await response.transform(utf8.decoder).join();
    } finally {
      client.close();
    }
  }

  List<Product> _parseProductList(String jsonText) {
    final decoded = json.decode(jsonText);

    List<dynamic> rawList;
    if (decoded is Map && decoded['data'] is List) {
      rawList = decoded['data'] as List;
    } else if (decoded is List) {
      rawList = decoded;
    } else {
      return [];
    }

    return rawList
        .map((item) => Product.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
