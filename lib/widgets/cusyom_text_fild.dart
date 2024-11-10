import 'package:flutter/material.dart';

class CustomformTextFild extends StatelessWidget {
  CustomformTextFild(
      {super.key, this.hintText, this.onchang, this.Obscuretext = false});
  String? hintText;
  bool? Obscuretext;
  Function(String)? onchang;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: Obscuretext!,
      validator: (data) {
        if (data!.isEmpty) return 'there was an error';
      },
      onChanged: onchang,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
