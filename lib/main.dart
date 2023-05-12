import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kpc_shopping/screens/screen_signin.dart';

import 'firebase_options.dart';
import 'screens/screen_home.dart';
import 'screens/screen_signup.dart';

void main() async {
  // Initialize Firebase App
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/signup',
      routes: {
        '/': (context) => HomeScreen(),
        '/signin': (context) => SigninScreen(),
        '/signup': (context) => SignupScreen(),
      },
    );
  }
}
