import 'package:flutter/material.dart';
import 'package:smvm/Registration.dart';
import 'package:smvm/Signup.dart';
import 'package:smvm/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
  
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(), // Use your custom splash screen as the home screen
      // Add other configurations and routes here as needed
    );
  }
}
