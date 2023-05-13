
// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partywitty_guest/Auth/introDuction.dart';
import '../Screen/dashBoardScreen.dart';
import '../Utils/Styles.dart';
import '../Utils/sharepref.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  final GetUserDetail _userId = GetUserDetail();
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      _userId.getUserData('id').then((value) {
        if(value=='null'){
          Get.offAll(Introduction());
          // Get.offAll(Login_page());
        }else{
          Get.offAll(const dashBoard());
        }
      });
    }) ;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashColor,
      body: Center(
          child: Image.asset('assest/logo.png',fit: BoxFit.fill)),
    );
  }
}

