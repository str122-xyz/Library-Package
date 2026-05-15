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
}
