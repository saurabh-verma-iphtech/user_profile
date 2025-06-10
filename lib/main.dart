import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod
import 'package:user_profile/firebase_options.dart';
import 'package:user_profile/screen/home_screen.dart';
import 'package:user_profile/screen/login_screen.dart';
import 'package:user_profile/screen/signup_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ProviderScope(
      // Wrap the app with ProviderScope
      child: ProfileMateApp(),
    ),
  );
}

class ProfileMateApp extends StatelessWidget {
  const ProfileMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/signup",
      routes: {
        "/login": (context) => LoginScreen(),
        "/signup": (context) => SignUpScreen(),
        "/home": (context) => HomeScreen(),
      },
    );
  }
}
