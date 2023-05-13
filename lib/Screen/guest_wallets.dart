// ignore_for_file: camel_case_types, must_be_immutable
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partywitty_guest/Api_service/API_link.dart';
import 'package:partywitty_guest/Api_service/reward_api.dart';
import 'package:partywitty_guest/Screen/qrscan.dart';
import 'package:partywitty_guest/Utils/Styles.dart';
import 'package:scratcher/widgets.dart';
import '../Api_service/claim_api.dart';
import '../Modal/rewardStatusM.dart';
import '../Utils/sharepref.dart';


class Guest_wallet extends StatefulWidget {
  String club_id;
   Guest_wallet({required this.club_id});

  @override
  State<Guest_wallet> createState() => Guest_walletState();
}

class Guest_walletState extends State<Guest_wallet> with SingleTickerProviderStateMixin {
  final controller = ConfettiController();
  bool isPlaying = false;
  TabController? _tabController;
  @override
  final scratchKey = GlobalKey<ScratcherState>();

  @override
  void initState() {
    load();
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    controller.addListener(() {
      setState(() {
        isPlaying = controller.state == ConfettiControllerState.playing;
      });
    });
    countdownController.start();
    setState(() {
      isRunning = true;
    });
  }


  bool offerImage = true;
  var data;
  var beer;
  var rewardIds;

  List<rewardData> rewardStatus = [];

  load() {
    GetReward_api().getreward_api().then((value) {
      setState(() {
        data = value;
      });
    });
    AddProductApi().beerStatusApi().then((value) {
      setState(() {
        rewardStatus = value.data!;
        beer = rewardStatus[0].status;
        rewardIds = rewardStatus[0].rewardId;
      });
    });
  }

  double _opacity = 0.0;
  @override

  void dispose(){
    super.dispose();
    controller.dispose();
    countdownController.dispose();
  }

  CountdownController countdownController =
  CountdownController(duration: const Duration(days: 28), onEnd: () {
    print('onEnd');
  });

  bool isRunning = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.center,
      children: [
        Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text("Wallet", style: appBarText,),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ImageSlideshow(
                    width: double.infinity,
                    height: 200,
                    initialPage: 0,
                    indicatorColor: Colors.white,
                    indicatorBackgroundColor: Colors.grey,
                    onPageChanged: (value) {
                      print('Page changed: $value');
                    },
                    autoPlayInterval: 3000,
                    isLoop: true,
                    children: [
                      Image.asset(
                        'assest/wallet1.png',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assest/mask1.png',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assest/wallet1.png',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Positioned(
                      right: 10,
                      top: 100,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        width: width/1.5,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white70
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("PARTYWITTY.COM"),
                        ),
                      )
                  ),
                  Positioned(
                      right: 30,
                      top: 70,
                      child: Container(
                        alignment: Alignment.center,
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            color: Colors.white70
                        ),
                        child:  Image.asset("assest/qr.png",fit: BoxFit.fill,height: 70,width: 70),
                      )
                  ),
                ],
              ),
              const SizedBox(height: 10.0,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                // color: Colors.black12,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 0.0),
                height: 50,
                child: TabBar(
                  labelColor: Colors.white,
                  controller: _tabController,
                  isScrollable: true,
                  indicatorWeight: 0.0,
                  indicatorColor: Colors.grey,
                  unselectedLabelColor: Colors.grey,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelPadding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 0.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 0.0, vertical: 5.0),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    // border: Border.all(color: tabBorderColor),
                    color: secondColor,
                  ),
                  tabs: <Widget>[
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        width: 150,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 5.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: secondColor),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: const Text('My Coupon', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500),),),
                    ),
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                          width: 150,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0.0, vertical: 5.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: secondColor),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Text("Wallet", style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500))
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      children: [
                        const SizedBox(height: 20,),
                        beer == "1" ?
                        Row(
                          children: [
                            // Stack(
                            //   children: [
                            //     Container(
                            //       margin: EdgeInsets.symmetric(horizontal: 5.0),
                            //       height: height/4,
                            //       width: width/2.3,
                            //       child: ClipRRect(
                            //           clipBehavior:
                            //           Clip.antiAliasWithSaveLayer,
                            //           borderRadius:
                            //           BorderRadius.circular(10.0),
                            //           child: Image.asset('assest/party_img.png',fit: BoxFit.fill,)),
                            //     ),
                            //     Positioned(
                            //       top: 0,
                            //         left: 10,
                            //         child: Image.asset("assest/guest logo.png",width: 50,height: 50,fit: BoxFit.contain)),
                            //     Positioned(
                            //         top: 0,
                            //         right: 0,
                            //         left: 0,
                            //         bottom: 0,
                            //         child: Column(
                            //           children: [
                            //             SizedBox(height: 50.0,),
                            //             Text("20%",style: cardSubtitle),
                            //             Text("OFF",style: bigTitle),
                            //             Text("UP to",style: cardSubtitle),
                            //             Text("₹ 2000",style: bigTitle),
                            //           ],
                            //         )
                            //     )
                            //   ],
                            // ),
                            InkWell(
                              onTap: (){
                               // scratchDialog(context);
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                height: height/4,
                                width: width/2.3,
                                child: ClipRRect(
                                    clipBehavior:
                                    Clip.antiAliasWithSaveLayer,
                                    borderRadius:
                                    BorderRadius.circular(10.0),
                                    child: Image.asset('assest/beer.png',fit: BoxFit.fill,)),
                              ),
                            ),
                          ],
                        ) :
                        beer == "0" ?
                        SizedBox(
                          width: width,
                          child: GridView.builder(
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 1,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0),
                              itemBuilder: (BuildContext context, int index) {
                                //var data = photosList[index];
                                return InkWell(
                                  onTap : (){
                                    scratchDialog(context);
                                  },
                                  child: Container(
                                    width: width/2.5,
                                    height: height/5,
                                    margin: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                        color : Colors.blue,
                                        border: Border.all(color: Colors.grey, width: 1),
                                        borderRadius: BorderRadius.circular(12)),
                                  ),
                                );
                              }),
                        ) :
                        const SizedBox(),
                        const SizedBox(height: 20,),

                        // Row(
                        //   children: [
                        //     Stack(
                        //       children: [
                        //         Container(
                        //           alignment: Alignment.center,
                        //           margin: EdgeInsets.symmetric(horizontal: 5.0),
                        //           height: height/4,
                        //           width: width/2.3,
                        //           decoration: BoxDecoration(
                        //               image: DecorationImage(
                        //                   image: AssetImage("assest/timer.png"),fit: BoxFit.fill
                        //               )
                        //           ),
                        //           child: ClipRRect(
                        //               clipBehavior:
                        //               Clip.antiAliasWithSaveLayer,
                        //               borderRadius:
                        //               BorderRadius.circular(10.0),
                        //               child: Image.asset('assest/mainlogo.png',fit: BoxFit.fill,width: 40,height: 40,)),
                        //         ),
                        //         Positioned(
                        //           bottom: 0,
                        //           child: Container(
                        //             margin: EdgeInsets.only(bottom: 5.0,left: 15.0),
                        //             padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                        //             // height: 40,
                        //             width: 150,
                        //             decoration: BoxDecoration(
                        //                 color: Color(0xFF970222),
                        //                 borderRadius: BorderRadius.circular(20.0)
                        //             ),
                        //             child: Countdown(
                        //                 countdownController: countdownController,
                        //                 builder: (_, Duration time) {
                        //                   return Row(
                        //                     mainAxisAlignment: MainAxisAlignment.center,
                        //                     children: [
                        //                       Column(
                        //                         children: [
                        //                           const Text("Days",style: smallText,),
                        //                           Container(
                        //                             padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                        //                             decoration: BoxDecoration(
                        //                                 borderRadius: BorderRadius.circular(5.0),
                        //                                 color: Colors.white
                        //                             ),
                        //                             child: Text("${time.inDays}",style: timerCount),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                       const Text(" : ",style: timerDot,),
                        //                       Column(
                        //                         children: [
                        //                           const Text("Hour",style: smallText,),
                        //                           Container(
                        //                             padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                        //                             decoration: BoxDecoration(
                        //                                 borderRadius: BorderRadius.circular(5.0),
                        //                                 color: Colors.white
                        //                             ),
                        //                             child: Text("${time.inHours % 24}",style: timerCount),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                       const Text(" : ",style: timerDot,),
                        //                       Column(
                        //                         children: [
                        //                           const Text("Minute",style: smallText,),
                        //                           Container(
                        //                             padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                        //                             decoration: BoxDecoration(
                        //                                 borderRadius: BorderRadius.circular(5.0),
                        //                                 color: Colors.white
                        //                             ),
                        //                             child: Text("${time.inMinutes % 60}",style: timerCount),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ],
                        //                   );
                        //                 }),
                        //           ),
                        //         )
                        //       ],
                        //     ),
                        //     Stack(
                        //       children: [
                        //         Container(
                        //           alignment: Alignment.center,
                        //           margin: EdgeInsets.symmetric(horizontal: 5.0),
                        //           height: height/4,
                        //           width: width/2.3,
                        //           decoration: BoxDecoration(
                        //             image: DecorationImage(
                        //               image: AssetImage("assest/timer.png"),fit: BoxFit.fill
                        //             )
                        //           ),
                        //           child: ClipRRect(
                        //               clipBehavior:
                        //               Clip.antiAliasWithSaveLayer,
                        //               borderRadius:
                        //               BorderRadius.circular(10.0),
                        //               child: Image.asset('assest/mainlogo.png',fit: BoxFit.fill,width: 40,height: 40,)),
                        //         ),
                        //         Positioned(
                        //           bottom: 0,
                        //           child: Container(
                        //             margin: EdgeInsets.only(bottom: 5.0,left: 15.0),
                        //             padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                        //             // height: 40,
                        //             width: 150,
                        //             decoration: BoxDecoration(
                        //                 color: Color(0xFF970222),
                        //                 borderRadius: BorderRadius.circular(20.0)
                        //             ),
                        //             child: Countdown(
                        //                 countdownController: countdownController,
                        //                 builder: (_, Duration time) {
                        //                   return Row(
                        //                     mainAxisAlignment: MainAxisAlignment.center,
                        //                     children: [
                        //                       Column(
                        //                         children: [
                        //                           const Text("Days",style: smallText,),
                        //                           Container(
                        //                             padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                        //                             decoration: BoxDecoration(
                        //                                 borderRadius: BorderRadius.circular(5.0),
                        //                                 color: Colors.white
                        //                             ),
                        //                             child: Text("${time.inDays}",style: timerCount),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                       const Text(" : ",style: timerDot,),
                        //                       Column(
                        //                         children: [
                        //                           const Text("Hour",style: smallText,),
                        //                           Container(
                        //                             padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                        //                             decoration: BoxDecoration(
                        //                                 borderRadius: BorderRadius.circular(5.0),
                        //                                 color: Colors.white
                        //                             ),
                        //                             child: Text("${time.inHours % 24}",style: timerCount),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                       const Text(" : ",style: timerDot,),
                        //                       Column(
                        //                         children: [
                        //                           const Text("Minute",style: smallText,),
                        //                           Container(
                        //                             padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                        //                             decoration: BoxDecoration(
                        //                                 borderRadius: BorderRadius.circular(5.0),
                        //                                 color: Colors.white
                        //                             ),
                        //                             child: Text("${time.inMinutes % 60}",style: timerCount),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ],
                        //                   );
                        //                 }),
                        //           ),
                        //         )
                        //       ],
                        //     ),
                        //   ],
                        // ),

                        const SizedBox(height: 20,),

                        // Row(
                        //   children: [
                        //     Stack(
                        //       children: [
                        //         Container(
                        //           alignment: Alignment.center,
                        //           margin: EdgeInsets.symmetric(horizontal: 5.0),
                        //           height: height/4,
                        //           width: width/2.3,
                        //           decoration: BoxDecoration(
                        //               image: DecorationImage(
                        //                   image: AssetImage("assest/timer.png"),fit: BoxFit.fill,
                        //               )
                        //           ),
                        //           child: Column(
                        //             children: [
                        //               SizedBox(height: 10.0,),
                        //               Image.asset("assest/gift.png",fit: BoxFit.fill,width: 50,height: 50),
                        //               SizedBox(height: 10.0,),
                        //               Text("Win 500 \nInstant OFF",style: couponText),
                        //               SizedBox(height: 10.0,),
                        //               Text("On All Offers ",style: timerCount),
                        //               SizedBox(height: 10.0,),
                        //               Container(
                        //                 padding: EdgeInsets.symmetric(horizontal: 10.0),
                        //                 margin: EdgeInsets.only(left: 15,right: 15),
                        //                 decoration: BoxDecoration(
                        //                   color: couponColor,
                        //                   borderRadius: BorderRadius.circular(20),
                        //                 ),
                        //                 child: Row(
                        //                   children: [
                        //                     Container(
                        //                       decoration: BoxDecoration(
                        //                         color: Colors.white,
                        //                         borderRadius: BorderRadius.circular(100),
                        //                       ),
                        //                         child: Image.asset("assest/tick1.png",height: 20,width: 20,fit: BoxFit.fill)),
                        //                     SizedBox(width: 5,),
                        //                     Text("Use Code",style: smallText),
                        //                     Text("NBKLHR ",style: cardSubtitle),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ],
                        // ),

                        // Countdown(
                        //     countdownController: countdownController,
                        //     builder: (_, Duration time) {
                        //       return Text(
                        //         'hours: ${time.inHours} minutes: ${time.inMinutes % 60} seconds: ${time.inSeconds % 60}',
                        //         style: TextStyle(fontSize: 20,color: Colors.white),
                        //       );
                        //     }),

                        // ElevatedButton(onPressed: (){
                        //     countdownController.start();
                        //   setState(() {
                        //     isRunning = true;
                        //   });
                        // }, child: Text("Start")),

                        const SizedBox(height: 20,),
                        // SizedBox(
                        //   width: width,
                        //   child: GridView.builder(
                        //       physics: ScrollPhysics(),
                        //       shrinkWrap: true,
                        //       itemCount: 1,
                        //       gridDelegate:
                        //       const SliverGridDelegateWithFixedCrossAxisCount(
                        //           crossAxisCount: 2,
                        //           crossAxisSpacing: 10.0,
                        //           mainAxisSpacing: 10.0),
                        //       itemBuilder: (BuildContext context, int index) {
                        //         //var data = photosList[index];
                        //         return InkWell(
                        //           onTap : (){
                        //             scratchDialog(context);
                        //           },
                        //           child: Container(
                        //             width: width/2.5,
                        //             height: height/5,
                        //             margin: const EdgeInsets.all(5.0),
                        //             decoration: BoxDecoration(
                        //                 color : Colors.blue,
                        //                 border: Border.all(color: Colors.grey, width: 1),
                        //                 borderRadius: BorderRadius.circular(12)),
                        //           ),
                        //         );
                        //       }),
                        // ),
                      ],
                    ),
                    ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        const SizedBox(height: 10,),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/amount');
                          },
                          child: Container(
                            height: 65,
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            decoration: BoxDecoration(
                                color: cardBackGround,
                                borderRadius: BorderRadius.circular(9)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("Balance",style: appBarText),
                                SizedBox(width: 20,),
                                Text("₹ 0/-",style: appBarText),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        data == null ?
                        const Text("Claim not available", style: cardTitle,) :
                        ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 10.0),
                                child: Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: cardBackGround,
                                        borderRadius: BorderRadius.circular(
                                            8)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius
                                                .circular(10),
                                            child: Image.asset(
                                              'assest/party_img.png',
                                              fit: BoxFit.fill,
                                              height: 80,
                                              width: 80,
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets
                                                  .only(
                                                  top: 3,
                                                  left: 10,
                                                  bottom: 3),
                                              child: Column(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .start,
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    SizedBox(
                                                      height: 50,
                                                      width: 185,
                                                      child: Text(
                                                          data['reward_name']
                                                              .toString(),
                                                          textScaleFactor: 1,
                                                          overflow: TextOverflow
                                                              .clip,
                                                          softWrap: true,
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontWeight: FontWeight
                                                                .w400,
                                                            fontSize: 12,
                                                            color: Colors
                                                                .white,)
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                      width: 185,
                                                      child: Row(
                                                          mainAxisAlignment: MainAxisAlignment
                                                              .spaceAround,
                                                          children: [
                                                            Container(
                                                              width: 40,),
                                                            InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  print(
                                                                      data['claim']);
                                                                  if (data['claim'] ==
                                                                      true) {
                                                                    commonToast(
                                                                        context: context,
                                                                        title: "you are claimed the offer",
                                                                        alignCenter: false);
                                                                  } else {
                                                                    Navigator
                                                                        .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (
                                                                                context) =>
                                                                                ScanQrPage(
                                                                                    club_id: data['id']
                                                                                        .toString())));
                                                                  }
                                                                });
                                                              },
                                                              child: Container(
                                                                  height: 40,
                                                                  padding: const EdgeInsets
                                                                      .only(
                                                                      left: 7,
                                                                      right: 4),
                                                                  alignment: Alignment
                                                                      .center,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius
                                                                        .circular(
                                                                        2),
                                                                    gradient: const LinearGradient(
                                                                      begin: FractionalOffset(
                                                                          0.1,
                                                                          0.1),
                                                                      end: FractionalOffset(
                                                                          0.8,
                                                                          0.1),
                                                                      colors: [
                                                                        Color(
                                                                            0xFFFE262F),
                                                                        Color(
                                                                            0xFFFD2F71),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  child: Text(
                                                                      data['claim'] ==
                                                                          false
                                                                          ? 'Claim'
                                                                          : "Claimed",
                                                                      style: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FontWeight
                                                                            .w500,
                                                                        fontSize: 11,
                                                                        color: Colors
                                                                            .white,))
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 6,
                                                            ),
                                                            Container(
                                                              height: 40,
                                                              alignment: Alignment
                                                                  .center,
                                                              child: Text(
                                                                'Igonre',
                                                                style: GoogleFonts
                                                                    .poppins(
                                                                    fontWeight: FontWeight
                                                                        .w600,
                                                                    fontSize: 10,
                                                                    color: const Color(
                                                                        0xFFFE262F)),
                                                              ),
                                                            ),
                                                          ]),
                                                    ),

                                                  ])),
                                        ],
                                      ),
                                    )),
                              );
                            }),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          decoration: BoxDecoration(
                              color: cardBackGround,
                              borderRadius: BorderRadius.circular(9)),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10, bottom: 6),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("History",style: appBarText),
                                      const SizedBox(width: 25,),
                                      Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                                        decoration: BoxDecoration(color: Colors.white60, borderRadius: BorderRadius.circular(4)),
                                        child: const Text("Request withdrawal", style: cardSubtitle),
                                      ),

                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text("For event in Hotel", style: cardSubtitle),
                                          SizedBox(height: 5,),
                                          Text(" 30-02-2022  05:30 PM  ",style: cardTime),
                                          SizedBox(height: 5.0,),
                                        ],
                                      ),
                                      const SizedBox(width: 20,),
                                      const Text("+ ₹ 0/-",style: cardRupeeGreen),

                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Container(width: double.infinity,
                                    height: 1, color: Colors.grey,),
                                ),
                                const SizedBox(height: 10,),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text("Withdrawal", style: cardSubtitle),
                                          SizedBox(height: 5,),
                                          Text(" 30-02-2022  05:30 PM  ",style: cardTime),
                                        ],
                                      ),
                                      const SizedBox(width: 20,),
                                      const Text("- ₹ 0/-", style:cardRupeeRed),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // bottomSheet:  getBottom(),
        ),
        ConfettiWidget(
          confettiController: controller,
          shouldLoop: true,
          blastDirectionality: BlastDirectionality.explosive,
          numberOfParticles: 30,
        ),
      ],
    );
  }

  Future<void> getBeerStatus({rewardId,required BuildContext context}) async {
    final guestId = GetUserDetail();
    var userId = await guestId.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.feeBeer));
      request.fields.addAll({
        'guast_id': userId,
        'reward_id': rewardId,
      });
      print(request.fields);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          commonToast(context: context, title: 'Something wrong', alignCenter: true);
        } else {
          print(responseDecode);
          commonToast(context: context, title: responseDecode['message'], alignCenter: false);
          load();
        }
      } else {
        commonToast(context: context, title: 'Internal Server Error', alignCenter: true);
        print(response.reasonPhrase);
      }}catch(e){
      print(e);
    }
  }

  Future<void> scratchDialog(BuildContext context) {
    return showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: StatefulBuilder(builder: (context, StateSetter setState) {
              return Container(
                //height: 250,
                //width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Scratcher(
                        color: Colors.blue,
                        accuracy: ScratchAccuracy.low,
                        threshold: 30,
                        brushSize: 40,
                        onThreshold: () {
                          setState(() {
                            _opacity = 1;
                            getBeerStatus(context: context,rewardId: rewardIds.toString()).then((value) =>{
                            });
                            load();
                           // controller.play();
                            Navigator.pop(context);
                          });
                        },
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 100),
                          opacity: _opacity,
                          child: Container(
                            color: Colors.black,
                            height: MediaQuery.of(context).size.height * 0.3,
                            // width: MediaQuery.of(context).size.width * 0.6,
                            child:  Image.asset("assest/logo.png",),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                        child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                            child: const Icon(
                              Icons.cancel_outlined,size: 26,color: Colors.white,)))
                  ],
                ),
              );
            }),
          );
        }
    );
  }

  getBottom(){
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft:  Radius.circular(15),topRight:  Radius.circular(15))
        ),
        context: context,
        builder: (BuildContext context){
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            children: const [
              SizedBox(height: 20,),
              Text("Upto 6% Voucher Rewards from CouponDunia"),
              Text("Upto 6% Voucher Rewards from CouponDunia"),
              Text("Upto 6% Voucher Rewards from CouponDunia"),
              SizedBox(height: 20,),
            ],
          );
        });
  }
}