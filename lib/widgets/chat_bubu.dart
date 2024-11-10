import 'package:chat_app/model/massages.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

class chatBubu extends StatelessWidget {
  const chatBubu({
    super.key,
    required this.message,
  });
  final Massagess message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.only(top: 16, right: 16, bottom: 16, left: 16),
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),
              topLeft: Radius.circular(32),
            )),
        child: Text(message.message),
      ),
    );
  }
}

class chatBubuforfind extends StatelessWidget {
  const chatBubuforfind({
    super.key,
    required this.message,
  });
  final Massagess message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.only(top: 16, right: 16, bottom: 16, left: 16),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32),
              topLeft: Radius.circular(32),
            )),
        child: Text(message.message),
      ),
    );
  }
}
