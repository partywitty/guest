// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:partywitty_guest/Screen/about.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Utils/Styles.dart';


class Club_deal extends StatefulWidget {
  const Club_deal({Key? key}) : super(key: key);

  @override
  State<Club_deal> createState() => Club_dealState();
}

class Club_dealState extends State<Club_deal> {
  ScrollController scrollController=ScrollController();
  var selectfood;
  List<String> listPaths = [
    "assest/live-music 1.png",
    "assest/dj_img.png",
    "assest/menu 1.png",
    "assest/deal 1.png",
    "assest/meals .png",
  ];


  int currentPos = 0;
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFf141420),
      body: ListView(
          children:[
            Container(
              height: 40  ,
              color: const Color(0xFF1F1E2E),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child:   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.menu,color: Colors.white,),
                        Image.asset("assest/logo.png",height: 20,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Near Tower Square", style: cardSubtitle),
                        Icon(Icons.arrow_drop_down,color: Colors.white,size: 24)
                      ],
                    ),
                    Row(
                      children: const [
                      Icon(Icons.search,color: Colors.white,size: 24),
                      SizedBox(width: 5.0),
                      Icon(Icons.notifications_none_sharp,color: Colors.white,size : 24),
                    ],)
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 21.0,top: 20,bottom:5),
              child: Text(' Best Club Deals',style:bigTitle),
            ),
            const SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    setState((){
                      selectfood='veg';
                    });
                  },
                  child: Container(
                    height: 70,
                    width: 140,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1F1E2E),
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(color: selectfood=='veg'?Colors.red:Colors.transparent)
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('  Veg   ',style: TextStyle(color:Colors.white,fontSize: 14,fontWeight: FontWeight.w400)),
                        Image.asset('assest/fresh_vegitable.png',scale: 4.2,)
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 25,),
                InkWell(
                  onTap: (){
                    setState((){
                      selectfood='nonveg';
                    });
                  },
                  child: Container(
                    height: 70,
                    width: 140,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1F1E2E),
                      borderRadius: BorderRadius.circular(3),
                        border: Border.all(color: selectfood=='nonveg'?Colors.red:Colors.transparent)
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(' Non-veg  ',style: TextStyle(color:Colors.white,fontSize: 14,fontWeight: FontWeight.w400)),
                        Image.asset('assest/istockphoto.png',scale: 4.2,)
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 250,
              width: width,
              child: ListView(
                physics: const ScrollPhysics(),
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        height: 210,
                        // height: MediaQuery.of(context).size.height * 0.30,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.26,
                        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        // enableInfiniteScroll: true,
                        autoPlayAnimationDuration: const Duration(milliseconds: 800),
                        viewportFraction:0.90,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentPos = index;});
                        }),
                    items:listPaths. map((item) =>
                        Padding(
                          padding: const EdgeInsets.only(left:10,top:8.0),
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.red,
                                ),
                                child: Image.asset('assest/party_img.png',fit: BoxFit.fill,height: 180,),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child:Container(
                                  width: 70,
                                  height: 22,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.only(left: 6,right: 5),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF919191),
                                    borderRadius: BorderRadius.circular(2),
                                    // gradient: LinearGradient(
                                    //   begin: FractionalOffset(0.1, 0.1),
                                    //   end: FractionalOffset(0.8, 0.1),
                                    //   colors: [Color(0xFFFE262F),Color(0xFFFD2F71),
                                    //   ],
                                    // ),
                                  ),
                                  child:Text('BUY NOW',  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10, color: Colors.white)) ,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ).toList(),),
                  Padding(
                      padding: const EdgeInsets.only(top: 5),
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,),
              child: Row(  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Club Deals / Non - Veg",style: GoogleFonts.robotoSlab(textStyle:  bigTitle)),
                  Row(
                    children: [
                      IconButton(onPressed: (){},
                          padding: const EdgeInsets.only(left: 8),
                          icon: const Icon(Icons.search,color:Colors.white,size: 20,)),
                      IconButton(onPressed: (){},
                          padding: const EdgeInsets.only(right: 10),
                          icon: Image.asset('assest/filter.png',scale: 4.5,))
                    ],
                  )
                ],
              ),
            ),
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                itemCount: 3,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const About(),));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(3.0),
                        child: Image.asset("assest/img.png",width: width,height: 150,fit: BoxFit.fill),
                      ),
                    ),
                  );
                },),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 20.0),
              child: ClipRRect(
                child: Image.asset("assest/summer_img.png",width: width,height: 170,fit: BoxFit.fill),
              ),
            ),
            const SizedBox(height: 10.0),
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              itemCount: 2,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const About(),));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3.0),
                      child: Image.asset("assest/img.png",width: width,height: 150,fit: BoxFit.fill),
                    ),
                  ),
                );
              },),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20.0,top: 15,bottom: 10),
                  child: Text('Recommended Deals ',style:bigTitle),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0.0,right: 20.0,top: 15,bottom: 10),
                  child: Text('View all',style:redTitle),
                ),
              ],
            ),
            SizedBox(
              width: width,
              height: 160,
              child: ListView.builder(
                  padding: const EdgeInsets.only(left: 20),
                  scrollDirection:Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (ctx,index){
                    return Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Image.asset('assest/music6.png',fit: BoxFit.fill,
                          width: 300,
                          height: 200),
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20.0,top: 15,bottom: 10),
                  child: Text('Coupon code for favorite',style:bigTitle),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0.0,top: 10,right: 20.0,bottom: 10),
                  child: Text('View all',style:redTitle),
                ),
              ],
            ),
            SizedBox(
              width: width,
              height: 160,
              child: ListView.builder(
                  padding: const EdgeInsets.only(left: 20),
                  scrollDirection:Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (ctx,index){
                    return Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Image.asset('assest/music6.png',fit: BoxFit.fill,
                          width: 250,
                          height: 150),
                    );
                  }),
            ),
            const SizedBox(height: 20.0),
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              itemCount: 2,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const About(),));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3.0),
                      child: Image.asset("assest/img.png",width: width,height: 150,fit: BoxFit.fill),
                    ),
                  ),
                );
              },),
            const SizedBox(height: 20.0),
          ] ),
    );
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



