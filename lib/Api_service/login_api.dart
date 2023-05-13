import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:partywitty_guest/Api_service/API_link.dart';
import 'package:partywitty_guest/Utils/sharepref.dart';


class LoginApi{
  var userId='';
  var emailId='';
  var name='';
  var contact='';
  final getUserDetail = GetUserDetail();

  Future login({email, password,context}) async {
    var data = {
      "email": email.toString(),
      "password": password.toString(),
      "fcm": "asdaasa",
    };
    final response = await http.post(
      Uri.parse(Api_link.login),
      body: data,
    );
    var model = jsonDecode(response.body);
    if (model['error'] == false) {
      userId = model["data"]["id"].toString();
      emailId = model["data"]["email"].toString();
      name = model["data"]["name"].toString();
      contact = model["data"]["contact_no"].toString();
      await getUserDetail.setUserData("id",userId);
      await getUserDetail.setUserData("email",emailId);
      await getUserDetail.setUserData("name",name);
      await getUserDetail.setUserData("contact",contact);
      commonToast(context: context, title: model['message'], alignCenter:false);
      return model;
    } else {
      print(response.body);
      commonToast(context: context, title: model['message'], alignCenter:false);
      throw Exception('Failed to load post');
    }
  }

  Future notifyApi({required String email,required BuildContext context,}) async {
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.notify));
      request.fields.addAll({
        'email':email,
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          commonToast(context: context, title: "Email Already Use.", alignCenter:false);
        } else {
          commonToast(context: context, title: "Notification send successful", alignCenter:false);
        }
        print(responseDecode);
      } else {
        print(response.reasonPhrase);
      }}catch(e){

      print(e);
    }
  }

  Future addCardApi({required String dealId,required BuildContext context,}) async {
    var userId = await getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.addCard));
      request.fields.addAll({
        'guast_id': "1",
        'deal_id': dealId,
      });
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          commonToast(context: context, title: "Deal already added", alignCenter:false);
        } else {
          commonToast(context: context, title: "Deal added successful", alignCenter:false);
        }
        print(responseDecode);
      } else {
        print(response.reasonPhrase);
      }}catch(e){
      print(e);
    }
  }

  Future deleteCardApi({required String dealId,required BuildContext context,}) async {
    var userId = await getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.deleteCardUrl));
      request.fields.addAll({
        'guast_id': userId,
        'deal_id': dealId,
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          commonToast(context: context, title: "server error", alignCenter:false);
        } else {
          commonToast(context: context, title: "Deal remove successful", alignCenter:false);
        }
        print(responseDecode);
      } else {
        print(response.reasonPhrase);
      }}catch(e){
      print(e);
    }
  }
}