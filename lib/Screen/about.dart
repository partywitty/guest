// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../Api_service/API_link.dart';
import '../Api_service/homeApi.dart';
import '../Modal/dealM.dart';
import '../Modal/dealtypeM.dart';
import '../Modal/pdfReaderM.dart';
import '../Utils/Styles.dart';
import 'partywittyPay/addOnFirst.dart';
import 'partywittyPay/instantAdd.dart';


class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);
  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About>   with SingleTickerProviderStateMixin {
  var index=0;
  int currentPos = 0;
  late TabController _tabController;
  bool  select=false;
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  List<String> listPaths = [
    "assest/live-music 1.png",
    "assest/dj_img.png",
    "assest/menu 1.png",
    "assest/deal 1.png",
    "assest/meals .png",
  ];
  List<String> homeBanner = [
    "assest/Mask group.png",
    "assest/Mask group.png",
    "assest/Mask group.png",
    "assest/Mask group.png",
  ];
  List <DealtypeData> Dealtype=[];
  List <PdfReaderData> PdfReaderdata=[];
  List <DealData> Deal=[];
  List <DealData> selectDeal=[];

  @override
  void initState() {
    load();
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  load(){
    homeApi().pdfReader().then((value) {
      setState((){
        PdfReaderdata=value.data!;
      });
    });
    homeApi().Dealtype().then((value) {
      setState((){
        Dealtype=value.data!;
      });
    });
    homeApi().Dealapi(deal_typeId: '1').then((value) {
      setState((){
        Deal=value.data!;
      });
    });
  }
  int selectitem=0;
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFf141420),
      body: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          Stack(
            children: [
              SizedBox(
                height: 208,
                width: width,
                child: CarouselSlider(
                  options: CarouselOptions(
                      height: 208,
                      autoPlay: true,
                      aspectRatio: 20 / 9,
                      // autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      viewportFraction:1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentPos = index;});
                      }),
                  items:listPaths. map((item) =>
                      Image.asset('assest/img.png',fit: BoxFit.fill,),
                  ).toList(),),
              ),
              Positioned(
                  bottom: 10,
                  left: width*0.4,
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Align(
                              alignment: Alignment.center,
                              child:  buildIndicator(),
                            ),
                          ),]),)),
              Positioned(
                left:10,
                right: 20,
                child:Container(
                  width: width,
                  height: 40,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
                      Row(
                      children: [
                        SizedBox(
                            width:30,
                            child: IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border_outlined,color: Colors.white,size: 20,))),
                        SizedBox(
                            width:30,
                            child: IconButton(onPressed: (){}, icon: const Icon(Icons.share_outlined,color: Colors.white,size: 20,))),
                      ],
                        )
                    ],
                  ) ,
                ),
              ),
              Positioned(
                  bottom: 10,
                  left: 10,
                  child:  Container(
                    padding: const EdgeInsets.only(left:5,right: 5,top: 3,bottom: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                     borderRadius: BorderRadius.circular(30)
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.radio_button_checked,color: Color(0xFFFE262F),size: 16,),
                        Text(' Live Music ',  style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 12, color: const Color(0xFFFE262F),)),
                      ],
                    ),
                  ),
              ),
              Positioned(
                top: 10,
                left: 25,
                child:  Container(
                  padding: const EdgeInsets.only(left:5,right: 5,top: 3,bottom: 3),
                  decoration: BoxDecoration(
                      color: const Color(0xFF1F1E2E),
                      border: Border.all(color:const Color(0xFFFE9923 ), ),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child:Text('12:24:12',  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 12, color:Colors.white ,)),
                ),
              ),
              Positioned(
                  bottom: 10,
                  right: 15,
                  child: Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Color(0xFFCFCFCF),
                            shape: BoxShape.circle,
                        ),
                        child: Image.asset('assest/dance 1.png',fit: BoxFit.fill),
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: cardBackGround
                        ),
                        child: CircularPercentIndicator(
                          radius: 30.0,
                          animation: true,
                          animationDuration: 1200,
                          lineWidth: 5.0,
                          percent: 0.5,
                          center: const Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: 'M',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0,color: Colors.blue)
                                ),
                                TextSpan(
                                  text: '/F',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0,color: appColor),
                                ),
                              ],
                            ),
                          ),
                          circularStrokeCap: CircularStrokeCap.butt,
                          backgroundColor: Colors.blue,
                          progressColor: appColor,
                        ),
                      ),
                    ],
                  )
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0,top: 15,right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(' Lord of the Drinks Chamber', style: GoogleFonts.poppins(textStyle: labelText)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.location_on,color: Colors.white,size: 15,),
                        const SizedBox(width: 3,),
                        SizedBox(
                          width:177,
                          child: Text('670.5 km away, Rajouri Garden Main Market, Rajouri Garden',
                              style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 8, color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 3,right: 3,bottom: 2),
                      height: 18,
                      width: 38,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(color: Colors.green,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(2),topRight: Radius.circular(2))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.star,
                            size: 11,color: Colors.white,),
                          Padding(
                            padding: EdgeInsets.only(top: 3.0),
                            child: Text('4.4',
                              style: TextStyle(color: Colors.white,fontSize: 10),),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 3,right: 3,),
                      height: 18,
                      width: 38,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(color: Color(0xFFCBFFC2),
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(2),bottomLeft: Radius.circular(2))
                      ),
                      child:const Text('(1200)',style: TextStyle(color: Colors.black,fontSize: 8),),
                    ),
                  ],
                ),
              ],
            ),
          ) ,
          Container(
            height: 34,
            alignment: Alignment.center,
            child:  TabBar(
              unselectedLabelColor: const Color(0xFFA3A3A3),
              controller: _tabController,
              labelColor:const Color(0xFFFE005B),
              isScrollable: true,
              labelPadding: const EdgeInsets.symmetric(horizontal: 12),
              indicatorColor: const Color(0xFFFE005B),
              indicatorWeight: 1,
              overlayColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.blue;
                }
                return Colors.pinkAccent;
              }),
              labelStyle: GoogleFonts.poppins(fontSize: 11, color: Colors.white,fontWeight: FontWeight.w400
              ),
              indicatorSize: TabBarIndicatorSize.label,
              tabs: const [
                Tab(text: 'About',),
                Tab(text: 'Deals/Offers'),
                Tab(text: 'Order at the table'),
                Tab(text: 'Review'),

              ],
            ),
          ),
          const Divider(height: 1,color: Colors.grey,),
          Padding(
            padding: const EdgeInsets.only(top:12.0),
            child: SizedBox(
              height: height/1.6,
              child: TabBarView(
                controller: _tabController,
                children: [
                  About(height,width),
                  Deals(height,width),
                  Order(height,width),
                  Review(width),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  About(height,width){
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      children: [
        Container(
          height: 170,
          padding: const EdgeInsets.only(left: 10,top: 5,bottom: 5),
          decoration: BoxDecoration(
            color: const Color(0xFF1F1E2E),
            borderRadius: BorderRadius.circular(5)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset('assest/rupee1.png',scale: 2.5,width:25,),
                  const SizedBox(width: 8,),
                  Text('₹500 for two approx.',  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 12, color: Colors.white)),
                ],
              ),
              Row(
                children: [
                  Image.asset('assest/dish.png',scale: 1,width:25,),
                  const SizedBox(width: 8,),
                  Text('Multicuisine',  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 10, color: Colors.white)),
                ],
              ),
              Row(
                children: [
                  Image.asset('assest/clock.png',scale: 2,width:21,),
                  const SizedBox(width: 8,),
                  Text('Today, 11:00 AM - 11:00 PM',  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 10, color: Colors.white)),
                ],
              ),
              Row(
                children: [
                  Image.asset('assest/map.png',scale: 1,width:22,),
                  const SizedBox(width: 8,),
                  SizedBox(
                    width: 250,
                    child: Text('670.5 km away, Rajouri Garden Main Market, Rajouri Garden ',  style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 10, color: Colors.white)),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset('assest/diraction.png',scale: 1,width:20,),
                  const SizedBox(width: 8,),
                  Text('Get Directions',  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 10, color: const Color(0xFFFD2F71))),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Text('Reserve a table',style: GoogleFonts.poppins(textStyle: labelText)) ,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: 155,
              decoration: BoxDecoration(
                  color: const Color(0xFF141420),
                  borderRadius: BorderRadius.circular(5)
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.calendar_month_outlined,color: Colors.white,size: 20,),
                  Text('Today',  style: GoogleFonts.poppins(textStyle: cardTitle)),
                  const Icon(Icons.keyboard_arrow_down,color: Colors.white,size: 20,),
                ],
              ),
            ),
            Container(
              height: 50,
              width: 160,
              decoration: BoxDecoration(
                  color: const Color(0xFF434445),
                  borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.red)
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(Icons.people_outline_rounded,color: Colors.white,size: 20,),
                  Text('2 People',style: GoogleFonts.poppins(textStyle: cardTitle)),
                  const SizedBox(width: 0,),
                  const Icon(Icons.keyboard_arrow_down,color: Colors.white,size: 20,),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 42,
          child: Row(
            children: [
              const CircleAvatar(
                radius: 16,
                backgroundColor: Color(0xFF434445),
                child: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 18,),
              ),
              const SizedBox(width: 15,),
              Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx,i){
                  return Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      width: 80,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color(0xFFFD2F71),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.red)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('07:00 pm',  style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 12, color: Colors.white)),
                          Text('Confirmed',  style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 12, color: Colors.white)),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Text('Events',style: GoogleFonts.poppins(textStyle: cardTitle)),
        const SizedBox(height: 10.0),
        CarouselSlider(
          options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 16 / 10,
              enlargeCenterPage: true,
              enlargeFactor: 0.35,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              autoPlayCurve: Curves.fastOutSlowIn,
              // enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction:0.80,
              onPageChanged: (index, reason) {
                setState(() {
                  currentPos = index;});
              }),
          items:homeBanner. map((item) =>
              Padding(
                padding: const EdgeInsets.only(left:10,top:8.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      children: [
                        Image.asset(item,fit: BoxFit.fill,height: 260,width: 270,),
                        Positioned(
                            top: 10,
                            left: 10,
                            child: Row(
                              children: const [
                                Icon(Icons.favorite_sharp,color: Colors.red,size: 20,),
                                SizedBox(width: 4,),
                                Text('1.2k',style: cardTitle),
                              ],
                            )),
                      ],
                    )
                ),
              ),
          ).toList(),),
        const SizedBox(height: 15.0),
        Container(
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: const Color(0xFFFD2F71),
              borderRadius: BorderRadius.circular(5),
          ),
          child: Text('Reserve Table',  style: GoogleFonts.poppins(textStyle: buttonText)),
        ),
        const SizedBox(height: 15.0),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
          decoration: BoxDecoration(
            color: const Color(0xFF1F1E2E),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: appColor),
          ),
          child: Column(
            children: [
              Container(
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFEBF1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text('PRTYWT-PAY',  style: GoogleFonts.poppins(textStyle: cardRupeeRed)),
              ),
              const SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => const AddOnMeal(),));
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AddOnFirst(),));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: appColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text('Instant discount', style: GoogleFonts.poppins(textStyle: buttonText)),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const instantPay()));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text('Free Add On',  style: GoogleFonts.poppins(textStyle: buttonText)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              Container(
                alignment: Alignment.center,
                height:height*0.2,
                child: SizedBox(
                  width: 200,
                  child:SfRadialGauge(
                      enableLoadingAnimation: true, //show meter pointer movement while loading
                      animationDuration: 400, //pointer movement speed
                      axes: <RadialAxis>[
                        RadialAxis(
                            minimum: 0,
                            maximum: 150,
                            ranges: <GaugeRange>[
                              GaugeRange(startValue: 0, endValue: 50, color:Colors.green),
                              GaugeRange(startValue: 50,endValue: 100,color: Colors.orange),
                              GaugeRange(startValue: 100,endValue: 150,color: Colors.red),
                            ],
                            pointers:  const <GaugePointer>[
                              /// pointer dynamic value
                              NeedlePointer(
                                value: 90,
                                needleColor: Colors.white,
                                needleEndWidth: 5,
                                knobStyle: KnobStyle(color: Colors.deepOrange,borderColor: Colors.lightBlue,),
                              )
                            ],
                            annotations: const <GaugeAnnotation>[
                              GaugeAnnotation(
                                  widget: Text('',style: TextStyle(fontSize: 0,fontWeight:FontWeight.bold,color: Colors.white)),
                                  angle: 90,
                                  positionFactor: 0.5),
                            ]
                        )
                      ]
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Total Bill",style: fillText),
                  Text("₹ 1800/-",style: fillText),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 15.0),
        Container(
          width: 80,
          padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFF1F1E2E),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  children: [
                    const SizedBox(width: 5,),
                    Image.asset('assest/clock.png',scale: 4,),
                    const SizedBox(width: 15,),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('View all Deals/Offers',  style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 14, color: Colors.white)),
                          Text('It is a long established fact that a reader will be distracted by the readable content?',  style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 9, color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
             const Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,size: 18,),
              const SizedBox(width: 3,),
            ],
          ),
        ),
        const SizedBox(height: 15.0),
        Container(
          width: 80,
          padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFF1F1E2E),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  children: [
                    const SizedBox(width: 5,),
                    Image.asset('assest/rest.png',scale: 4,),
                    const SizedBox(width: 15,),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('View Order at the table',  style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 14, color: Colors.white)),
                          Text('It is a long established fact that a reader will be distracted by the readable content?',  style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 9, color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
             const Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,size: 18,),
              const SizedBox(width: 3),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Text('Features',style: GoogleFonts.poppins(textStyle: cardTitle)) ,
        const SizedBox(height: 10.0),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 15,bottom: 5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFF1F1E2E),
            borderRadius: BorderRadius.circular(5),
          ),
          child:Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset('assest/air-conditioner.png',scale: 4,),
                          const SizedBox(width: 18,),
                          Text('Air Condition',  style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 10, color: Colors.white)),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          Image.asset('assest/keys.png',scale: 4,),
                          const SizedBox(width: 18,),
                          Text('Valet Parking',  style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 10, color: Colors.white)),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(width: 5,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset('assest/band1.png',scale: 4,),
                          const SizedBox(width: 18,),
                          Text('Live Music',  style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 10, color: Colors.white)),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          Image.asset('assest/barb.png',scale: 4,),
                          const SizedBox(width: 18,),
                          Text('Barbeque, Kebabs',  style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 10, color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Text('Read all',  style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 10, color: const Color(0xFFFD2F71))),
                  ),
                ],
              )
            ],
          ) ,
        ),
        const SizedBox(height: 10.0),
        Text('User Rating & Reviews Summary',  style: GoogleFonts.poppins(textStyle: labelText)),
        const SizedBox(height: 10.0),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 15,bottom: 10,left: 15,right: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFF1F1E2E),
            borderRadius: BorderRadius.circular(5),
          ),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('4.5',  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 30, color: Colors.white)),
                  const SizedBox(width: 5,),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RatingBar.builder(
                        initialRating:5,
                        minRating: 1,
                        itemSize: 10,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 1.0,),
                        itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber,size: 1,),
                        onRatingUpdate: (rating) {
                        },
                      ),
                      Text('10 reviews',  style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 10, color: const Color(0xFFFD2F71))),
                    ],
                  ),
                ],
              ),
              const SizedBox(height:8,),
              Text('86 Rank amongst clubs in Delhi',  style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 10, color: Colors.white)),
              const SizedBox(height:10,),
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Ambience',  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10, color: Colors.white)),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child:  Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: SfLinearGauge(
                              useRangeColorForAxis: true,
                                minimum: 0.0,
                                maximum: 5.0,
                                animateRange: true,
                                orientation: LinearGaugeOrientation.horizontal,
                                showLabels: false,
                                interval: 0,
                                barPointers: const [LinearBarPointer(value: 4.8,
                                  color: Color(0xFFFE005B),
                                  edgeStyle: LinearEdgeStyle.bothCurve,
                                ),],
                                axisTrackStyle: const LinearAxisTrackStyle(

                                    color: Colors.white,
                                    edgeStyle: LinearEdgeStyle.bothCurve,
                                    thickness: 4.0,
                                )),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Text('4.8',  style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 10, color: Colors.white)),

                      ],
                    ),
    ),


                ],
              ),
              const SizedBox(height:8,),
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Food',  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10, color: Colors.white)),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child:  Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: SfLinearGauge(
                                useRangeColorForAxis: true,
                                minimum: 0.0,
                                maximum: 5.0,
                                animateRange: true,
                                orientation: LinearGaugeOrientation.horizontal,
                                showLabels: false,
                                interval: 0,
                                barPointers: const [LinearBarPointer(value: 4.5,
                                  color: Color(0xFFFE005B),
                                  edgeStyle: LinearEdgeStyle.bothCurve,
                                ),],
                                axisTrackStyle: const LinearAxisTrackStyle(

                                  color: Colors.white,
                                  edgeStyle: LinearEdgeStyle.bothCurve,
                                  thickness: 4.0,
                                )),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Text('4.5',  style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 10, color: Colors.white)),

                      ],
                    ),
                  ),


                ],
              ),
              const SizedBox(height:8,),
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hygiene',  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10, color: Colors.white)),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child:  Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: SfLinearGauge(
                                useRangeColorForAxis: true,
                                minimum: 0.0,
                                maximum: 5.0,
                                animateRange: true,
                                orientation: LinearGaugeOrientation.horizontal,
                                showLabels: false,
                                interval: 0,
                                barPointers: const [LinearBarPointer(value: 5.0,
                                  color: Color(0xFFFE005B),
                                  edgeStyle: LinearEdgeStyle.bothCurve,
                                ),],
                                axisTrackStyle: const LinearAxisTrackStyle(

                                  color: Colors.white,
                                  edgeStyle: LinearEdgeStyle.bothCurve,
                                  thickness: 4.0,
                                )),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Text('5.0',  style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 10, color: Colors.white)),

                      ],
                    ),
                  ),


                ],
              ),
              const SizedBox(height:8,),
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Music',  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10, color: Colors.white)),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child:  Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: SfLinearGauge(
                                useRangeColorForAxis: true,
                                minimum: 0.0,
                                maximum: 5.0,
                                animateRange: true,
                                orientation: LinearGaugeOrientation.horizontal,
                                showLabels: false,
                                interval: 0,
                                barPointers: const [LinearBarPointer(value: 5.0,
                                  color: Color(0xFFFE005B),
                                  edgeStyle: LinearEdgeStyle.bothCurve,
                                ),],
                                axisTrackStyle: const LinearAxisTrackStyle(

                                  color: Colors.white,
                                  edgeStyle: LinearEdgeStyle.bothCurve,
                                  thickness: 4.0,
                                )),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Text('5.0',  style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 10, color: Colors.white)),

                      ],
                    ),
                  ),


                ],
              ),
              const SizedBox(height:8,),
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Pricing',  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10, color: Colors.white)),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child:  Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: SfLinearGauge(
                                useRangeColorForAxis: true,
                                minimum: 0.0,
                                maximum: 5.0,
                                animateRange: true,
                                orientation: LinearGaugeOrientation.horizontal,
                                showLabels: false,
                                interval: 0,
                                barPointers: const [LinearBarPointer(value: 3.5,
                                  color: Color(0xFFFE005B),
                                  edgeStyle: LinearEdgeStyle.bothCurve,
                                ),],
                                axisTrackStyle: const LinearAxisTrackStyle(

                                  color: Colors.white,
                                  edgeStyle: LinearEdgeStyle.bothCurve,
                                  thickness: 4.0,
                                )),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Text('3.5',  style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 10, color: Colors.white)),

                      ],
                    ),
                  ),


                ],
              ),
              const SizedBox(height:8,),
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Service',  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10, color: Colors.white)),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child:  Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: SfLinearGauge(
                                useRangeColorForAxis: true,
                                minimum: 0.0,
                                maximum: 5.0,
                                animateRange: true,
                                orientation: LinearGaugeOrientation.horizontal,
                                showLabels: false,
                                interval: 0,
                                barPointers: const [LinearBarPointer(value: 4.4,
                                  color: Color(0xFFFE005B),
                                  edgeStyle: LinearEdgeStyle.bothCurve,
                                ),],
                                axisTrackStyle: const LinearAxisTrackStyle(

                                  color: Colors.white,
                                  edgeStyle: LinearEdgeStyle.bothCurve,
                                  thickness: 4.0,
                                )),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Text('4.4',  style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 10, color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ) ,
        ),
        const SizedBox(height: 10.0),
        Text('Recommended Club',  style: GoogleFonts.poppins(textStyle: labelText)),
        const SizedBox(height: 10.0),
        SizedBox(
          height: height/7.2,
          width: width,
          child: ListView.builder(
              physics:const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Stack(
                        children: [
                          Image.asset("assest/hotal1.png",height: height/9.9,width: width/2.9,fit: BoxFit.fill,),
                          Positioned(
                              top: 10,
                              left: 10,
                              child: Column(
                                children: const [
                                  Text("Barbeque \nNation",style: cardTitle,),
                                  // Text("OFF",style: boldText,),
                                ],
                              )),
                          Positioned(
                              right: 10,
                              bottom: 10,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 1.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0)
                                ),
                                child: const Text("4.5",),
                              )),
                        ],
                      ),
                    ),
                  ],
                );
            }
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          width: 80,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFFFD2F71),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text('Write a Review',  style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 14, color: Colors.white)),
        ),
        const SizedBox(height: 10.0),
        Container(
          width: 80,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFF141420 ),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: const Color(0xFFFD2F71) )
          ),
          child: Text('See All Reviews',  style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 14, color: Colors.white)),
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Photos',style: GoogleFonts.poppins(textStyle: labelText)),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFFD2F71)),
                borderRadius: BorderRadius.circular(30)
              ),
              child: Row(
                  children: [
                    const Icon(Icons.cloud_download_outlined,color: Color(0xFFFD2F71),size: 18,),
                    const SizedBox(width: 3,),
                    Text('Upload photos',  style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 10, color: Colors.white)),
                  ],
              ),
            )
          ],
        ),
        const SizedBox(height: 10.0),
        Container(
          width: 80,
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFF1F1E2E),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  children: [
                    const SizedBox(width: 10,),
                    Image.asset('assest/image.png',width: 45,height: 45,fit: BoxFit.fill,),
                    const SizedBox(width: 15,),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0,right: 10,top: 8,bottom: 8),
                        child: Text('Share photos it across our digital & Platform',  style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14, color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Text('Similar Clubs',  style: GoogleFonts.poppins(textStyle: labelText)),
        const SizedBox(height: 10.0),
        SizedBox(
          height: 200,
          child: ListView(
            shrinkWrap: true,
            physics:const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.asset("assest/mask1.png",width: 116,height: 110,fit: BoxFit.fill),
                      ),
                      Positioned(
                          bottom: 7,
                          right: 10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2.0),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            child: const Text("4.5",style: textHint),
                          ))
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  const Text("Castle Barbeque",style: appBarText,textAlign: TextAlign.center),
                  const SizedBox(height: 2.0),
                  const Text("Delhi Aerocity, AeroCity",style: cardSubtitle,textAlign: TextAlign.center,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assest/offer.png',fit: BoxFit.fill,height: 30,width: 30,),
                      const Text("50% OFF ",style: redText,)
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.asset("assest/Mask2.png",width: 116,height: 110,fit: BoxFit.fill),
                      ),
                      Positioned(
                          bottom: 7,
                          right: 10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2.0),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            child: const Text("4.5",style: textHint),
                          ))
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  const Text("Castle Barbeque",style: appBarText,textAlign: TextAlign.center),
                  const SizedBox(height: 2.0),
                  const Text("Delhi Aerocity, AeroCity",style: cardSubtitle,textAlign: TextAlign.center,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assest/offer.png',fit: BoxFit.fill,height: 30,width: 30,),
                      const Text("50% OFF ",style: redText,)
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.asset("assest/Mask3.png",width: 116,height: 110,fit: BoxFit.fill),
                      ),
                      Positioned(
                          bottom: 7,
                          right: 10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2.0),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            child: const Text("4.5",style: textHint),
                          ))
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  const Text("Castle Barbeque",style: appBarText,textAlign: TextAlign.center),
                  const SizedBox(height: 2.0),
                  const Text("Delhi Aerocity, AeroCity",style: cardSubtitle,textAlign: TextAlign.center,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assest/offer.png',fit: BoxFit.fill,height: 30,width: 30,),
                      const Text("50% OFF ",style: redText,)
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        // Container(
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        //     child: Stack(
        //       children: [
        //         Image.asset('assest/club1.png',fit: BoxFit.fill,height: 190),
        //         Positioned(
        //             top: 0,
        //             right: 0,
        //             child: Image.asset("assest/guest logo.png",width: 50,height: 50,fit: BoxFit.contain)),
        //         Positioned(
        //             top: 0,
        //             left: 0,
        //             bottom: 0,
        //             right: 0,
        //             child: Column(
        //               children: [
        //                 const SizedBox(height: 18.0),
        //                 Text('Castle Barbeque',style:
        //                 GoogleFonts.robotoMono(textStyle: boldText)),
        //                 const SizedBox(height: 8.0),
        //                 Container(
        //                   alignment: Alignment.center,
        //                   height: 70,
        //                   width: 70,
        //                   decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(100),
        //                     border: Border.all(color: Colors.white),
        //                   ),
        //                   child: Column(
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     children: const [
        //                       Text("UP TO",style: cardSubtitle),
        //                       Text("40%",style: bannerTitle),
        //                       Text("OFF",style: cardSubtitle),
        //                     ],
        //                   ),
        //                 ),
        //                 const SizedBox(height: 8.0),
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                   children: const [
        //                     Text("Sunday",style: cardSubtitle),
        //                     Text("15.01.2023",style: cardSubtitle),
        //                     Text("8 pm Onwards",style: cardSubtitle),
        //                   ],
        //                 ),
        //                 const SizedBox(height: 8.0),
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children: const [
        //                     Icon(Icons.location_on,color: Colors.white,size: 14),
        //                     SizedBox(width: 10),
        //                     Text("4th Floor, Mall of India, Sector 18, Noida",style: cardSubtitle),
        //                   ],
        //                 ),
        //               ],
        //             )),
        //       ],
        //     )
        // ),
        const SizedBox(height: 70,),
      ],
    );
  }
  Deals(height,width){
    return  ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      children: [
        SizedBox(
          height: 55,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: Dealtype.length,
            itemBuilder: (c,i){
              var data =Dealtype[i];
              return  Padding(
                padding:  const EdgeInsets.all(5.0),
                child: InkWell(
                    onTap: (){
                      setState(() {
                        index =i;
                        Deal.clear();
                        homeApi().Dealapi(deal_typeId:Dealtype[i].id).then((value) {
                            setState((){
                              Deal=value.data!;
                            });
                          });
                      });
                    },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 10.0),
                    decoration: BoxDecoration(
                        border: Border.all(color:i==index? const Color(0xFFFD2F71):Colors.transparent ),
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: Text(data.name.toString(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 12, color:index==i? const Color(0xFFFD2F71):const Color(0xFFA3A3A3))),
                  ),
                ),
              );
            },
          ),
        ),
        Deal.isNotEmpty?
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount:Deal.length,
            itemBuilder: (context, index) {
              var data = Deal[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                      decoration: BoxDecoration(color: const Color(0xFF1F1E2E),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${data.bought} bought',style: GoogleFonts.poppins(textStyle: cardGreyText)),
                                SizedBox(
                                  width:140,
                                  child: Text(
                                      '${data.name}',
                                      overflow: TextOverflow.clip,
                                      softWrap: true,
                                      textScaleFactor: 1.1,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: Colors.white)
                                  ),
                                ),
                                const SizedBox(height: 3,),
                                Text('Free Cancellation',
                                    overflow: TextOverflow.clip,
                                    softWrap: true,
                                    textScaleFactor: 1.1,
                                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.green)
                                ),
                                const SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text('Valid on',
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 8,
                                                color: Colors.white)
                                        ),
                                        Text('Timing',
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 8,
                                                color: Colors.white)
                                        ),
                                        Text(
                                            'Valid for',
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400,
                                                fontSize:8,
                                                color: Colors.white)
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 25,),
                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('days',
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 8,
                                                color: Colors.white)
                                        ),
                                        Row(
                                          children: [
                                            Text('start time - end time',
                                                overflow: TextOverflow.clip,
                                                softWrap: true,
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 8,
                                                    color: Colors.white)
                                            ),
                                            const SizedBox(width: 4,),
                                            const Icon(Icons.arrow_drop_down_circle_outlined,color: Color(0xFF008AD8),size: 12,),
                                          ],
                                        ),
                                        Text('2 People',
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 8,
                                                color: Colors.white)
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5,),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap:(){
                                        setState(() {
                                          showDetails(context,data.inclusion);
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2.0),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(3),
                                            border: Border.all(color: Colors.blue)
                                        ),
                                        child:
                                        Text('Inclusions', style: GoogleFonts.poppins(textStyle: cardBlueText)),
                                      ),
                                    ),
                                    const SizedBox(width: 8,),
                                    InkWell(
                                      onTap:(){
                                        setState(() {
                                          showDetails(context,data.detail);
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2.0),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(3),
                                            border: Border.all(color: Colors.blue)
                                        ),
                                        child: Text('Details',style: GoogleFonts.poppins(textStyle: cardBlueText)),
                                      ),
                                    ),
                                    const SizedBox(width: 8,),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3),
                                          border: Border.all(color: Colors.blue)
                                      ),
                                      child: Text('Venue',style: GoogleFonts.poppins(textStyle: cardBlueText)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('MSP- ${data.maxPrice}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 8,
                                        color: Colors.white)
                                ),
                                const SizedBox(height: 5,),
                                Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height:height*0.1,
                                      child: SizedBox(
                                        width: 45,
                                        child:SfRadialGauge(
                                            enableLoadingAnimation: true, //show meter pointer movement while loading
                                            animationDuration: 400, //pointer movement speed
                                            axes: <RadialAxis>[ //Radial Guage Axix, use other Guage type here
                                              RadialAxis(
                                                  minimum: double.parse( data.minPrice.toString()),maximum: double.parse( data.maxPrice.toString()),
                                                  ranges: <GaugeRange>[ //Guage Ranges
                                                    GaugeRange(startValue: double.parse( data.minPrice.toString()),
                                                        endValue: double.parse( data.minPrice.toString())+(double.parse(data.maxPrice.toString())-double.parse(data.minPrice.toString()))/3,
                                                        color: const Color(0xFF7AFF77),
                                                        startWidth: 10,endWidth: 10),
                                                    GaugeRange(startValue: double.parse( data.minPrice.toString())+(double.parse(data.maxPrice.toString())-double.parse(data.minPrice.toString()))/3,
                                                        endValue: double.parse( data.maxPrice.toString())-(double.parse(data.maxPrice.toString())-double.parse(data.minPrice.toString()))/3,
                                                        color: const Color(0xFF6DFFCF),startWidth: 10,endWidth: 10),
                                                    GaugeRange(startValue: double.parse( data.maxPrice.toString())-(double.parse(data.maxPrice.toString())-double.parse(data.minPrice.toString()))/3,
                                                        endValue: double.parse( data.maxPrice.toString()),color: const Color(0xFF07BAFE),startWidth: 10,endWidth: 10)
                                                  ],

                                                  pointers:  <GaugePointer>[
                                                    /// pointer dynamic value
                                                    NeedlePointer(
                                                      value:double.parse( data.livePrice.toString()),
                                                      needleColor: Colors.white,
                                                      needleEndWidth: 5,
                                                      knobStyle: const KnobStyle(color: Colors.deepOrange,borderColor: Colors.lightBlue,),
                                                    )
                                                  ],
                                                  annotations: const <GaugeAnnotation>[
                                                    GaugeAnnotation(
                                                        widget: Text('',style: TextStyle(fontSize: 0,fontWeight:FontWeight.bold,color: Colors.white)),
                                                        angle: 90,
                                                        positionFactor: 0.5),
                                                    //add more annotations 'texts inside guage' here
                                                  ]
                                              )]
                                        ),
                                      ),
                                    ),
                                    Text("₹${data.livePrice}",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Colors.white),),
                                  ],
                                ),
                                Text("Inc. of all taxes",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 9,color: Colors.white.withOpacity(0.6)),),
                                const SizedBox(height: 3,),
                                InkWell(
                                  onTap: (){},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 5.0),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFAE3C23),
                                        borderRadius: BorderRadius.circular(2)
                                    ),
                                    child: Text('Add +'  ,
                                        style: GoogleFonts.poppins(textStyle: cardSubtitle)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
              );
            }) :
        Container(),
        const Divider(height: 0.1,color: Colors.grey),
        const SizedBox(height: 10.0),
        Text('Promo Codes for Extra savings',style: GoogleFonts.poppins(textStyle: labelText)),
        const SizedBox(height: 10.0),
        SizedBox(
          height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: 2,
              itemBuilder: (Cot,i){
              return   Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Image.asset('assest/off.png',fit: BoxFit.fill,height: 150,width: 300,),
              );
            },
            )),
        const SizedBox(height: 10.0),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                Image.asset('assest/club1.png',fit: BoxFit.fill,height: 190),
                Positioned(
                    top: 0,
                    right: 0,
                    child: Image.asset("assest/guest logo.png",width: 50,height: 50,fit: BoxFit.contain)),
                Positioned(
                    top: 0,
                    left: 0,
                    bottom: 0,
                    right: 0,
                    child: Column(
                      children: [
                        const SizedBox(height: 18.0),
                        Text('Castle Barbeque',style:
                        GoogleFonts.robotoMono(textStyle: boldText)),
                        const SizedBox(height: 8.0),
                        Container(
                          alignment: Alignment.center,
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("UP TO",style: cardSubtitle),
                              Text("40%",style: bannerTitle),
                              Text("OFF",style: cardSubtitle),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text("Sunday",style: cardSubtitle),
                            Text("15.01.2023",style: cardSubtitle),
                            Text("8 pm Onwards",style: cardSubtitle),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.location_on,color: Colors.white,size: 14),
                            SizedBox(width: 10),
                            Text("4th Floor, Mall of India, Sector 18, Noida",style: cardSubtitle),
                          ],
                        ),
                      ],
                    )),
              ],
            )
        ),
        const SizedBox(height: 20,),
      ],
    );
  }
  Order(height,width){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
            child: Row(
              children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      selectitem=0;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 3),
                    decoration: BoxDecoration(
                        border: Border.all(color: selectitem==0? const Color(0xFFFD2F71):Colors.transparent),
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: Text('Food \nMenu',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: selectitem==0?
                            const Color(0xFFFD2F71):
                            const Color(0xFFA3A3A3))),
                  ),
                ),
                const SizedBox(width: 25,),
                InkWell(
                  onTap: (){
                    setState(() {
                      selectitem=1;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 3),
                    decoration: BoxDecoration(
                        border: Border.all(color: selectitem==1?
                        const Color(0xFFFD2F71):
                        Colors.transparent),
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: Text('Bar \nMenu ',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                            color: selectitem==1?
                            const Color(0xFFFD2F71):
                            const Color(0xFFA3A3A3))),
                  ),
                ),
                const SizedBox(width: 25,),
                InkWell(
                  onTap: (){
                    setState(() {
                      selectitem=2;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 3),
                    decoration: BoxDecoration(
                        border: Border.all(color: selectitem==2?const Color(0xFFFD2F71):Colors.transparent),
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: Text('Jump start \nMenu',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                            color: selectitem==2?
                            const Color(0xFFFD2F71):
                            const Color(0xFFA3A3A3))),

                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: IconButton(onPressed: (){},padding: const EdgeInsets.all(2),
                    icon: Image.asset('assest/updown.png',width: 15,)
                ),
              ),
              const SizedBox(width: 10,),
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: IconButton(onPressed: (){},
                    padding: const EdgeInsets.all(2),
                    icon: Image.asset('assest/filter.png',width: 15,)
                ),
              ),
              const SizedBox(width: 20,),
            ],
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
          //   child: SizedBox(
          //     height: 70,
          //     child: ListView.builder(
          //         physics: const ScrollPhysics(),
          //         itemCount: PdfReaderdata.length,
          //         itemBuilder: (c,i){
          //           return GestureDetector(
          //             onTap: ()async{
          //             // //  Loading().onLoading();
          //             //   final url = Api_link.imageUrl+PdfReaderdata[i].file.toString();
          //             //   final file = await PdfView.loadNetwork(url);
          //             //   PdfView.openPDF(context, file,PdfReaderdata[i].file.toString().split("/").last);
          //             //   // setState(() {
          //             //   //   Loading().onDone();
          //             //   // });
          //             },
          //             child: Container(
          //               alignment: Alignment.center,
          //               width: 140,
          //               height: 50.0,
          //               decoration: boxDecoration(),
          //               child: Text('View Menu',style: GoogleFonts.poppins(textStyle: buttonText)),
          //             ),
          //           );
          //         }),
          //   ),
          // ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
            child: SizedBox(
              height: height/3,
              child: ListView.builder(
                physics: const ScrollPhysics(),
                  itemCount: PdfReaderdata.length,
                  itemBuilder: (c,i){
                return SizedBox(
                  width:double.infinity,
                  height: height/3,
                  child: const PDF(
                      swipeHorizontal: true,
                      enableSwipe: true
                  ).cachedFromUrl(Api_link.imageUrl+PdfReaderdata[i].file.toString(),
                    placeholder: (progress) => Center(
                      child: Text("Loading - $progress %"),
                    ),
                    errorWidget: (error) => const Center(
                      child: Text("An error occurred while opening bill PDF"),
                    ),
                  ),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0,top :15,bottom: 15),
            child: Text('Promo Codes for Extra savings',  style: GoogleFonts.poppins(textStyle: labelText)),
          ),
          SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                padding: const EdgeInsets.only(left: 20,),
                itemBuilder: (Cot,i){
                  return   Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Image.asset('assest/off.png',fit: BoxFit.fill,height: 150,width: 300,),
                  );
                },
              )),
          Padding(
            padding: const EdgeInsets.only(left:20,top:25.0,right: 20),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  children: [
                    Image.asset('assest/club1.png',fit: BoxFit.fill,height: 190),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: Image.asset("assest/guest logo.png",width: 50,height: 50,fit: BoxFit.contain)),
                    Positioned(
                        top: 0,
                        left: 0,
                        bottom: 0,
                        right: 0,
                        child: Column(
                          children: [
                            const SizedBox(height: 18.0),
                            Text('Castle Barbeque',style:
                            GoogleFonts.robotoMono(textStyle: boldText)),
                            const SizedBox(height: 8.0),
                            Container(
                              alignment: Alignment.center,
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(color: Colors.white),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("UP TO",style: cardSubtitle),
                                  Text("40%",style: bannerTitle),
                                  Text("OFF",style: cardSubtitle),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text("Sunday",style: cardSubtitle),
                                Text("15.01.2023",style: cardSubtitle),
                                Text("8 pm Onwards",style: cardSubtitle),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.location_on,color: Colors.white,size: 14),
                                SizedBox(width: 10),
                                Text("4th Floor, Mall of India, Sector 18, Noida",style: cardSubtitle),
                              ],
                            ),
                          ],
                        )),
                  ],
                )
            ),
          ),
          const SizedBox(height: 70,),
        ],
      ),
    );
  }
  Review(width){
    return  ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      children: [
        Text('User Rating & Reviews Summary',  style: GoogleFonts.poppins(textStyle: labelText)),
        const SizedBox(height:10),
        Container(
          padding: const EdgeInsets.only(top: 15,bottom: 10,left: 15,right: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFF1F1E2E),
            borderRadius: BorderRadius.circular(5),
          ),
          child:Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('4.5',  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 30, color: Colors.white)),
                  const SizedBox(width: 5,),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RatingBar.builder(
                        initialRating:5,
                        minRating: 1,
                        itemSize: 14,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 1.0,),
                        itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber,size: 1,),
                        onRatingUpdate: (rating) {
                          //print(rating);
                        },
                      ),
                      Text('10 reviews',  style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 8, color: const Color(0xFFFD2F71))),
                    ],
                  ),
                ],
              ),
              const SizedBox(height:8,),
              Text('86 Rank amongst clubs in Delhi',  style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 10, color: Colors.white)),
              const SizedBox(height:10,),
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Ambience',  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10, color: Colors.white)),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child:  Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: SfLinearGauge(
                                useRangeColorForAxis: true,
                                minimum: 0.0,
                                maximum: 5.0,
                                animateRange: true,
                                orientation: LinearGaugeOrientation.horizontal,
                                showLabels: false,
                                interval: 0,
                                barPointers: const [LinearBarPointer(value: 4.8,
                                  color: Color(0xFFFE005B),
                                  edgeStyle: LinearEdgeStyle.bothCurve,
                                ),],
                                axisTrackStyle: const LinearAxisTrackStyle(

                                  color: Colors.white,
                                  edgeStyle: LinearEdgeStyle.bothCurve,
                                  thickness: 4.0,
                                )),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Text('4.8',  style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 10, color: Colors.white)),

                      ],
                    ),
                  ),


                ],
              ),
              const SizedBox(height:8,),
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Food',  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10, color: Colors.white)),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child:  Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: SfLinearGauge(
                                useRangeColorForAxis: true,
                                minimum: 0.0,
                                maximum: 5.0,
                                animateRange: true,
                                orientation: LinearGaugeOrientation.horizontal,
                                showLabels: false,
                                interval: 0,
                                barPointers: const [LinearBarPointer(value: 4.5,
                                  color: Color(0xFFFE005B),
                                  edgeStyle: LinearEdgeStyle.bothCurve,
                                ),],
                                axisTrackStyle: const LinearAxisTrackStyle(

                                  color: Colors.white,
                                  edgeStyle: LinearEdgeStyle.bothCurve,
                                  thickness: 4.0,
                                )),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Text('4.5',  style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 10, color: Colors.white)),

                      ],
                    ),
                  ),


                ],
              ),
              const SizedBox(height:8,),
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hygiene',  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10, color: Colors.white)),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child:  Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: SfLinearGauge(
                                useRangeColorForAxis: true,
                                minimum: 0.0,
                                maximum: 5.0,
                                animateRange: true,
                                orientation: LinearGaugeOrientation.horizontal,
                                showLabels: false,
                                interval: 0,
                                barPointers: const [LinearBarPointer(value: 5.0,
                                  color: Color(0xFFFE005B),
                                  edgeStyle: LinearEdgeStyle.bothCurve,
                                ),],
                                axisTrackStyle: const LinearAxisTrackStyle(

                                  color: Colors.white,
                                  edgeStyle: LinearEdgeStyle.bothCurve,
                                  thickness: 4.0,
                                )),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Text('5.0',  style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 10, color: Colors.white)),

                      ],
                    ),
                  ),


                ],
              ),
              const SizedBox(height:8,),
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Music',  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10, color: Colors.white)),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child:  Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: SfLinearGauge(
                                useRangeColorForAxis: true,
                                minimum: 0.0,
                                maximum: 5.0,
                                animateRange: true,
                                orientation: LinearGaugeOrientation.horizontal,
                                showLabels: false,
                                interval: 0,
                                barPointers: const [LinearBarPointer(value: 5.0,
                                  color: Color(0xFFFE005B),
                                  edgeStyle: LinearEdgeStyle.bothCurve,
                                ),],
                                axisTrackStyle: const LinearAxisTrackStyle(

                                  color: Colors.white,
                                  edgeStyle: LinearEdgeStyle.bothCurve,
                                  thickness: 4.0,
                                )),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Text('5.0',  style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 10, color: Colors.white)),

                      ],
                    ),
                  ),


                ],
              ),
              const SizedBox(height:8,),
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Pricing',  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10, color: Colors.white)),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child:  Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: SfLinearGauge(
                                useRangeColorForAxis: true,
                                minimum: 0.0,
                                maximum: 5.0,
                                animateRange: true,
                                orientation: LinearGaugeOrientation.horizontal,
                                showLabels: false,
                                interval: 0,
                                barPointers: const [LinearBarPointer(value: 3.5,
                                  color: Color(0xFFFE005B),
                                  edgeStyle: LinearEdgeStyle.bothCurve,
                                ),],
                                axisTrackStyle: const LinearAxisTrackStyle(

                                  color: Colors.white,
                                  edgeStyle: LinearEdgeStyle.bothCurve,
                                  thickness: 4.0,
                                )),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Text('3.5',  style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 10, color: Colors.white)),

                      ],
                    ),
                  ),


                ],
              ),
              const SizedBox(height:8,),
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Service',  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10, color: Colors.white)),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child:  Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: SfLinearGauge(
                                useRangeColorForAxis: true,
                                minimum: 0.0,
                                maximum: 5.0,
                                animateRange: true,
                                orientation: LinearGaugeOrientation.horizontal,
                                showLabels: false,
                                interval: 0,
                                barPointers: const [LinearBarPointer(value: 4.4,
                                  color: Color(0xFFFE005B),
                                  edgeStyle: LinearEdgeStyle.bothCurve,
                                ),],
                                axisTrackStyle: const LinearAxisTrackStyle(
                                  color: Colors.white,
                                  edgeStyle: LinearEdgeStyle.bothCurve,
                                  thickness: 4.0,
                                )),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Text('4.4',  style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 10, color: Colors.white)),

                      ],
                    ),
                  ),


                ],
              ),
            ],
          ) ,
        ),
        const SizedBox(height:10),
        Container(
          width: 80,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFFFD2F71),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text('Write a Review',  style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 14, color: Colors.white)),
        ),
        const SizedBox(height:10),
        Container(
          decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(5),
              color: const Color(0xFF1F1E2E)
          ),
          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 12),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color(0xFFFFCF41),
                        radius: 20,
                        child: Icon(Icons.person),
                      ),
                      const SizedBox(width: 8,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Adword',  style: GoogleFonts.poppins(textStyle: cardTitle)),
                          Text('2 reviews, 2 visits',  style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 8, color: Colors.white)),
                        ],
                      )
                    ],
                  ),
                  Text('14 hours ago',  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 8, color: Colors.white)),
                ],
              ),
              const SizedBox(height: 8,),
              Row(
                children: [
                  Text('5.0',  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 21, color: Colors.white)),
                  const SizedBox(width: 5,),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RatingBar.builder(
                        initialRating:5,
                        minRating: 1,
                        itemSize: 16,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 1.0,),
                        itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber,size: 1,),
                        onRatingUpdate: (rating) {
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 5,),
              Row(
                children: [
                  Container(
                    padding:  const EdgeInsets.symmetric(vertical: 5,horizontal: 6),
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFFFD2F71))
                    ),
                      child: Text('Ambience',  style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 9, color: Colors.white)),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    padding:  const EdgeInsets.symmetric(vertical: 5,horizontal: 6),
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFFFD2F71))
                    ),
                      child: Text('Service',  style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 9, color: Colors.white)),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    padding:  const EdgeInsets.symmetric(vertical: 5,horizontal: 6),
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFFFD2F71))
                    ),
                      child: Text('Food',  style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 9, color: Colors.white)),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    padding:  const EdgeInsets.symmetric(vertical: 5,horizontal: 6),
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFFFD2F71))
                    ),
                      child: Text('Hygiene',  style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 9, color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(height: 12,),
              Text('Recommended dishes',  style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 9, color: Colors.white)),
              const SizedBox(height: 8,),
              Text('starters',  style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 9, color: Colors.white)),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Future showDetails(context,terms){
    return showDialog(
        barrierColor: Colors.black.withOpacity(0.8),
        useSafeArea:true ,
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: Colors.black,
            width: double.infinity,
            padding: const EdgeInsets.only(bottom: 130),
            child:Padding(
              padding: const EdgeInsets.only(top:30.0,left: 20,right: 20),
              child: Card(
                color: const Color(0xFF1F1E2E),
                elevation: 4,
                child:ListView(
                    children: [
                      const SizedBox(height: 15,),
                      // Text('Term & Conditions',
                      //     textAlign: TextAlign.center,
                      //     style:TextStyles.timerDot
                      // ),
                      const SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: HtmlWidget(terms,textStyle: const TextStyle(color: Colors.white)),
                      ),
                    ] ),
              ),
            ),
          );
        });
  }

  AnimatedSmoothIndicator buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: currentPos,
      count: listPaths.length,
      effect: ScrollingDotsEffect(
        activeStrokeWidth: 2.6,
        activeDotScale: 1.3,
        maxVisibleDots: 5,
        radius: 8,
        spacing: 8,
        dotHeight: 8,
        dotWidth: 8,
        dotColor: Colors.grey.shade600,
        activeDotColor: Colors.white,
      ),
    );
  }
}