import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tes/custom_widgets/navigation_bar.dart';
import 'package:tes/view/home.dart';
import 'package:tes/view/login.dart';

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Doa\nHarian",
                      style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                ),
                SizedBox(
                  height: 25,
                ),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NavBar()));
                  }).onError((error, stackTrace) {
                    print("error");
                  });
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already Have account? "),
                    InkWell(
                      child: Text(
                        "Sign In",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        //navigate to signup
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
