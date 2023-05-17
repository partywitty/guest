
// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/Styles.dart';

class readyClaimScreen extends StatefulWidget {
  const readyClaimScreen({Key? key}) : super(key: key);

  @override
  State<readyClaimScreen> createState() => _readyClaimScreenState();
}

class _readyClaimScreenState extends State<readyClaimScreen> {
  final double _height = Get.height, _width = Get.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cardBackGround,
       appBar: AppBar(
         backgroundColor: timeColor,
       ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: _width*0.60,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: bottomBarColor,
                 borderRadius: BorderRadius.circular(4.0),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  const Icon(Icons.info_outline,color: Colors.white,size: 30),
                  const SizedBox(height: 10.0),
                  Text("Are you ready beer from claim",style: GoogleFonts.poppins(textStyle: bigTitle),textAlign: TextAlign.center),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5.0),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: appColor,
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: Text('Yes', style: GoogleFonts.poppins(textStyle: buttonText)),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5.0),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: Text('No', style: GoogleFonts.poppins(textStyle: buttonText)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
