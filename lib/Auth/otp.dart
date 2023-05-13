import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../Api_service/otp_api.dart';
import '../Utils/Styles.dart';

class Otp_page extends StatefulWidget {
  String Ids;
  Otp_page({Key? key,required this.Ids}) : super(key: key);
  @override
  State<Otp_page> createState() => _Otp_pageState();
}

class _Otp_pageState extends State<Otp_page> {

  @override
  void initState() {
    otpController = OtpFieldController();
    super.initState();
  }



  OtpFieldController? otpController;
  var otppin;
  double _opacity = 0.0;
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          child: Stack(
            children: [
              SizedBox(
                width: width,
                height: height * 0.7,
                child: Image.asset('assest/login.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 30),
                  child: Container(
                    width: 40,
                    height: 40,
                    child: IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Container(
                      width: width,
                      // height: height,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(50), topLeft: Radius.circular(50)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50.0,),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 34.0),
                              child: Text("Enter Verification Code",
                                  style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 22, color: Colors.white)),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.only(left: 34),
                              child: Text(
                                  "We've send you an email with a confirmation code. Please enter the 4-digit code below.",
                                  textScaleFactor: 1,
                                  style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.white)),
                            ),
                            const SizedBox(height: 20),
                            Center(
                              child: SizedBox(
                                height: 50,
                                width: 250,
                                child:OTPTextField(
                                    controller: otpController,
                                    length: 4,
                                    width: MediaQuery.of(context).size.width,
                                    textFieldAlignment: MainAxisAlignment.spaceAround,
                                    fieldWidth: 50,
                                    otpFieldStyle: OtpFieldStyle(
                                      disabledBorderColor: Colors.red,
                                      enabledBorderColor:Color(0xFF434445),
                                      backgroundColor: Color(0xFF434445),
                                    ),
                                    fieldStyle: FieldStyle.box,
                                    outlineBorderRadius: 30,
                                    style:GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 22, color: Colors.white),
                                    onChanged: (pin) {
                                      print("Changed: " + pin);
                                    },
                                    onCompleted: (pin) {
                                      setState((){
                                        otppin=pin;
                                      });
                                      print("Completed: " + pin);
                                    }),
                              ),
                            ),
                            const SizedBox(height: 50),
                            Center(
                              child: Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      // otpController!.setFocus(otppin);
                                      otpApi().otp(otp: otppin.toString(),context: context);
                                      // Navigator.pushNamed(context,'/reward_page').then((value){
                                      //   Get.off(Reward_page());
                                      // });
                                      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Bottom_navigation(),),(route)=> false);
                                      // scratchDialog(context);
                                    },
                                    child: Container(
                                      width: 140,
                                      height: 50.0,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: FractionalOffset(0.1, 0.1),
                                          end: FractionalOffset(0.7, 0.1),
                                          colors: [
                                            Color(0xFFFE262F),
                                            Color(0xFFFD2F71),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Submit',
                                          style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }


// Future<void> scratchDialog(BuildContext context) {
//   return showDialog(context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           contentPadding: EdgeInsets.all(0),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           content: StatefulBuilder(builder: (context, StateSetter setState) {
//             return Container(
//               width: 150,
//               height: 300,
//               child: ListView(
//                 shrinkWrap: true,
//                 padding: EdgeInsets.all(0),
//                 children: [
//                   InkWell(
//                       onTap: (){
//                         Navigator.pop(context);
//                       },
//                       child: Image.asset("assest/popup.png")),
//                   // Stack(
//                   //   children: [
//                   //     ClipRRect(
//                   //       borderRadius: BorderRadius.circular(20.0),
//                   //       child: Scratcher(
//                   //         color: Colors.red,
//                   //         accuracy: ScratchAccuracy.low,
//                   //         threshold: 30,
//                   //         brushSize: 40,
//                   //         onThreshold: () {
//                   //           setState(() {
//                   //             _opacity = 1;
//                   //             //  getBottom();
//                   //             print(_opacity);
//                   //             //  Navigator.pop(context);
//                   //           });
//                   //         },
//                   //         child: AnimatedOpacity(
//                   //           duration: Duration(milliseconds: 100),
//                   //           opacity: _opacity,
//                   //           child: SizedBox(
//                   //             height: MediaQuery.of(context).size.height * 0.3,
//                   //             // width: MediaQuery.of(context).size.width * 0.6,
//                   //             child:  Image.asset("assest/popup.png",),
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     ),
//                   //     Positioned(
//                   //       top : 5,
//                   //         right: 5,
//                   //         child: InkWell(
//                   //           onTap: (){
//                   //             Navigator.pop(context);
//                   //           },
//                   //             child: Icon(Icons.cancel_outlined,color: Colors.white,size: 30,)),
//                   //     )
//                   //   ],
//                   // ),
//                   // const SizedBox(height: 10.0,),
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   //   children: [
//                   //     InkWell(
//                   //       onTap: (){
//                   //         //_controllerCenter.play();
//                   //       },
//                   //       child: Container(
//                   //         alignment: Alignment.center,
//                   //         height: 50,
//                   //         width: 100,
//                   //         decoration: BoxDecoration(
//                   //             color: Colors.green,
//                   //             borderRadius: BorderRadius.circular(20.0)
//                   //         ),
//                   //         child: Text("Claim",style: appBarText,),
//                   //       ),
//                   //     ),
//                   //     Container(
//                   //       alignment: Alignment.center,
//                   //       height: 50,
//                   //       width: 100,
//                   //       decoration: BoxDecoration(
//                   //           color: Colors.green,
//                   //           borderRadius: BorderRadius.circular(20.0)
//                   //       ),
//                   //       child: Text("Cancel",style: appBarText,),
//                   //     ),
//                   //   ],
//                   // ),
//                   // const SizedBox(height: 10.0,),
//                 ],
//               ),
//             );
//           }),
//         );
//       }
//   );
// }
}