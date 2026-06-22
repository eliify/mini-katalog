import 'package:flutter_test/flutter_test.dart';

import 'package:mini_katalog/main.dart';

void main() {
  testWidgets('Ana sayfa acilir', (WidgetTester tester) async {
    await tester.pumpWidget(const MiniKatalogApp());

    expect(find.text('Mini Katalog'), findsOneWidget);
    expect(find.text('Ürünleri Gör'), findsOneWidget);
  });
}
