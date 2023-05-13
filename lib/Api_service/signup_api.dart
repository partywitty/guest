
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// import 'package:http/http.dart' as http;
// import 'package:partywitty_guest/Api_service/API_link.dart';
// import 'package:partywitty_guest/Utils/sharepref.dart';
//
// class Signup_Api{
//   var userId='';
//   final get_user_detail=GetUserDetail();
//   Future signup({ name,email,number,password, gender})async{
//     var data = {
//       "name": name.toString(),
//       "contact_no": number.toString(),
//       "email": email.toString(),
//       "password": password.toString(),
//       "gender": gender.toString(),
//     };
//     final response = await http.post(Uri.parse(Api_link.signup),
//         body: data);
//     print('response------!@${response.toString()}');
//     var model = jsonDecode(response.body);
//     print('hello___!@${model.toString()}');
//     if(model['error'] == false){
//       userId = model["data"]["id"].toString();
//       await get_user_detail.setUserData("id",userId);
//       print('userid--------$userId');
//       print('get_user_detail--------$get_user_detail');
//
//
//       Fluttertoast.showToast(
//           msg: model['message'],
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.blue,
//           textColor: Colors.white,
//           fontSize: 16.0);
//       return model ;
//     }else{
//       // Loading().onError(msg: "Invalid Credentials");
//       print(" Signup api not working");
//       print('Signup api---${response.body}');
//       Fluttertoast.showToast(
//           msg: model["message"],
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0);
//       throw Exception('Failed to load post');
//     }
//   }
//
//
// }

// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Auth/otp.dart';
import '../Utils/sharepref.dart';
import 'API_link.dart';

class SignupApi extends GetxController {
  RxBool isLoading = false.obs;
  String token = '';
  String userId = '';
  String endPage = '';
  final getUserDetail = GetUserDetail();

  Future<void> Signup_Api(
      {required String userName,
        required String contactNo,
        required String email,
        required String password,
        required String gender,
        required BuildContext context,
      }) async {
    final guestId = GetUserDetail();
    var lat = await guestId.getUserData('lat');
    var log = await guestId.getUserData('long');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.signup));
      request.fields.addAll({
        'password': password,
        'email':email,
        'gender':gender,
        'contact_no': contactNo,
        'name': userName,
        'lat' : lat,
        'long': log,
      });
      http.StreamedResponse response = await request.send();
      print(request.files);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          commonToast(context: context, title: 'Email must be unique', alignCenter: false);
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              Otp_page(Ids: responseDecode["data"]["id"].toString())));
          userId = responseDecode["data"]["id"].toString();
          print("user id----------------------$userId");
          await getUserDetail.setUserData("id", userId);
        }
        isLoading.value = false;
        print(responseDecode);
      } else {
        commonToast(context: context, title: 'Internal Server Error', alignCenter: true);
        print(response.reasonPhrase);
      }}catch(e){
      isLoading.value = false;
      commonToast(context:context, title: 'Internal Server Error', alignCenter: true);
      print(e);
    }
  }
}