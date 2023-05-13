import 'package:flutter/material.dart';

class Thankyou_1 extends StatefulWidget {
  const Thankyou_1({Key? key}) : super(key: key);
  @override
  State<Thankyou_1> createState() => Thankyou_1State();
}

class Thankyou_1State extends State<Thankyou_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset('assest/View cart.png',fit: BoxFit.fill,),
      ),
    );
  }
}
