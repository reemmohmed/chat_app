import 'package:flutter/material.dart';

class customButtom extends StatelessWidget {
  customButtom({
    this.ontap,
    required this.text,
    super.key,
  });
  VoidCallback? ontap;
  String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 35,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Center(child: Text(text)),
      ),
    );
  }
}
