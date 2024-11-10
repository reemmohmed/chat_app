import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/logen_page.dart';
import 'package:chat_app/pages/regestration_page.dart';
import 'package:chat_app/pages/routstestmy/navigator_names.dart';
import 'package:chat_app/pages/routstestmy/page2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LongPage.id: (context) => LongPage(),
        RegestrationPage.id: (context) => RegestrationPage(),
        ChatPage.id: (context) => ChatPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: LongPage.id,
    );
  }
}
