import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vista/helper/sharedpreference.dart';
import 'package:vista/screen/dashboard.dart';
import 'package:vista/screen/login_signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

bool _isSignedIn = false;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    getUserLoggedInStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          primarySwatch: customPrimaryColor,
          primaryColor: const Color(0XFF188F79),
          focusColor: const Color(0XFF188F79)),
      debugShowCheckedModeBanner: false,
      home: _isSignedIn ? DashboardScrn() : const LoginScreen(),
    );
  }

  void getUserLoggedInStatus() async {
    await SharedpreferenceClass.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }
}

const MaterialColor customPrimaryColor = MaterialColor(0XFF188F79, <int, Color>{
  50: Color(0XFF188F79),
  100: Color(0XFF188F79),
  200: Color(0XFF188F79),
  300: Color(0XFF188F79),
  400: Color(0XFF188F79),
  500: Color(0XFF188F79),
  600: Color(0XFF188F79),
  700: Color(0XFF188F79),
  800: Color(0XFF188F79),
  900: Color(0XFF188F79),
});
