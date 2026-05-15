import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_button_tombol_lib/my_button_tombol_lib.dart';

void main() {
  //test custom button
  group('CustomButton', () {
    testWidgets('renders dengan label yang benar', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomButton(
              label: 'Klik Saya',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Klik Saya'), findsOneWidget);
    });

    testWidgets('menggunakan warna custom', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomButton(
              label: 'Test',
              onPressed: () {},
              color: Colors.red,
            ),
          ),
        ),
      );

      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      final style = button.style!.backgroundColor!.resolve({});
      expect(style, Colors.red);
    });
  });

  //test custom text
  group('CustomText', () {
    testWidgets('renders dengan teks yang benar', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomText(text: 'Hello World'),
          ),
        ),
      );

      expect(find.text('Hello World'), findsOneWidget);
    });

    testWidgets('menggunakan fontSize dan color custom',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomText(
              text: 'Styled Text',
              fontSize: 20,
              color: Colors.green,
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Styled Text'));
      expect(textWidget.style!.fontSize, 20);
      expect(textWidget.style!.color, Colors.green);
    });
  });

  //test custom card
  group('CustomCard', () {
    testWidgets('renders dengan title dan content yang benar',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomCard(
              title: 'Judul Card',
              content: 'Isi konten card',
            ),
          ),
        ),
      );

      expect(find.text('Judul Card'), findsOneWidget);
      expect(find.text('Isi konten card'), findsOneWidget);
    });

    testWidgets('renders dengan icon ketika diberikan',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomCard(
              title: 'Card dengan Icon',
              content: 'Ada icon di sini',
              icon: Icons.star,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
    });

    testWidgets('renders tanpa icon ketika tidak diberikan',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomCard(
              title: 'Card tanpa Icon',
              content: 'Tidak ada icon',
            ),
          ),
        ),
      );

      expect(find.byType(Icon), findsNothing);
    });

    testWidgets('menggunakan cardColor custom', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomCard(
              title: 'Card Biru',
              content: 'Warna biru',
              cardColor: Colors.blue,
            ),
          ),
        ),
      );

      final card = tester.widget<Card>(find.byType(Card));
      expect(card.color, Colors.blue);
    });
  });
}
