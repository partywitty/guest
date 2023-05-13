import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:partywitty_guest/Api_service/API_link.dart';
import 'package:partywitty_guest/Utils/sharepref.dart';
import 'package:get/get.dart';
import 'package:scratcher/widgets.dart';
import '../Screen/dashBoardScreen.dart';
import '../Utils/Styles.dart';
import 'package:http/http.dart' as http;
import 'login_page.dart';


class Login1 extends StatefulWidget {
  const Login1({Key? key}) : super(key: key);

  @override
  State<Login1> createState() => Login1State();
}

class Login1State extends State<Login1> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  bool _obscureText = true;
  bool isLoading=false;
  late String _password;
  String? userId;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

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
  }


  var device_token;
  var terms;

  // getToken() async {
  //   token = await FirebaseMessaging.instance.getToken();
  //   print('The generated Token is ${token}');
  //   return token;
  // }



  final get_user_detail = GetUserDetail();
  final FirebaseAuth auth = FirebaseAuth.instance;
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
      if(result !=null){
        // Get.off(Bottom_navigation());
      }
    }
  }


  bool loading = false;
  void _logInWithFacebook() async {
    setState(() {
      loading = true;
    });
    try{
      final facebookLoginResult = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();

      final facebookAuthCredential = FacebookAuthProvider.credential(
          facebookLoginResult.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } on FirebaseAuthException catch (e) {
      var title = "" ;
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
          backgroundColor: Color(0xFF814255),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height:height*0.2,
                  margin: EdgeInsets.only(top: 100),
                  child:  Image.asset('assest/logo.png',fit: BoxFit.fill),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, top:150,right: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5.0),
                      Material(
                        color:const Color(0xFFF0F0F0).withOpacity(0.8),
                      borderRadius: BorderRadius.circular(30),
                      elevation: 3,
                      child: MaterialButton(onPressed: (){
                        Get.to(Login_page());
                      },
                        minWidth: 400,
                          child:  const Text('Login',style: bigTitle),),
                    ),
                      const SizedBox(height: 20),
                      Material(
                        color:const Color(0xFFF0F0F0).withOpacity(0.8),
                        borderRadius: BorderRadius.circular(30),
                        elevation: 1,
                        child: MaterialButton(onPressed: (){},
                          minWidth: 400,
                          child:  const Text('Sign Up ',style: bigTitle),),
                      ),
                      const SizedBox(height: 80),
                      Material(
                        color: const Color(0xFFF0F0F0).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(30),
                        elevation: 3,
                        child: MaterialButton(onPressed: (){},
                          minWidth: 400,
                          child:  const Text('I am a Guest',style: bigTitle),),
                      ),
                      const SizedBox(height: 15),

                    ],
                  ),
                ),

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
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          userId = responseDecode["data"]["id"].toString();
          await get_user_detail.setUserData("id", userId);
          Navigator.push(context, MaterialPageRoute(builder: (context) => dashBoard(),));
        } else {
          userId = responseDecode["data"]["id"].toString();
          await get_user_detail.setUserData("id", userId);
          Navigator.push(context, MaterialPageRoute(builder: (context) => dashBoard(),));
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
            contentPadding: EdgeInsets.all(0),
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
                                        print(_opacity);
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
                                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => dashBoard(),),(route)=> false);
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
      print(request.fields);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          commonToast(context: context, title: 'Incorrect OTP', alignCenter: true);
        } else {
          print(responseDecode);
          commonToast(context: context, title: responseDecode['message'], alignCenter: false);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => dashBoard(),),(route)=> false);
        }
      } else {
        commonToast(context: context, title: 'Internal Server Error', alignCenter: true);
        print(response.reasonPhrase);
      }}catch(e){
      print(e);
    }
  }
}
