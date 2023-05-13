import 'dart:convert';
import 'package:http/http.dart' ;
import 'package:partywitty_guest/Utils/sharepref.dart';
import 'API_link.dart';

class GetReward_api{
  final guestId=GetUserDetail();
  Future getreward_api() async {
    var userId = await guestId.getUserData('id');
    var data1;
    var body = {
      "guest_id": userId
    };
    final response = await post(Uri.parse(Api_link.scanReward), body: body,
    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      data1=data['data'];
      return data1;
    }
    else {throw Exception('Failed to load post');
    }
  }}