import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/widgets/chat_bubu.dart';
import 'package:chat_app/widgets/constant.dart';
import 'package:flutter/material.dart';

class NavigatorNames extends StatelessWidget {
  NavigatorNames({super.key});
  String id = 'chatpage';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, id);
            },
            icon: Icon(Icons.add)),
      ),
    );
  }
}
