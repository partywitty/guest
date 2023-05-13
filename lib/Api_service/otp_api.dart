// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:partywitty_guest/Api_service/API_link.dart';
import 'package:partywitty_guest/Utils/sharepref.dart';
import 'package:scratcher/widgets.dart';
import '../Auth/setPassword.dart';
import '../Screen/dashBoardScreen.dart';
import '../Utils/Styles.dart';

class otpApi{
  double _opacity = 1.0;
  String? rewardIds;

  Future<void> otp({otp,id,required BuildContext context}) async {
    final guestId=GetUserDetail();
    var userId = await guestId.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.otpApi));
      request.fields.addAll({
        'guast_id': userId,
        'otp': otp.toString(),
      });
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          commonToast(context: context, title: 'Incorrect OTP', alignCenter: false);
        //  scratchDialog(context);
        } else {
          rewardIds = responseDecode["data"]["reward_id"].toString();
          // CommonToast(context: context, title: 'Sign up successfully', alignCenter: true);
          // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => dashBoard(),),(route)=> false);
          scratchDialog(context);
        }
      } else {
        commonToast(context: context, title: 'Internal Server Error', alignCenter: false);
      }}catch(e){
      print(e);
    }
  }

  Future<void> forGetOtp({otp,id,required BuildContext context}) async {
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.forgetVerify));
      request.fields.addAll({
        'guast_id': id,
        'otp': otp,
      });
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          commonToast(context: context, title: 'Incorrect OTP', alignCenter: true);
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) => setPassword(userId: responseDecode["data"]["id"].toString()),));
        }
      } else {
        commonToast(context: context, title: 'Internal Server Error', alignCenter: true);
      }}catch(e){
      print(e);
    }
  }

  Future<void> scratchDialog(BuildContext context) {
    return showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: const EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: StatefulBuilder(builder: (context, StateSetter setState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset("assest/star.png",fit: BoxFit.fill),
                      Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Stack(
                            children: [
                              Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Scratcher(
                                      color: Colors.blue,
                                      accuracy: ScratchAccuracy.low,
                                      threshold: 30,
                                      brushSize: 40,
                                      onThreshold: () {
                                        setState(() {
                                          _opacity = 1;
                                          getBeer(context: context,rewardId: rewardIds.toString());
                                          // controller.play();
                                           // Navigator.pop(context);
                                        });
                                      },
                                      child: AnimatedOpacity(
                                        duration: const Duration(milliseconds: 100),
                                        opacity: _opacity,
                                        child: SizedBox(
                                        //  color: Colors.black,
                                          height: 220,
                                          width: 200,
                                          // width: MediaQuery.of(context).size.width * 0.6,
                                          child:  Image.asset("assest/beer.png",height: 220,width: 200,fit: BoxFit.fill),
                                        ),
                                      ),
                                    ),
                                  ),
                              ),
                              Positioned(
                                  bottom: 0,
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  child: Center(child: Image.asset("assest/mainlogo.png",fit: BoxFit.fill,height: 40))
                              ),
                              Positioned(
                                  top: 5,
                                  right: 60,
                                  child: InkWell(
                                      onTap: (){
                                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const dashBoard(),),(route)=> false);
                                      },
                                      child: const Icon(Icons.cancel,color: Colors.white)))
                            ],
                          ))
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Image.asset("assest/bomb.png",fit: BoxFit.fill,height: 100),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("condition :",style: drawerSubTitle,),
                        Text("Congratulations, PartyWitty will celebrate your on boarding with various freebies and offers whenever you visit a venue selected from PartyWitty.",style: drawerSubTitle,),
                      ],
                    ),
                  ),
                ],
              );
            }),
          );
        }
    );
  }

  Future<void> getBeer({rewardId,required BuildContext context}) async {
    final getuser_id=GetUserDetail();
    var userId = await getuser_id.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.feeBeer));
      request.fields.addAll({
        'guast_id': userId,
        'reward_id': rewardId,
      });
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          commonToast(context: context, title: 'Incorrect OTP', alignCenter: true);
        } else {
          commonToast(context: context, title: responseDecode['message'], alignCenter: false);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const dashBoard(),),(route)=> false);
        }
      } else {
        commonToast(context: context, title: 'Internal Server Error', alignCenter: true);
      }}catch(e){
      print(e);
    }
  }

  // Future<void> scratch11Dialog(BuildContext context) {
  //   return showDialog(context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           contentPadding: EdgeInsets.all(0),
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(20),
  //           ),
  //           content: StatefulBuilder(builder: (context, StateSetter setState) {
  //             return Container(
  //               //height: 250,
  //               //width: 200,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(20.0),
  //               ),
  //               child: Stack(
  //                 children: [
  //                   ClipRRect(
  //                     borderRadius: BorderRadius.circular(20.0),
  //                     child: Scratcher(
  //                       color: Colors.blue,
  //                       accuracy: ScratchAccuracy.low,
  //                       threshold: 30,
  //                       brushSize: 40,
  //                       onThreshold: () {
  //                         setState(() {
  //                           _opacity = 1;
  //                           offerImage = false;
  //                           load();
  //                           // controller.play();
  //                           //  Navigator.pop(context);
  //                         });
  //                       },
  //                       child: AnimatedOpacity(
  //                         duration: Duration(milliseconds: 100),
  //                         opacity: _opacity,
  //                         child: Container(
  //                           color: Colors.black,
  //                           height: MediaQuery.of(context).size.height * 0.3,
  //                           // width: MediaQuery.of(context).size.width * 0.6,
  //                           child:  Image.asset("assest/logo.png",),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   Positioned(
  //                       top: 5,
  //                       right: 5,
  //                       child: InkWell(
  //                           onTap: (){
  //                             Navigator.pop(context);
  //                           },
  //                           child: const Icon(
  //                             Icons.cancel_outlined,size: 26,color: Colors.white,)))
  //                 ],
  //               ),
  //             );
  //           }),
  //         );
  //       }
  //   );
  // }
}