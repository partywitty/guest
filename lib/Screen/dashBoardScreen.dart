
// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:partywitty_guest/Screen/psd.dart';
import 'package:partywitty_guest/Utils/Styles.dart';
import '../Auth/gettingStart.dart';
import '../Auth/guestDrawer.dart';
import '../Utils/sharepref.dart';
import 'ArtistScreen/allArtist.dart';
import 'Scan/ScanScreen.dart';
import 'about.dart';
import 'booking/booking.dart';
import 'home/homePage.dart';
import 'viewcart.dart';

class dashBoard extends StatefulWidget {
  const dashBoard({Key? key}) : super(key: key);

  @override
  State<dashBoard> createState() => _dashBoardState();
}

class _dashBoardState extends State<dashBoard> {
  final getUserId = GetUserDetail();

  int currentTab = 0;
  final List<Widget> screens = [
    const HomePage(),
    const bookingScreen(),
    const ArtistPage(),
    const gettingReady(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen  = const HomePage();

  String? userId;
  @override
  void initState() {
    // TODO: implement initState
    load();
    super.initState();
  }
  load()async{
      await getUserId.getUserData('id');
  }
  DateTime backPress = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        final timeGap = DateTime.now().difference(backPress);
        final cantExit = timeGap >= const Duration(seconds: 2);
        backPress = DateTime.now();
        if(cantExit){
          const snack = SnackBar(content: Text('Press Back button again to Exit'),duration: Duration(seconds: 2),);
          ScaffoldMessenger.of(context).showSnackBar(snack);
          return false;
        }else{
          return true;
        }
      },
      child: Scaffold(
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: appColor,
            onPressed: (){
              setState(() {
                currentScreen = const ScanHome();
              });
            },
          child: CircleAvatar(
              backgroundColor: appColor,
              radius: 25,
              child: Image.asset("assest/mainlogo.png",width: 22,height: 22,fit: BoxFit.fill)),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            color: bottomBarColor,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ///left tab button
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                        onPressed: (){
                        setState(() {
                          currentScreen = const HomePage();
                          currentTab = 0;
                        });
                        },
                      child: Column(
                        children: [
                          const SizedBox(height: 7.0),
                          Icon(Icons.home,color: currentTab == 0 ? appColor : Colors.blueGrey),
                          const SizedBox(height: 3.0),
                          Text("Home",
                              style: TextStyle(color: currentTab == 0 ? appColor : Colors.blueGrey,fontSize: 14))
                        ],
                      ),
                        ),
                    MaterialButton(
                        minWidth: 40,
                        onPressed: (){
                          setState(() {
                            currentScreen = const bookingScreen();
                            currentTab = 1;
                          });
                        },
                      child: Column(
                        children: [
                          const SizedBox(height: 7.0),
                          Image.asset("assest/booking.png",width: 22,height: 22,fit: BoxFit.fill,
                            color: currentTab == 1 ?
                            appColor : Colors.blueGrey,),
                          const SizedBox(height: 3.0),
                          Text("Booking",
                            style: TextStyle(
                                color: currentTab == 1 ?
                                appColor : Colors.blueGrey,
                                fontSize: 14),)
                        ],
                      ),
                    ),
                  ],
                ),
                ///right tab button
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                        onPressed: (){
                          setState(() {
                            currentScreen = const ArtistPage();
                            currentTab = 2;
                          });
                        },
                        child: Column(
                          children: [
                            const SizedBox(height: 7.0),
                            Image.asset("assest/our.png",width: 22,height: 22,fit: BoxFit.fill,
                              color: currentTab == 2 ?
                              appColor : Colors.blueGrey,),
                            const SizedBox(height: 3.0),
                            Text("Our Artist",
                                style: TextStyle(
                                    color: currentTab == 2 ?
                                    appColor : Colors.blueGrey,
                                    fontSize: 14))
                          ],
                        )
                    ),
                    // userId.toString() == null  ?
                    // MaterialButton(
                    //     onPressed: (){
                    //       setState(() {
                    //         Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login_page(),),(route)=> false);
                    //         currentScreen = guestDrawer().getDrawer();
                    //         currentTab = 3;
                    //       });
                    //     },
                    //     child: Column(
                    //       children: [
                    //         const SizedBox(height: 7.0),
                    //         Icon(Icons.logout,color: currentTab == 3 ? appColor : Colors.blueGrey,size: 24),
                    //         const SizedBox(height: 3.0),
                    //         Text("Login",
                    //             style: TextStyle(color: currentTab == 3 ? appColor : Colors.blueGrey,fontSize: 14))
                    //       ],
                    //     )
                    // ):
                    MaterialButton(
                        onPressed: (){
                          setState(() {
                            currentScreen = guestDrawer().getDrawer();
                            currentTab = 3;
                          });
                        },
                        child: Column(
                          children: [
                            const SizedBox(height: 7.0),
                            Image.asset("assest/profile.png",width: 22,height: 22,fit: BoxFit.fill,
                              color: currentTab == 3 ?
                              appColor : Colors.blueGrey),
                            const SizedBox(height: 3.0),
                            Text("Profile",
                                style: TextStyle(
                                    color: currentTab == 3 ?
                                    appColor : Colors.blueGrey,
                                    fontSize: 14))
                      ],
                    )
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}