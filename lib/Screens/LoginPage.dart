// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicine_app/Components/Custom_button.dart';
import 'package:medicine_app/Components/Custom_tf.dart';
import 'package:medicine_app/Components/SnakeBar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey();

  String? Email;

  String? Password;

  bool IsLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: IsLoading,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Image.asset(
                        'assests/Images/medical.jpg',
                        height: 300,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "WelcomeBack , You have been Missed !",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomeTextFormField(
                      onchanged: (data) {
                        Email = data;
                      },
                      obscuretext: false,
                      keyboardtype: TextInputType.emailAddress,
                      HintText: "Email",
                      LabelText: "Enter Your Email :",
                      SuffixIcon: Icon(Icons.person),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomeTextFormField(
                      onchanged: (data) {
                        Password = data;
                      },
                      obscuretext: true,
                      keyboardtype: TextInputType.text,
                      HintText: "Password",
                      LabelText: "Enter Your Password :",
                      SuffixIcon: Icon(Icons.lock),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    CustomButton(
                      text: "Login",
                      onTap: () async {
                        if (formkey.currentState!.validate()) {
                          IsLoading = true;
                          setState(() {});
                          try {
                            await SignupMethod();
                            Navigator.pushNamed(context, 'HomePage',
                                arguments: Email);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              SnakeBarMessege(
                                  context, "Use not Found , Please SignUp");
                            } else if (e.code == 'wrong-password') {
                              SnakeBarMessege(context,
                                  "Incorrect Password ,Please Enter availd Password");
                            }
                          } catch (e) {
                            SnakeBarMessege(context, "There was an error!");
                          }
                          IsLoading = false;
                          setState(() {});
                        } else {
                          print("Error");
                        }
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don\'t have an Account ?",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600]),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'RegisterPage');
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[500]),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> SignupMethod() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: Email!, password: Password!);
  }
}
