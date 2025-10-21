import 'package:dog_care/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Import your actual HomePage from main.dart
// import 'package:dog_care/main.dart'; // or wherever HomePage is defined

void main() {
  testWidgets('HomePage displays content and navigation bar', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: HomePage(),
      ),
    );
    
    await tester.pumpAndSettle();

    // Check navigation bar items instead of Scaffold count
    expect(find.text('Pets'), findsOneWidget);
    expect(find.text('Vaccinations'), findsOneWidget);
    expect(find.text('Albums'), findsOneWidget);
    expect(find.text('Appointments'), findsOneWidget);
    
    // Or check for BottomNavigationBar
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });
}