import 'package:dog_care/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Import your actual HomePage from main.dart
// import 'package:dog_care/main.dart'; // or wherever HomePage is defined

void main() {
  testWidgets('HomePage displays content and navigation bar', (WidgetTester tester) async {
    // Wrap HomePage in MaterialApp with proper localization
    await tester.pumpWidget(
      MaterialApp(
        home: HomePage(),
      ),
    );
    
    // Wait for the widget tree to settle
    await tester.pumpAndSettle();

    // Verify BottomNavigationBar items exist
    expect(find.text('Pets'), findsOneWidget);
    expect(find.text('Vaccinations'), findsOneWidget);
    expect(find.text('Albums'), findsOneWidget);
    expect(find.text('Appointments'), findsOneWidget);

    // Verify initial content displays
    expect(find.byType(Scaffold), findsOneWidget);
  });

  testWidgets('HomePage navigation works correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: HomePage(),
      ),
    );
    
    await tester.pumpAndSettle();

    // Test tapping on different navigation items
    await tester.tap(find.byIcon(Icons.vaccines_rounded));
    await tester.pumpAndSettle();
    expect(find.byType(Scaffold), findsOneWidget);

    await tester.tap(find.byIcon(Icons.photo_album_rounded));
    await tester.pumpAndSettle();
    expect(find.byType(Scaffold), findsOneWidget);
  });
}