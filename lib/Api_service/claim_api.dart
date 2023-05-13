import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:partywitty_guest/Api_service/API_link.dart';
import 'package:partywitty_guest/Utils/sharepref.dart';
import '../Modal/artistListM.dart';
import '../Modal/cardDetailsM.dart';
import '../Modal/filterArtistM.dart';
import '../Modal/rewardStatusM.dart';
import '../Modal/subArtistM.dart';
import '../Modal/typeAtrtistM.dart';

class AddProductApi {

  final guestId = GetUserDetail();

  Future addProductApiService({clubId, rewardId,context}) async {

    var userId = await guestId.getUserData('id');
    var body = {
      'guast_id': userId,
      'club_id': clubId,
      'reward_id': rewardId,

    };
    final response = await http.post(Uri.parse(Api_link.rewardClaim), body: body);
    var model = jsonDecode(response.body);
    if (model['error'] == true) {
      commonToast(context: context, title: model['message'], alignCenter:false);
      return model;
    } else {
      commonToast(context: context, title: model['message'], alignCenter:false);

    }
  }

  Future<ArtistListM> getArtistList() async {
    var userId = await guestId.getUserData('id');
    var data1 = {
      "user_id" : userId
    };
    final response = await http.post(Uri.parse(Api_link.artistListApi),
      body: data1,
    );
    var data= jsonDecode(response.body);
    if (response.statusCode == 200) {
      return ArtistListM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future sendRequest({required String receiverId,required BuildContext context}) async {

    var userId = await guestId.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.requestSend));
      request.fields.addAll({
        'request_by': userId,
        'request_to': receiverId,
      });
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          commonToast(context: context, title: "some error", alignCenter:false);
        } else {
          commonToast(context: context, title: "Request send successfully", alignCenter:  false);
        }
       // isLoading.value = false;
        print(responseDecode);
      } else {
        print(response.reasonPhrase);
      }}catch(e){
     // isLoading.value = false;
      print(e);
    }
  }

  Future<TypeAtrtistM> artistType() async {
    var userId = await guestId.getUserData('id');
    var data1 = {
      "user_id" : userId
    };
    final response = await http.post(Uri.parse(Api_link.typeOfArtist),
      body: data1,
    );
    var data= jsonDecode(response.body);
    if (response.statusCode == 200) {
      return TypeAtrtistM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<SubArtistM> artistSubtype({subArtist}) async {
    var userId = await guestId.getUserData('id');
    var data1 = {
      "type_of_artist_id" : subArtist,
      "user_id" : userId
    };
    final response = await http.post(Uri.parse(Api_link.artistSubType),
      body: data1,
    );
    var data= jsonDecode(response.body);
    if (response.statusCode == 200) {
      return SubArtistM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future <RewardStatusM>beerStatusApi() async {
    var userId = await guestId.getUserData('id');
    var data1 = {
      "guest_id" : userId
    };
    final response = await http.post(Uri.parse(Api_link.getReward),
      body: data1,
    );
    var data= jsonDecode(response.body);
    if (response.statusCode == 200) {
      return RewardStatusM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<FilterArtistM> artistFilterApi({artistTypeId,subName,instrumentId,genresName,venueName,startPrice,endPrice}) async {
    var data1 = {
      "artists_type_id" : artistTypeId,
      "subcategory_name" : subName,
      "intrument_id" : instrumentId,
      "genres_name" : genresName,
      "venue_name" : venueName,
      "start_price" : startPrice,
      "end_price" : endPrice
    };
    final response = await http.post(Uri.parse(Api_link.artistFilter),
      body: data1,
    );
    var data= jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return FilterArtistM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<CardDetailsM> cardDetailApi() async {
    var userId = await guestId.getUserData('id');
    var data1 = {
      "guast_id" : "1"
    };
    final response = await http.post(Uri.parse(Api_link.getCardUrl),
      body: data1,
    );
    var data= jsonDecode(response.body);
    if (response.statusCode == 200) {
      return CardDetailsM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }
}