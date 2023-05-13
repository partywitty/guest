
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partywitty_guest/Auth/redeemScreen.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../Utils/Styles.dart';
import '../Utils/commonStyles.dart';
import '../Utils/sharepref.dart';
import 'login1.dart';
import 'login_page.dart';

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({Key? key}) : super(key: key);

  @override
  State<CurrentLocation> createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {

  String locationMessage = 'current location of the message';
  late String lat;
  late String log;

  /// current location
  Future<Position> getCurrentLocation () async{
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      return Future.error('Location service disable');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error("Location permission are denied");
      }
    }
    if(permission == LocationPermission.deniedForever){
      return Future.error("Location permission permaneere denida");
    }
    return await Geolocator.getCurrentPosition();
  }

  /// current location open map

  void _liveLocation(){
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    Geolocator.getPositionStream(locationSettings: locationSettings
    ).listen((Position position) {
       lat = position.latitude.toString();
       log = position.longitude.toString();
       setState(() {
         locationMessage = 'latitude : $lat , longitude : $log';
       });
    });
  }

  Future<void> _openMap(String lat, String log) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$lat,$log';
    await canLaunchUrlString(googleUrl) ?
        await launchUrlString(googleUrl) :
        throw 'could not lunch $googleUrl';
  }
  final get_user_detail=GetUserDetail();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          children: [
            const SizedBox(height: 50.0,),
            Image.asset('assest/current1.png',fit: BoxFit.fill,),
            const SizedBox(height: 10.0,),
            Text("Tell us your location",style: GoogleFonts.poppins(textStyle: fff),textAlign: TextAlign.center),
            const SizedBox(height: 5.0,),
            Text("This helps us recommend the best clubs and restaurants offers around you",style: GoogleFonts.poppins(textStyle: drawerSubTitle),textAlign: TextAlign.center),
            const SizedBox(height: 20.0,),
            InkWell(
              focusColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: (){
                getCurrentLocation().then((value) async{
                  lat = "${value.latitude}";
                  log = "${value.longitude}";
                  print(lat);
                  print(log);
                  setState(() {
                    locationMessage = "Latitude : $lat, longitude : $log";
                  });
                  _liveLocation();
                  String lati = lat;
                  String longi = log;
                  print("Latitude----------------------$lat");
                  print("Longitude----------------------$log");
                  await get_user_detail.setUserData("lat", lati);
                  await get_user_detail.setUserData("long", longi);
                });
                Get.to(redeemScreen());
                scratchDialog(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                    decoration: boxDecoration(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.my_location,color: Colors.white,size: 24),
                        Text("Auto Detect My Location",style: appBarText),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0,),
            // InkWell(
            //   onTap: (){
            //     getCurrentLocation().then((value) async{
            //       lat = "${value.latitude}";
            //       log = "${value.longitude}";
            //       print(lat);
            //       print(log);
            //       setState(() {
            //         locationMessage = "Latitude : $lat, longitude : $log";
            //       });
            //       _liveLocation();
            //       String lati = lat;
            //       String longi = log;
            //       print("Latitude----------------------$lat");
            //       print("Longitude----------------------$log");
            //       await get_user_detail.setUserData("lat", lati);
            //       await get_user_detail.setUserData("long", longi);
            //     });
            //     _openMap(lat, log);
            //     print("Latitude : $lat, longitude : $log");
            //   },
            //     child: Text("No, I will type my location every time",style: GoogleFonts.poppins(textStyle: blackUnderLine),textAlign: TextAlign.center)),
          ],
        ),
      ),
    );
  }
  Future<void> scratchDialog(BuildContext context) {
    return showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: StatefulBuilder(builder: (context, StateSetter setState) {
              return InkWell(
                  onTap: (){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login1(),),(route)=> false);
                   // Get.to(Login_page());
                  //  Navigator.pop(context);
                  },
                  child: Image.asset("assest/popup.png",fit: BoxFit.fill,));
            }),
          );
        }
    );
  }
}
