
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:partywitty_guest/Utils/Styles.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../Api_service/API_link.dart';
import '../Api_service/login_api.dart';

class gettingReady extends StatefulWidget {
  const gettingReady({Key? key}) : super(key: key);

  @override
  State<gettingReady> createState() => _gettingReadyState();
}

class _gettingReadyState extends State<gettingReady> {

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assest/aleksandra-popov.png"),fit: BoxFit.fill,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GradientText(
                'Getting Ready',
                style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold),
                colors: [
                  Colors.greenAccent,
                  Colors.blueAccent,
                  Colors.pinkAccent
                ],
              ),
              const SizedBox(height: 20.0),
              const Text("Getting ready for the party to start.\nThanks for ur patience.",
              style: bigTitle,textAlign: TextAlign.center,),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                style: fillText,
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Please enter your email address",
                  hintStyle: textHint,
                  suffixIcon: InkWell(
                    onTap: (){
                      if(emailController.text.isEmpty){
                        commonToast(context: context, title: "  Please enter email  ", alignCenter:false);
                      }else{
                        LoginApi().notifyApi(email: emailController.text, context: context).then((value){
                          emailController.clear();
                        });
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 75,
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                      ),
                      child: Text("Send",style: drawerSubTitle,),
                    ),
                  ),
                  fillColor: cardBackGround,
                  contentPadding: const EdgeInsets.only(
                      left: 25.0, bottom: 12.0, top: 0.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const Text("Notify me when App is launched",style: cardSubtitle),
            ],
          ),
        ),
      ),
    );
  }
}
