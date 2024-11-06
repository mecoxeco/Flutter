import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/screens/home_screen.dart';

void main() {
  testWidgets('HomeScreen has buttons', (WidgetTester tester) async {
    // Build the widget tree
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    // Verify if the "Biblioteca de Músicas" button is present
    expect(find.text('Biblioteca de Músicas'), findsOneWidget);

    // Verify if the "Playlists" button is present
    expect(find.text('Playlists'), findsOneWidget);
  });

  testWidgets('Navigating to MusicScreen works', (WidgetTester tester) async {
    // Build the widget tree
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    // Tap the "Biblioteca de Músicas" button
    await tester.tap(find.text('Biblioteca de Músicas'));
    await tester.pumpAndSettle();

    // Verify that the navigation occurred (MusicScreen)
    expect(find.text('Biblioteca de Músicas'), findsNothing);
  });
}
