import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/screens/home_screen.dart';

void main() {
  testWidgets('HomeScreen has buttons', (WidgetTester tester) async {

    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    expect(find.text('Biblioteca de Músicas'), findsOneWidget);

    expect(find.text('Playlists'), findsOneWidget);
  });

  testWidgets('Navigating to MusicScreen works', (WidgetTester tester) async {

    await tester.pumpWidget(MaterialApp(home: HomeScreen()));
    await tester.tap(find.text('Biblioteca de Músicas'));
    await tester.pumpAndSettle();

    expect(find.text('Biblioteca de Músicas'), findsNothing);
  });
}
