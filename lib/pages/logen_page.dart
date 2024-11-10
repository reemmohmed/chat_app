import 'dart:developer';

import 'package:chat_app/helper/show_snake_bar.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/regestration_page.dart';
import 'package:chat_app/widgets/constant.dart';
import 'package:chat_app/widgets/custom_buttom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widgets/cusyom_text_fild.dart';

class LongPage extends StatefulWidget {
  LongPage({super.key});
  static String id = 'lognPage';
  @override
  State<LongPage> createState() => _LongPageState();
}

class _LongPageState extends State<LongPage> {
  String? email;

  String? pasword;
  bool islooding = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: islooding,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 75,
                ),
                Image.asset(
                  'assets/image/scholar.png',
                  height: 100,
                ),
                Center(
                  child: Text(
                    'Sholor Chat',
                    style: TextStyle(
                      fontFamily: "Pacifico",
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Row(
                  children: [
                    Text(
                      'Log in',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomformTextFild(
                  onchang: (data) {
                    email = data;
                  },
                  hintText: 'email',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomformTextFild(
                  Obscuretext: true,
                  onchang: (data) {
                    pasword = data;
                  },
                  hintText: 'paswrd',
                ),
                const SizedBox(
                  height: 30,
                ),
                customButtom(
                  ontap: () async {
                    if (formKey.currentState!.validate()) {
                      islooding = true;
                      setState(() {});

                      try {
                        await loginUser();
                        // showsnakbar(context, 'success');
                        Navigator.pushNamed(context, ChatPage.id,
                            arguments: email);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showsnakbar(context, 'pssword is week');
                        } else if (e.code == 'wrong-password') {
                          showsnakbar(context, 'email is oredy used.');
                        }
                      } catch (e) {
                        print(e);
                        showsnakbar(context, 'There was an error');
                      }

                      {
                        islooding = false;
                        setState(() {});
                      }
                    }
                  },
                  text: 'Log in ',
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "don't have an acount ? ",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          // navigator
                          Navigator.pushNamed(context, RegestrationPage.id);
                        },
                        child: Text(
                          " Regester ",
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: pasword!);
  }
}
