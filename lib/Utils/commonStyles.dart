
import 'package:flutter/material.dart';
import 'Styles.dart';

InputDecoration inputDecoration(BuildContext context, {Widget? prefixIcon, String? hint,suffixIcon}) {
  return InputDecoration(
      filled: true,
      fillColor: const Color(0xFF434445),
      hintStyle: textHint,
    hintText: hint,
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,
    contentPadding: const EdgeInsets.only(
        left: 25.0, bottom: 12.0, top: 0.0),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFF434445)),
      borderRadius: BorderRadius.circular(25.7),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFF434445)),
      borderRadius: BorderRadius.circular(25.7),
    ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.7),
          borderSide: const BorderSide(width: 1,color: Color(0xFF434445),),
          gapPadding: 0)
  );
}

InputDecoration loginDecoration(BuildContext context,{Widget? prefixIcon, String? hint,suffixIcon}){
  return InputDecoration(
    filled: true,
    contentPadding: const EdgeInsets.only(
        left: 25.0, bottom: 12.0, top: 0.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.7),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.blueGrey),
      borderRadius: BorderRadius.circular(25.7),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.blueGrey),
      borderRadius: BorderRadius.circular(25.7),
    ),
  );
}

BoxDecoration boxDecoration(){
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: FractionalOffset(0.1, 0.1),
      end: FractionalOffset(0.7, 0.1),
      colors: [Color(0xFFFE262F),Color(0xFFFD2F71), ],
    ),
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  );
}