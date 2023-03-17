// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medicine_app/Screens/CheckOut.dart';

import 'package:medicine_app/Screens/DetailsScreen.dart';
import 'package:medicine_app/Screens/HomePage.dart';
import 'package:medicine_app/Screens/LoginPage.dart';
import 'package:medicine_app/Screens/RegisterPage.dart';
import 'package:medicine_app/firebase_options.dart';
import 'package:medicine_app/provider/cart.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DefaultFirebaseOptions.currentPlatform;
  runApp(const MedicineApp());
}

class MedicineApp extends StatelessWidget {
  const MedicineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Cart();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'HomePage': (context) => HomePage(),
          'LoginPage': (context) => LoginPage(),
          'RegisterPage': (context) => RegisterPage(),
          'CheckOut': (context) => CheckOut(),
        },
        initialRoute: 'LoginPage',
      ),
    );
  }
}
