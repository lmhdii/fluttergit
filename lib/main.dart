import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_flutter_app_1/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: HomePage(),
    );
  }
}