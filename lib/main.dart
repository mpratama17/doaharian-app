import 'package:flutter/material.dart';
import 'package:tes/custom_widgets/navigation_bar.dart';
import 'package:tes/view/detail_baru.dart';
import 'package:tes/view/login.dart';
import 'package:tes/view/signup.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'view/home.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doa Harian',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: LoginScreen(),
    );
  }
}
