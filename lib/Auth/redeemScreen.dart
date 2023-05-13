

import 'dart:ui';

import 'package:flutter/material.dart';

class redeemScreen extends StatefulWidget {
  const redeemScreen({Key? key}) : super(key: key);

  @override
  State<redeemScreen> createState() => _redeemScreenState();
}

class _redeemScreenState extends State<redeemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  const BoxDecoration(
          image:  DecorationImage(
            image:  ExactAssetImage('assest/popupback.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child:  Container(
            decoration:  BoxDecoration(color: Colors.white.withOpacity(0.0)),
          ),
        ),
      ),
    );
  }
}
