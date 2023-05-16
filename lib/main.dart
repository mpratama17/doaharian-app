import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tes/custom_widgets/navigation_bar.dart';
import 'package:tes/theme/theme_constant.dart';
import 'package:tes/view/home.dart';
import 'package:tes/view/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/src/widgets/framework.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? user;

  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    // print("id user $user?.uid.toString()");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: light,
      title: 'Doa Harian',
      home: user != null ? NavBar() : LoginScreen(),
    );
  }
}
