// Import des packages nécessaires pour le testing
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_flutter_app_1/main.dart';
import 'package:my_flutter_app_1/pages/home_page.dart';

// Mock de Firebase pour les tests (nécessite firebase_core 2.14.0+)
void setupFirebaseMocks() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

void main() {
  // Initialisation des mocks Firebase avant tous les tests
  setUpAll(() async {
    await setupFirebaseMocks();
  });

  group('Test du widget principal MyApp', () {
    testWidgets('Test de l\'affichage initial avec Firebase', (WidgetTester tester) async {
      // Construction de notre widget et déclenchement du rendu
      await tester.pumpWidget(const MyApp());

      // Vérification 1: Le MaterialApp est bien présent avec la bonne configuration
      expect(
        find.byType(MaterialApp),
        findsOneWidget,
        reason: 'Le MaterialApp racine doit être présent',
      );

      // Vérification 2: Le debug banner est bien désactivé
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.debugShowCheckedModeBanner, isFalse);

      // Vérification 3: La HomePage est bien chargée
      expect(
        find.byType(HomePage),
        findsOneWidget,
        reason: 'La HomePage doit être le widget initial',
      );

      // Vérification 4: Firebase est bien initialisé
      expect(Firebase.app(), isNotNull, reason: 'Firebase doit être initialisé');
    });

    testWidgets('Test de la navigation de base', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Vérification que la barre d'app est présente avec le bon titre
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Home'), findsOneWidget); // Adaptez selon votre HomePage
    });
  });
}