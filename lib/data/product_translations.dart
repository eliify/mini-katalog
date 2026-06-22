import '../models/product.dart';

class ProductTranslations {
  static String specLabel(String key) {
    const labels = {
      'chip': 'İşlemci',
      'material': 'Malzeme',
      'camera': 'Kamera',
      'display': 'Ekran',
      'battery': 'Pil',
      'weight': 'Ağırlık',
      'design': 'Tasarım',
      'screen': 'Ekran',
      'pencil': 'Kalem desteği',
      'case': 'Kasa',
      'brightness': 'Parlaklık',
      'gps': 'GPS',
      'feature': 'Özellik',
      'carbon': 'Karbon',
      'os': 'İşletim sistemi',
      'control': 'Kontrol',
      'audio': 'Ses',
      'driver': 'Sürücü',
      'cancellation': 'Gürültü engelleme',
      'materials': 'Malzemeler',
      'home': 'Akıllı ev',
      'sensing': 'Oda algılama',
      'size': 'Boyut',
      'colors': 'Renkler',
      'id': 'Güvenlik',
      'ports': 'Bağlantı noktaları',
    };
    return labels[key] ?? key;
  }

  static Product apply(Product product) {
    final tr = _data[product.id];
    if (tr == null) {
      return product;
    }

    return Product(
      id: product.id,
      name: product.name,
      tagline: tr['tagline'] as String,
      description: tr['description'] as String,
      price: product.price,
      currency: product.currency,
      image: product.image,
      specs: Map<String, String>.from(tr['specs'] as Map),
    );
  }

  static const Map<int, Map<String, dynamic>> _data = {
    1: {
      'tagline': 'Titanyum. Güçlü. Hafif. Pro.',
      'description':
          'A17 Pro işlemci, titanyum gövde ve 48MP kamera ile üst düzey performans sunar.',
      'specs': {
        'İşlemci': 'A17 Pro',
        'Malzeme': 'Titanyum',
        'Kamera': '48MP Ana kamera',
      },
    },
    2: {
      'tagline': 'Yeni kamera. Yeni tasarım. Yeni deneyim.',
      'description':
          'Dynamic Island ve 48MP kamera ile günlük kullanım için ideal bir iPhone modeli.',
      'specs': {
        'İşlemci': 'A16 Bionic',
        'Malzeme': 'Alüminyum',
        'Kamera': '48MP Ana kamera',
      },
    },
    3: {
      'tagline': 'Büyük ekran. Uzun pil ömrü.',
      'description':
          'Geniş Super Retina ekranı ve güçlü bataryası ile gün boyu kullanım sağlar.',
      'specs': {
        'İşlemci': 'A16 Bionic',
        'Ekran': '6.7 inç',
        'Pil': 'Tüm gün',
      },
    },
    4: {
      'tagline': 'Güçlü ve dayanıklı.',
      'description':
          'A15 Bionic işlemci ve çift kamera sistemi ile dengeli performans sunar.',
      'specs': {
        'İşlemci': 'A15 Bionic',
        'Ekran': '6.1 inç',
        'Kamera': 'Çift kamera',
      },
    },
    5: {
      'tagline': 'Gücü sev, fiyatı da.',
      'description':
          'Kompakt tasarımda A15 Bionic gücü ve Touch ID ile pratik bir telefon.',
      'specs': {
        'İşlemci': 'A15 Bionic',
        'Ekran': '4.7 inç',
        'Güvenlik': 'Touch ID',
      },
    },
    6: {
      'tagline': 'Profesyoneller için üstün güç.',
      'description':
          'M3 Max işlemci ve Liquid Retina XDR ekran ile yoğun iş yükleri için tasarlandı.',
      'specs': {
        'İşlemci': 'M3 Max',
        'Ekran': 'Liquid Retina XDR',
        'Pil': '22 saat',
      },
    },
    7: {
      'tagline': 'Pro performans, kompakt boyut.',
      'description':
          'M3 Pro işlemci ile video düzenleme ve üretkenlik odaklı kullanım sunar.',
      'specs': {
        'İşlemci': 'M3 Pro',
        'Ekran': '14.2 inç',
        'Bağlantı': 'HDMI, SDXC',
      },
    },
    8: {
      'tagline': 'İnce, hafif ve güçlü.',
      'description':
          'M2 işlemci ile taşınabilirlik ve performansı bir arada sunan laptop.',
      'specs': {
        'İşlemci': 'M2',
        'Ağırlık': '1.5 kg',
        'Tasarım': 'Fansız',
      },
    },
    9: {
      'tagline': 'Hafif tasarım, güçlü performans.',
      'description':
          '13.6 inç Liquid Retina ekran ve uzun pil ömrü ile günlük kullanım için ideal.',
      'specs': {
        'İşlemci': 'M2',
        'Pil': '18 saat',
        'Ekran': '13.6 inç',
      },
    },
    10: {
      'tagline': 'Şık tasarım, güçlü donanım.',
      'description':
          'M3 işlemci ve 24 inç 4.5K Retina ekran ile hepsi bir arada masaüstü deneyimi.',
      'specs': {
        'İşlemci': 'M3',
        'Ekran': '24 inç 4.5K Retina',
        'Renkler': '7 farklı renk',
      },
    },
    11: {
      'tagline': 'M2 ile üst düzey iPad deneyimi.',
      'description':
          'M2 işlemci ve Liquid Retina XDR ekran ile profesyonel kullanım sunar.',
      'specs': {
        'İşlemci': 'M2',
        'Ekran': 'XDR',
        'Kalem': 'Hover desteği',
      },
    },
    12: {
      'tagline': 'Hafif, parlak ve güçlü.',
      'description':
          'M1 işlemci ve 10.9 inç ekran ile çok yönlü bir tablet deneyimi sunar.',
      'specs': {
        'İşlemci': 'M1',
        'Ekran': '10.9 inç',
        'Bağlantı': '5G',
      },
    },
    13: {
      'tagline': 'Büyük güç, küçük boyut.',
      'description':
          '8.3 inç ekran ve A15 Bionic ile tek elde kullanım için ideal iPad.',
      'specs': {
        'İşlemci': 'A15 Bionic',
        'Ekran': '8.3 inç',
        'Kamera': '12MP geniş açı',
      },
    },
    14: {
      'tagline': 'Dayanıklılıkta yeni seviye.',
      'description':
          'Titanyum kasa ve çift frekanslı GPS ile outdoor kullanım için tasarlandı.',
      'specs': {
        'Kasa': 'Titanyum',
        'Parlaklık': '3000 nit',
        'GPS': 'Çift frekanslı',
      },
    },
    15: {
      'tagline': 'Daha akıllı, daha parlak.',
      'description':
          'S9 işlemci ve gelişmiş sağlık özellikleri ile günlük takip için ideal saat.',
      'specs': {
        'İşlemci': 'S9 SiP',
        'Özellik': 'Çift dokunuş',
        'Karbon': 'Nötr seçenek',
      },
    },
    16: {
      'tagline': 'Uzamsal bilgisayara hoş geldiniz.',
      'description':
          'Göz, el ve ses kontrolü ile üç boyutlu arayüz sunan yeni nesil cihaz.',
      'specs': {
        'Sistem': 'visionOS',
        'Ekran': 'Micro-OLED',
        'Kontrol': 'Göz, el, ses',
      },
    },
    17: {
      'tagline': 'Uyarlanabilir ses deneyimi.',
      'description':
          'H2 işlemci ile gelişmiş aktif gürültü engelleme ve net ses kalitesi.',
      'specs': {
        'İşlemci': 'H2',
        'Ses': 'Uzamsal ses',
        'Kutu': 'USB-C',
      },
    },
    18: {
      'tagline': 'Odaklanmış ses kalitesi.',
      'description':
          'Aktif gürültü engelleme ve yüksek sadakatli ses ile premium kulaklık.',
      'specs': {
        'Sürücü': 'Dinamik',
        'Gürültü engelleme': 'Aktif',
        'Malzeme': 'Örgü baş bandı',
      },
    },
    19: {
      'tagline': 'Odayı dolduran ses.',
      'description':
          'Oda algılama teknolojisi ile yüksek kaliteli akıllı hoparlör deneyimi.',
      'specs': {
        'Ses': 'Hesaplamalı ses',
        'Akıllı ev': 'Merkez cihaz',
        'Algılama': 'Oda algılama',
      },
    },
    20: {
      'tagline': 'Küçük boyut, büyük ses.',
      'description':
          'Kompakt tasarımda 360 derece ses ve akıllı ev entegrasyonu sunar.',
      'specs': {
        'Boyut': '8.4 cm',
        'Ses': '360 derece',
        'Renkler': '5 renk seçeneği',
      },
    },
  };
}
