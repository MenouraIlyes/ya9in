import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ya9in/firebase_options.dart';
import 'package:ya9in/providers/course_provider.dart';
import 'package:ya9in/providers/lesson_provider.dart';
import 'package:ya9in/providers/user_provider.dart';
import 'package:ya9in/root_app.dart';
import 'package:ya9in/screens/auth_screen.dart';
import 'package:ya9in/screens/introduction_screen.dart';
import 'package:ya9in/services/phone_verification_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    MultiProvider(
      providers: [
        // Auth or Phone number provider
        ChangeNotifierProvider(
          create: (context) => PhoneVerification(),
        ),

        // User provider
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),

        // Course provider
        ChangeNotifierProvider(
          create: (context) => CourseProvider(),
        ),

        // Lesson provider
        ChangeNotifierProvider(
          create: (context) => LessonProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    print("pausing...");
    await Future.delayed(Duration(seconds: 3));
    print("unpausing...");
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yakin',
      debugShowCheckedModeBanner: false,
      home: AuthWrapper(),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkIntroductionSeen(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData && snapshot.data == false) {
          return IntroductionScreen();
        } else {
          return StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                return RootApp(); // User is signed in
              } else {
                return AuthScreen(); // User is not signed in
              }
            },
          );
        }
      },
    );
  }

  Future<bool> _checkIntroductionSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = prefs.getBool('introductionSeen') ?? false;

    if (!seen) {
      await prefs.setBool('introductionSeen', true);
    }

    return seen;
  }
}
