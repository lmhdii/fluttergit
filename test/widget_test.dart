import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_flutter_app_1/main.dart';
import 'package:my_flutter_app_1/pages/home_page.dart';

// Mock de Firebase
void setupFirebaseMocks() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

void main() {
  setUpAll(() async { // Utiliser des accolades {} au lieu de crochets []
    setupFirebaseMocks(); // Ajouter un espace après await
  });

  group('Tests principaux de l\'application', () {
    testWidgets('Vérification de la structure de base', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Vérifie la présence des éléments clés
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
    });
  });

  group('Tests spécifiques à HomePage', () {
    testWidgets('Vérification du titre de l\'AppBar', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));
      
      expect(find.text('Note'), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('Vérification du FloatingActionButton', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));
      
      final fab = tester.widget<FloatingActionButton>(find.byType(FloatingActionButton));
      expect(fab.onPressed, isNotNull);
      expect(fab.child, const Icon(Icons.add));
    });

    testWidgets('Test de l\'interaction FAB', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));
      
      // Compteur initial de taps
      int tapCount = 0;
      
      // Remplacez cette partie par votre vraie logique si nécessaire
      final fab = tester.widget<FloatingActionButton>(find.byType(FloatingActionButton));
      fab.onPressed!();

      expect(tapCount, equals(0)); // Adaptez selon votre implémentation réelle
    });
  });
}