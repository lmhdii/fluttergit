import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:your_project_name/main.dart';

void main() async {
  setupFirebaseMocks();

  testWidgets('Test Firestore integration', (WidgetTester tester) async {
    // Initialiser Fake Firestore
    final firestore = FakeFirebaseFirestore();
    
    // Ajouter des données de test
    await firestore.collection('users').add({
      'name': 'Test User',
      'timestamp': Timestamp.now(),
    });

    // Construire notre widget
    await tester.pumpWidget(
      MaterialApp(
        home: FirestoreDemo(firestore: firestore),
      ),
    );

    // Vérifier l'affichage des données
    expect(find.text('Test User'), findsOneWidget);
    
    // Tester l'ajout de données
    await tester.enterText(find.byType(TextField), 'Nouvel Utilisateur');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Vérifier la nouvelle entrée
    expect(find.text('Nouvel Utilisateur'), findsOneWidget);
  });
}

// Configuration des mocks Firebase
void setupFirebaseMocks() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}