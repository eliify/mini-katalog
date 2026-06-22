# Mini Katalog

Flutter ile geliştirilen basit bir ürün katalog uygulaması. Ana sayfa, ürün listesi (GridView) ve ürün detay ekranları bulunur. Ürünler wantapi.com API üzerinden çekilir; internet yoksa yerel JSON dosyası kullanılır.

## Özellikler

- Ana sayfa ve banner görseli
- GridView ile ürün listesi
- Ürün detay ekranı (route arguments)
- Named routes ve MaterialPageRoute
- Arama / filtreleme
- Sepet simülasyonu (sepete ekle, sepet ekranı)
- JSON model (fromJson / toJson)
- Ek paket kullanılmadı (sadece material.dart)

## Gereksinimler

- Flutter SDK 3.44.2
- Android Studio veya VS Code
- Android emülatör veya fiziksel cihaz

## Kurulum

1. Flutter SDK kurulu değilse: https://docs.flutter.dev/get-started/install/windows
2. Proje klasörüne gidin:

```bash
cd C:\projects\mini_katalog
```

3. Bağımlılıkları indirin:

```bash
flutter pub get
```

4. Uygulamayı çalıştırın:

```bash
flutter run
```

## Proje Yapısı

```
lib/
  main.dart
  models/product.dart
  data/
    product_service.dart
    product_translations.dart
  screens/
    home_screen.dart
    product_list_screen.dart
    product_detail_screen.dart
    cart_screen.dart
  widgets/
    product_card.dart
    cart_icon_button.dart
assets/
  products.json
screenshots/
```

## Veri Kaynakları

- API: https://wantapi.com/products.php
- Banner: https://wantapi.com/assets/banner.png
- Yerel yedek: assets/products.json
