import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tes/view/home.dart';

import '../custom_widgets/customwidgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        // backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              reusableTextfield("email", Icons.abc, false, _emailController),
              SizedBox(height: 16),
              reusableTextfield(
                  "password", Icons.lock, true, _passwordController),
              SizedBox(height: 16),
              SignInSignUpButton(context, false, () {
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text)
                    .then((value) {
                  SnackBar(content: Text("Sign Up Success"));
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                }).onError((error, stackTrace) {
                  print("error");
                });
              })
            ],
          ),
        ),
      ),
    );
  }
}
