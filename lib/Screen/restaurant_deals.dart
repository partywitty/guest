// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Utils/Styles.dart';


class Restaurant_deals  extends StatefulWidget {
  const Restaurant_deals({Key? key}) : super(key: key);

  @override
  State<Restaurant_deals> createState() => Restaurant_dealsState();
}

class Restaurant_dealsState extends State<Restaurant_deals> {
  ScrollController scrollController=ScrollController();

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
      appBar: AppBar(
        backgroundColor: const Color(0xFf141420),
        title: Text("Restaurant deals",style: GoogleFonts.poppins(textStyle: appBarText),),
      ),
      body: ListView(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          children:[
            const SizedBox(height: 5.0),
            SizedBox(
              height: 100,
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 15),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: [
                  Container(
                    height: 80,
                    width: 90,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color(0xFF1F1E2E),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width:40,
                            height:40,
                            child: Image.asset("assest/meggi.png")),
                        const SizedBox(height: 3,),
                        const Text('Oriental', textAlign: TextAlign.center, style: cardSubtitle),
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    width: 90,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color(0xFF1F1E2E),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width:40,
                            height:40,
                            child: Image.asset("assest/mughlai.png")),
                        const SizedBox(height: 3,),
                        const Text('Mughlai', textAlign: TextAlign.center, style: cardSubtitle),
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    width: 90,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color(0xFF1F1E2E),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width:40,
                            height:40,
                            child: Image.asset("assest/spaghetti.png")),
                        const SizedBox(height: 3,),
                        const Text('Italian', textAlign: TextAlign.center, style: cardSubtitle),
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    width: 90,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color(0xFF1F1E2E),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => Jump_start(),));
                          },
                          child: SizedBox(
                              width:40,
                              height:40,
                              child: Image.asset("assest/chicken-tandoori.png")),),
                        const SizedBox(height: 3,),
                        const Text('Tandoori', textAlign: TextAlign.center, style: cardSubtitle),
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    width: 90,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color(0xFF1F1E2E),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width:40,
                            height:40,
                            child: Image.asset("assest/tamal-de-olla.png")),
                        const SizedBox(height: 3,),
                        const Text('American', textAlign: TextAlign.center, style: cardSubtitle),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 240,
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
                                child: Image.asset('assest/party_img.png',fit: BoxFit.fill, height: 190,),
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
                                  child:Text('JOIN NOW',  style: GoogleFonts.poppins(
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
              padding: const EdgeInsets.only(left: 20.0,top: 10),
              child: Row(  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Restaurant deals / American",style: GoogleFonts.robotoSlab(textStyle:  bigTitle)),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset("assest/img.png",width: width,height: 150,fit: BoxFit.fill),
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset("assest/img.png",width: width,height: 150,fit: BoxFit.fill),
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset("assest/img.png",width: width,height: 150,fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 20.0),
              child: ClipRRect(
                child: Image.asset("assest/summer_img.png",width: width,height: 170,fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset("assest/img.png",width: width,height: 150,fit: BoxFit.fill),
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset("assest/img.png",width: width,height: 150,fit: BoxFit.fill),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20.0,top: 15 ,bottom: 10),
                  child: Text('Recommended Restaurant Deals',style:bigTitle),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0.0,right: 10.0,top: 15,bottom: 10),
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
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
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
                  child: Text('Coupon code for favorited',style:bigTitle),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0.0,top: 10,right: 10.0,bottom: 10),
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
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset("assest/img.png",width: width,height: 150,fit: BoxFit.fill),
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset("assest/img.png",width: width,height: 150,fit: BoxFit.fill),
              ),
            ),
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



