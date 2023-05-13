

// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Api_service/API_link.dart';
import '../Utils/Styles.dart';
import 'forgetOtp.dart';

class forgetPass extends StatefulWidget {
  const forgetPass({Key? key}) : super(key: key);

  @override
  State<forgetPass> createState() => _forgetPassState();
}

class _forgetPassState extends State<forgetPass> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  String userId = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
                bottom: 5.0,
              ),
              child: Text('Email',style: labelText),
            ),
            const SizedBox(height: 10),
            Form(
              key: _formKey,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
                  }
                  return null;
                },
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                style: fillText,
                decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.only(
                        left: 25.0, bottom: 12.0, top: 0.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blueGrey,width: 1.0),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blueGrey,width: 1),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.7),
                        borderSide: const BorderSide(width: 1,color: Colors.blueGrey),gapPadding: 0)
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: GestureDetector(
                onTap: (){
                  if(_formKey.currentState!.validate()){
                    getOpt(
                        email: emailController.text,
                        context: context
                    );
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 140,
                  height: 50.0,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset(0.1, 0.1),
                      end: FractionalOffset(0.7, 0.1),
                      colors: [Color(0xFFFE262F),Color(0xFFFD2F71), ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  child: const Text('Submit', style: buttonText),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future getOpt({
    required String email,
    required BuildContext context,}) async {
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.getOtp));
      request.fields.addAll({
        'email':email,
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          commonToast(context: context, title: "Invalid Email", alignCenter:false);
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) => getforgetOtp(userId: responseDecode["data"]["user"]['id'].toString()),));
          userId = responseDecode["data"]["user"]['id'].toString();
          await responseDecode["data"]["user"]['id'].toString();
          print(userId);
         // Navigator.push(context, MaterialPageRoute(builder: (context) => forgetOtp(),));
          print("---------id----------------${responseDecode["data"]["user"]['id'].toString()}");
        }
        print(responseDecode);
      } else {
        commonToast(context: context, title: "Internal Server Error", alignCenter:false);
        print(response.reasonPhrase);
      }}catch(e){
      print(e);
    }
  }
}