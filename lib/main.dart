import 'package:shikshamiraz/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // name: 'shikshamiraz',
      options: const FirebaseOptions(
          apiKey: "AIzaSyDZYZfRclKOZTUKGM1kstIOTnYl-1Pvli8",
          appId: "1:637209427083:web:26124fac5a01dea2e8688e",
          messagingSenderId: "637209427083",
          projectId: "emailauth-beb60"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email And Password Login',
      theme: ThemeData(primarySwatch: Colors.purple),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
