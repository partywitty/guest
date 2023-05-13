
import 'dart:convert';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart';
import '../Modal/artistDetailsM.dart';
import '../Modal/bestofferM.dart';
import '../Modal/bottomBanner.dart';
import '../Modal/couponM.dart';
import '../Modal/dealM.dart';
import '../Modal/dealtypeM.dart';
import '../Modal/generesM.dart';
import '../Modal/happenningPartyM.dart';
import '../Modal/highlyRecM.dart';
import '../Modal/middlebanner.dart';
import '../Modal/newOnM.dart';
import '../Modal/pdfReaderM.dart';
import '../Modal/popularClubM.dart';
import '../Modal/promocodeM.dart';
import '../Modal/topbanner.dart';
import '../Modal/topclubM.dart';
import '../Utils/sharepref.dart';
import 'API_link.dart';

class homeApi {
  final guestId = GetUserDetail();
  RxBool loader = true.obs;

  Future<Topbanner> topbanner() async {
    final response = await get(Uri.parse("${Api_link.baseUrl}GuastTopBanner"),
    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      loader.value = false;
      return Topbanner.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<Middlebanner> middlebanner() async {
    final response = await get(Uri.parse("${Api_link.baseUrl}GuastMiddleBanner"),
    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      loader.value = false;
      return Middlebanner.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<DealtypeM> Dealtype() async {
    final response = await get(Uri.parse("${Api_link.baseUrl}DealType"),
    );
    var data = jsonDecode(response.body);
    print('-----Bestoffer------body---------------$data');
    if (response.statusCode == 200) {
      loader.value = false;
      return DealtypeM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<DealM> Dealapi({deal_typeId}) async {
    var userid = await guestId.getUserData('id');
    var body = {
      "deal_type_id": deal_typeId.toString(),
      "club_id": "1",
    };
    final response = await post(Uri.parse("${Api_link.baseUrl}Deals"),
        body: body);
    print('-----Deal------body---------------$body');
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print('-----Deal------data---------------$data');
      return DealM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<BestofferM> BestOfferapi({type, hotelType}) async {
    var userid = await guestId.getUserData('id');
    var body = {
      "guast_id": userid.toString(),
    };
    final response = await post(Uri.parse("${Api_link.baseUrl}BestOffers"),
        body: body);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return BestofferM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<HighlyRecM> HighlyRecMapi({type, hotelType}) async {
    var userid = await guestId.getUserData('id');

    var body = {
      "guast_id": userid.toString(),
    };
    final response = await post(Uri.parse("${Api_link.baseUrl}HighlyRecommended"),
        body: body);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return HighlyRecM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<TopclubM> Topclubapi({type, hotelType}) async {
    var userid = await guestId.getUserData('id');
    var body = {
      "guast_id": userid.toString(),
    };
    final response = await post(Uri.parse("${Api_link.baseUrl}topclubs"),
        body: body);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return TopclubM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<HappenningPartyM> HappenningPartyapi() async {
    var userid = await guestId.getUserData('id');
    var body = {
      "guast_id": userid.toString(),
    };
    final response = await post(Uri.parse("${Api_link.baseUrl}HappenningParty"),
        body: body);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return HappenningPartyM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<BottomBanner> BottomBannerapi() async {
    var userid = await guestId.getUserData('id');

    var body = {
      "guast_id": userid.toString(),
    };
    final response = await post(Uri.parse("${Api_link.baseUrl}BottomBanners"),
        body: body);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return BottomBanner.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<GeneresM> Generesapi() async {
    var userid = await guestId.getUserData('id');
    var body = {
      "guast_id": userid.toString(),
    };
    final response = await post(Uri.parse("${Api_link.baseUrl}generes"),
        body: body);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return GeneresM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<NewOnM> NewOnapi() async {
    var userid = await guestId.getUserData('id');
    var body = {
      "guast_id": userid.toString(),
    };
    final response = await post(Uri.parse("${Api_link.baseUrl}NewOn"),
        body: body);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return NewOnM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<PopularClubM> PopularClubapi() async {
    var userid = await guestId.getUserData('id');
    var body = {
      "guast_id": userid.toString(),
    };
    final response = await post(Uri.parse("${Api_link.baseUrl}PopularClub"),
        body: body);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return PopularClubM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<CouponM> couponApi() async {
    var userid = await guestId.getUserData('id');
    var body = {
      "guast_id": userid.toString(),
    };
    final response = await post(Uri.parse("${Api_link.baseUrl}Coupon"),
        body: body);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return CouponM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<PromocodeM> promoCodeApi({type, hotelType}) async {
    var userid = await guestId.getUserData('id');

    var body = {
      "guast_id": userid.toString(),
    };
    final response = await post(Uri.parse("${Api_link.baseUrl}PromoCode"),
        body: body);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return PromocodeM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future <PdfReaderM> pdfReader() async {
    var body = {
      "club_id": '927'
    };
    final response = await post(Uri.parse('https://www.partywitty.com/api/BevarageMenu'),
        body: body);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      loader.value = false;
      return PdfReaderM.fromJson(data);
    }
    else {
      loader.value = false;
      throw Exception('Failed to load post');
    }
  }

  Future<ArtistProfileDetails> artistProfileDetailsApi({artistId,profileId}) async {
    var data1 = {
      "artist_id" : artistId,
      "profile_id" : profileId,
    };
    final response = await post(Uri.parse(Api_link.getArtistDetailsUrl),
      body: data1,
    );
    var data= jsonDecode(response.body);
    if (response.statusCode == 200) {
      return ArtistProfileDetails.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

}