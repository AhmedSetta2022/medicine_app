// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicine_app/Components/Custom_button.dart';
import 'package:medicine_app/Components/Custom_tf.dart';
import 'package:medicine_app/Components/SnakeBar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  String? Email;

  String? Password;

  bool IsLoading = false;
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                        'assests/Images/familydoctor.jpg',
                        height: 300,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Here You can be amember of our family",
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
                      text: "SignUp",
                      onTap: () async {
                        if (formkey.currentState!.validate()) {
                          IsLoading = true;
                          setState(() {});
                          try {
                            await RegistreationMethod();
                            Navigator.pushNamed(context, 'HomePage',
                                arguments: Email);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              SnakeBarMessege(context, "Weak Password");
                            } else if (e.code == 'email-already-in-use') {
                              SnakeBarMessege(context, "Email already in use");
                            }
                          } catch (e) {
                            SnakeBarMessege(context, "There was an error!");
                          }
                          IsLoading = false;
                          setState(() {});
                        } else {}
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an Account ?",
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
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Login",
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

  Future<void> RegistreationMethod() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: Email!, password: Password!);
  }
}
