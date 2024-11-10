import 'dart:developer';
import 'dart:math';

import 'package:chat_app/helper/show_snake_bar.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/widgets/constant.dart';
import 'package:chat_app/widgets/cusyom_text_fild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widgets/custom_buttom.dart';

class RegestrationPage extends StatefulWidget {
  RegestrationPage({super.key});
  static String id = 'regesterPage';
  @override
  State<RegestrationPage> createState() => _RegestrationPageState();
}

class _RegestrationPageState extends State<RegestrationPage> {
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
                      'Regest',
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
                  hintText: 'Email',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomformTextFild(
                  Obscuretext: true,
                  onchang: (data) {
                    pasword = data;
                  },
                  hintText: 'pasword',
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
                        await regesterUser();
                        // showsnakbar(context, 'success');
                        Navigator.pushNamed(context, ChatPage.id,
                            arguments: email);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showsnakbar(context, ' password is week');
                        } else if (e.code == 'email-already-in-use') {
                          showsnakbar(context, 'email is oredy used');
                        }
                      } catch (e) {
                        showsnakbar(context, 'there was an error');
                      }
                      islooding = false;
                      setState(() {});
                    } else {}
                  },
                  text: 'Regester',
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "oredy  have an acount ?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          " Logen in",
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
    ;
  }

  Future<void> regesterUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: pasword!);
  }
}
