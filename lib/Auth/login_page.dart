// ignore_for_file: use_build_context_synchronously, camel_case_types

import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otpless_flutter/otpless_flutter.dart';
import 'package:partywitty_guest/Api_service/API_link.dart';
import 'package:partywitty_guest/Api_service/login_api.dart';
import 'package:partywitty_guest/Utils/sharepref.dart';
import 'package:get/get.dart';
import 'package:scratcher/widgets.dart';
import '../Screen/dashBoardScreen.dart';
import '../Utils/Styles.dart';
import '../Utils/commonStyles.dart';
import 'package:http/http.dart' as http;
import 'forgetPassword.dart';

class Login_page extends StatefulWidget {
  const Login_page({Key? key}) : super(key: key);

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  bool isLoading=false;
  String? userId;


  bool googleLoading = false;

  late bool _passwordVisible;
  bool value = true;
  @override
  void initState() {
    _passwordVisible = false;
    var messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value){
      print('The token is------------ $value');
      setState(() {
        device_token = value.toString();
      });
    });
    super.initState();
    initPlatformState();
  }

  var device_token;

  // getToken() async {
  //   token = await FirebaseMessaging.instance.getToken();
  //   print('The generated Token is ${token}');
  //   return token;
  // }

  final getUserDetail = GetUserDetail();
  final FirebaseAuth auth = FirebaseAuth.instance;

  final _otplessFlutterPlugin = Otpless();

  String? googleName,googleEmail;

  Future<void>googleSignup(BuildContext context)async{
  final GoogleSignIn googleSignIn=GoogleSignIn();
  final GoogleSignInAccount? googleSignInAccount= await googleSignIn.signIn();
  if(googleSignInAccount !=null){
  final GoogleSignInAuthentication googleSignInAuthentication= await googleSignInAccount.authentication;
  final AuthCredential authCredential =GoogleAuthProvider.credential(
    idToken: googleSignInAuthentication.idToken,
    accessToken: googleSignInAuthentication.accessToken
  );
 UserCredential result =await auth.signInWithCredential(authCredential);
 User user =result.user!;
 googleEmail = user.email.toString();
    googleName = user.displayName.toString();
  setState(() {
    googleLoading = false;
  });
  googleLogin(
      email: user.email.toString(),
      userName: user.displayName.toString(),
      loginType: "google",
      context: context);
  }
}

  void initiateWhatsappLogin(String intentUrl) async {
    var result = await _otplessFlutterPlugin.loginUsingWhatsapp(intentUrl: intentUrl);
    switch (result['code']) {
      case "581":
        print(result['message']);
        //TODO: handle whatsapp not found
        break;
      default:
    }
  }
  Future<void> initPlatformState() async {
    _otplessFlutterPlugin.authStream.listen((token) {
      print("token = $token");
    });
  }

  bool loading = false;
  void _logInWithFacebook() async {
    setState(() {
      loading = true;
    });
    try{
      final facebookLoginResult = await FacebookAuth.instance.login();
      final facebookAuthCredential = FacebookAuthProvider.credential(
          facebookLoginResult.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } on FirebaseAuthException catch (e) {
      switch (e.code){
      }
    }finally {
      setState(() {
        loading = false;
      });
    }
  }
  String? rewardIds;
  double _opacity = 0.0;
  @override
  Widget build(BuildContext context) {
    var width= MediaQuery.of(context).size.width;
    var height= MediaQuery.of(context).size.height;
    return Form(
      key: _formkey,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height:height*0.5,
                   width: width,
                  color: Colors.amber,
                  child: Stack(
                    children: [
                      Image.asset('assest/login.png',fit: BoxFit.fill,height: height*0.5),
                      Positioned(
                        top: 10,
                          left: 8,
                          child: Image.asset('assest/logo.png',fit: BoxFit.fill,height: 40),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 270),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: cardBackGround,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50)),
                    ),
                    child: Column(children: [
                      const SizedBox(height: 18,),
                      Text('Account Login',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 24, color: Colors.white)
                      ),
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 20.0, bottom: 1.0),
                              child: Text('Email', style: labelText),
                            ),
                            const SizedBox(height: 5.0),
                            TextFormField(
                              controller: email,
                              validator: (val){
                                if(val!.isEmpty){
                                  return 'Please enter email';
                                }else {
                                  null;
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              autofocus: false,
                              style: fillText,
                              decoration: loginDecoration(context),
                            ),
                            const SizedBox(height: 15),
                            const Padding(
                              padding:  EdgeInsets.only(left: 20, bottom: 1.0,),
                              child: Text('Password',style: labelText),
                            ),
                            const SizedBox(height: 5.0),
                            TextFormField(
                              controller: password,
                              validator: (val){
                                if(val!.isEmpty){
                                  return 'Please enter email';
                                }else {
                                  null;
                                }
                                return null;
                              },
                              autofocus: false,
                              keyboardType: TextInputType.text,
                              obscureText: !_passwordVisible,
                              style: fillText,
                              decoration: InputDecoration(
                                filled: true,
                                // fillColor: Colors.white,
                                hintText: 'Password',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    _passwordVisible
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off,
                                    color: Colors.white54, size: 18,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                contentPadding: const EdgeInsets.only(
                                    left: 25.0, bottom: 6.0, top: 0.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.blueGrey),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.blueGrey),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 8, right: 20, top: 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        activeColor: const Color(0xFFFE262F),
                                        checkColor: Colors.white,
                                        side: const BorderSide(
                                          color: Colors.white,
                                        ),
                                        value: value,
                                        onChanged: (value) {
                                          setState(() {
                                            value = value!;
                                            print(value);
                                          });
                                        },
                                      ),
                                      const Text('Remember me', style: textHint)
                                    ],
                                  ),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const forgetPass(),));
                                    },
                                      child: const Text('Forget password', style: textHint))
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            /// login button
                            Center(
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    isLoading = true;
                                  });
                                    if (_formkey.currentState!.validate()) {
                                      LoginApi().login(context: context,
                                        email: email.text.toString(),
                                      password: password.text.toString(),).then((value) {
                                    if (value['error'] == false) {
                                     Get.offAll(const dashBoard());
                                      isLoading = false;
                                    }});}
                                  },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 140,
                                  height: 50.0,
                                  decoration: boxDecoration(),
                                  child: const Text('Login',style: buttonText),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 22, top: 10, right: 5),
                              child: Center(
                                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 1,
                                      width: 77,
                                      color: Colors.white,
                                    ),
                                    Text('  or Signup with  ',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize:10, color: Colors.white)),
                                    Container(
                                      height: 1,
                                      width: 77,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            /// google and facebook login
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  googleLoading ?
                                  const Center(child: CircularProgressIndicator()) :
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        googleLoading = true;
                                      });
                                      googleSignup(context);
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(30)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Image.asset(
                                          "assest/google.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 25),
                                  InkWell(
                                    onTap: () {
                                       _logInWithFacebook();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(50)),
                                      height: 40,
                                      width: 40,
                                      child: Padding(
                                        padding: const EdgeInsets.all(6),
                                        child: Container(
                                          height: 20,
                                          width: 20,
                                          child: Image.asset(
                                            "assest/fb1.png",
                                            fit: BoxFit.contain,
                                            scale: 3.9,
                                            height: 9,

                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 25),
                                  InkWell(
                                    onTap: (){
                                      initiateWhatsappLogin("https://vedanshtechnovision.authlink.me?redirectUri=vedanshtechnovisionotpless://otpless");
                                    },
                                    child: Image.asset(
                                      "assest/whatsapp.png",
                                      fit: BoxFit.fill,
                                      height: 42,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 35.0,),
                              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't have an account?",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize:12, color: Colors.white)),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/signUp');
                                      },
                                      child: Text(
                                        'Sign up',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize:12, color: const Color(0xFFFE262F),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                )
              ],
            ),
            // ),
          ),
        ),
      ),
    );
  }

  Future googleLogin({
    required String email,
    required String userName,
    required String loginType,
    required BuildContext context,}) async {
    final getuser_id=GetUserDetail();
    var lat = await getuser_id.getUserData('lat');
    var log = await getuser_id.getUserData('long');
    try{
      var request = http.MultipartRequest('POST', Uri.parse("https://www.partywitty.com/api/AuthGuest"));
      request.fields.addAll({
        'name': userName,
        'email':email,
        'auth_type' : loginType,
        'lat' : lat,
        'long' : log
      });
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
         userId = responseDecode["data"]["id"].toString();
         await getUserDetail.setUserData("id", userId);
         Navigator.push(context, MaterialPageRoute(builder: (context) => const dashBoard(),));
        } else {
         userId = responseDecode["data"]["id"].toString();
         await getUserDetail.setUserData("id", userId);
         Navigator.push(context, MaterialPageRoute(builder: (context) => const dashBoard(),));
         scratchDialog(context);
        }
        print(responseDecode);
      } else {
        commonToast(context: context, title: "Internal  server error", alignCenter:false);
        print(response.reasonPhrase);
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
    final guestId=GetUserDetail();
    var userId = await guestId.getUserData('id');
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
          print(responseDecode);
          commonToast(context: context, title: responseDecode['message'], alignCenter: false);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const dashBoard(),),(route)=> false);
        }
      } else {
        commonToast(context: context, title: 'Internal Server Error', alignCenter: true);
        print(response.reasonPhrase);
      }}catch(e){
      print(e);
    }
  }
}
