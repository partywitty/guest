
// ignore_for_file: camel_case_types

import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter/material.dart';

class Api_link{
  static const imageUrl ='https://partywitty.com/';
  static const baseUrl ='https://www.partywitty.com/api/';

  static  const signup= '${baseUrl}GuestSignup';
  static  const artistListApi = '${baseUrl}list_of_artist';
  static  const getCardUrl = '${baseUrl}GetCart';
  static  const deleteCardUrl = '${baseUrl}DeleteCart';
  static  const requestSend = '${baseUrl}send_request';
  static  const typeOfArtist = '${baseUrl}type_of_artist';
  static  const artistSubType = '${baseUrl}type_of_artist_subcategory';
  static  const artistGenres = '${baseUrl}GetGenres';
  static  const artistFilter = '${baseUrl}FilterArtist';
  static  const login= '${baseUrl}GuestLogin';
  static  const notify= '${baseUrl}NotifyEmails';
  static  const  addCard = '${baseUrl}AddCart';
  static  const getOtp= '${baseUrl}GuastForgotPassword';
  static  const otpApi= '${baseUrl}guast_verify_otp';
  static  const forgetVerify = '${baseUrl}guast_verify_otp';
  static  const feeBeer = '${baseUrl}RewardScratch';
  static  const rewardClaim= '${baseUrl}RewardClaim';
  static  const scanReward = '${baseUrl}GetfirstReward';
  static  const googleUrl = '${baseUrl}AuthGuest';
  static  const googleSignLink = '${baseUrl}GuestProfileUpdate';
  static  const setPassWord = '${baseUrl}GuastPasswordUpdate';
  static  const getReward = '${baseUrl}GetReward';
  static  const allArtistUrl = '${baseUrl}AllArtist';
  static  const getArtistDetailsUrl = '${baseUrl}ArtistDetail';
}

 commonToast({ context ,required title ,required bool alignCenter}){
  showToast(title,
    backgroundColor:  const Color(0xFFFD2F71),
    textStyle: const TextStyle(color: Colors.white , fontWeight: FontWeight.w500 , fontSize: 12 , fontFamily: 'appbarstyle'),
    context: context,
    alignment: alignCenter ? Alignment.center:Alignment.topCenter,
    animation: StyledToastAnimation.scale,
    reverseAnimation: StyledToastAnimation.fade,
    borderRadius:const BorderRadius.all(Radius.circular(12)),
    textPadding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
    position:alignCenter? StyledToastPosition.center : StyledToastPosition.top,
    animDuration:const Duration(seconds: 1),
    duration:const Duration(seconds: 3),
    curve: Curves.elasticOut,
    reverseCurve: Curves.linear,
  );
}