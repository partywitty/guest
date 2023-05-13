import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:partywitty_guest/Api_service/API_link.dart';
import 'package:partywitty_guest/Api_service/signup_api.dart';
import 'package:scratcher/widgets.dart';
import '../Screen/dashBoardScreen.dart';
import '../Utils/Styles.dart';
import '../Utils/commonStyles.dart';
import 'package:http/http.dart' as http;

import '../Utils/sharepref.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final getUserDetails = GetUserDetail();
  final FirebaseAuth auth = FirebaseAuth.instance;
  String? googleName,googleEmail;
  bool googleLoading = false;
  String? userId;

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

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }
  var gender;
  bool isLoading=false;
  late bool _passwordVisible;
  String dropdownvalue = '+91';
  var items = ['+91', '+92', '+93', '+94', '+95'];
  final _formkey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _number=TextEditingController();
  TextEditingController _email=TextEditingController();
  TextEditingController _password=TextEditingController();
  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }
  double _opacity = 1.0;

  String? rewardIds;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Form(
      key: _formkey,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
              child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: width,
                          height: height * 0.7,
                          child: Image.asset(
                            'assest/login.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          child: IconButton(
                            color: Colors.white,
                            icon: const Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 150.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: const BoxDecoration(
                                color: cardBackGround,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(50),
                                    topLeft: Radius.circular(50)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 20.0,),
                                  Text('  Full Name',style: GoogleFonts.poppins(textStyle : labelText)),
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter name';
                                      }
                                      return null;
                                    },
                                    autofocus: true,
                                    controller: _name,
                                    style: fillText,
                                    decoration: inputDecoration(context),
                                  ),
                                  const SizedBox(height: 15,),
                                  Text('  Phone Number',style: GoogleFonts.poppins(textStyle : labelText)),
                                  Container(height: 50,
                                    // width: 300,
                                    decoration: (BoxDecoration(
                                        color: const Color(0xFF434445),
                                        borderRadius: BorderRadius.circular(30))),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(left: 25.0),
                                          child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child: Image.asset('assest/ind_img.png',
                                                  ),
                                                ),
                                                const SizedBox(width: 10,),
                                                SizedBox(
                                                  height: 33,
                                                  child:DropdownButtonHideUnderline(
                                                      child:  DropdownButton(
                                                        iconSize: 1,
                                                        style: const TextStyle(color: Colors.white),
                                                        borderRadius: BorderRadius.circular(10),
                                                        value: dropdownvalue,
                                                        dropdownColor: Colors.blueGrey,focusColor: Colors.blue,
                                                        items: items.map((String items) {
                                                          return DropdownMenuItem(
                                                            enabled: true,
                                                            value: items,
                                                            child: Text(items),
                                                          );
                                                        }).toList(),
                                                        onChanged: (String? newValue) {
                                                          setState(() {
                                                            dropdownvalue = newValue!;
                                                            print(dropdownvalue);
                                                          });
                                                        },
                                                      )),),
                                                const SizedBox(width: 8,),
                                                Container(
                                                  height: 25,
                                                  width: 1.5,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  height: 49,
                                                  width: width*0.5,
                                                  child: TextFormField(
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter.digitsOnly,
                                                      LengthLimitingTextInputFormatter(10)],
                                                    controller: _number,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'Enter your number';
                                                      } else if (value.length < 10 || value.length > 10) {
                                                        return "enter 10 digit number";
                                                      } else
                                                        null;
                                                    },
                                                    decoration: const InputDecoration(
                                                      contentPadding: EdgeInsets.only(left: 10.0)
                                                    ),
                                                    autofocus: false,
                                                    keyboardType: TextInputType.number,
                                                    style: const TextStyle(
                                                        fontSize: 15.0,
                                                        color: Color(0xFFbdc6cf)),
                                                  ),
                                                )
                                              ]),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10.0,),
                                  Text('  Gender', style: GoogleFonts.poppins(textStyle : labelText)),
                                  const SizedBox(height: 5.0,),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            gender='female' ;
                                          });
                                        },
                                        child: Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                              color: const Color(0xFF434445),
                                              border: Border.all(
                                                  color: gender=='female'
                                                      ? Colors.red
                                                      : Colors.transparent),
                                              borderRadius: BorderRadius.circular(10)),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5.0, bottom: 3),
                                                child: Container(
                                                  height: 45,
                                                  width: 35,
                                                  child: Image.asset(
                                                    'assest/female_img.png',
                                                    fit: BoxFit.contain,
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: const Color(0xFF434445),
                                                      borderRadius:
                                                      BorderRadius.circular(10)),
                                                ),
                                              ),
                                              Text(
                                                'Female',
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 8,
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10,),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            gender='male';
                                          });
                                        },
                                        child: Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                              color: const Color(0xFF434445),
                                              border: Border.all(
                                                  color:   gender=='male'
                                                      ? Colors.red
                                                      : Colors.transparent),
                                              borderRadius: BorderRadius.circular(10)),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5.0, bottom: 3),
                                                child: Container(
                                                  height: 46,
                                                  width: 45,
                                                  child: Image.asset(
                                                    'assest/boy_img.png',
                                                    fit: BoxFit.contain,
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: const Color(0xFF434445),
                                                      borderRadius:
                                                      BorderRadius.circular(10)),
                                                ),
                                              ),
                                              Text(
                                                'Male',
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 8,
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5.0,),
                                  Text('  Email', style: GoogleFonts.poppins(textStyle : labelText)),
                                  TextFormField(
                                    controller: _email,
                                    validator: (mailvalid) {
                                      String pattern =
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                                      RegExp regExp = RegExp(pattern);
                                      if (mailvalid!.isEmpty) {
                                        return "Please enter your valid email address";
                                      } else if (!(regExp.hasMatch(mailvalid))) {
                                        return "Email must be end from @gmail.com";
                                      } else {
                                        return null;
                                      }
                                    },
                                    autofocus: true,
                                    style: fillText,
                                    decoration: inputDecoration(context),
                                  ),
                                  const SizedBox(height: 10,),
                                  Text('  Password', style: GoogleFonts.poppins(textStyle : labelText)),
                                  TextFormField(
                                    controller: _password,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter password';
                                      }
                                      return null;
                                    },
                                    autofocus: false,
                                    keyboardType: TextInputType.text,
                                    // controller: _userPasswordController,
                                    obscureText: !_passwordVisible,
                                    style: fillText,
                                    decoration: InputDecoration(
                                      fillColor: const Color(0xFF434445),
                                      filled: true,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _passwordVisible ? Icons.visibility_outlined : Icons.visibility_off,
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
                                      contentPadding: const EdgeInsets.only(left: 25.0, bottom: 6.0, top: 0.0),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(color: Color(0xFF434445),),
                                        borderRadius: BorderRadius.circular(25.7),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(color: Color(0xFF434445),),
                                        borderRadius: BorderRadius.circular(25.7),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
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
                                  const SizedBox(height: 10,),
                                  googleLoading ?
                                  const Center(child: CircularProgressIndicator()) :
                                  Center(
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                       focusColor: Colors.transparent,
                                       onTap: (){
                                         setState(() {
                                           googleLoading = true;
                                         });
                                         googleSignup(context);
                                       },
                                      child: Image.asset("assest/google.png", fit: BoxFit.fill,height: 40,width: 40),
                                    ),
                                  ),
                                  const SizedBox(height: 15,),
                                  Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        if(gender == null){
                                          commonToast(context: context, title: "Please select gender", alignCenter: false);
                                        }
                                        if(_formkey.currentState!.validate()) {
                                          SignupApi().Signup_Api(context: context,contactNo:  _number.text,
                                              email: _email.text,
                                              gender: gender,
                                              password: _password.text.toString(),
                                              userName: _name.text );
                                        }
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 140,
                                        height: 50.0,
                                        decoration: boxDecoration(),
                                        child: const Text('Submit',style: buttonText,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 40,),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ]
              )
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
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.googleUrl));
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
          await getUserDetails.setUserData("id", userId);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const dashBoard(),),(route)=> false);
        } else {
          userId = responseDecode["data"]["id"].toString();
          await getUserDetails.setUserData("id", userId);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const dashBoard(),),(route)=> false);
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
    final guestId = GetUserDetail();
    var userId = await guestId.getUserData('id');
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