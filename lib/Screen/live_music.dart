// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Utils/Styles.dart';

class Live_music_page extends StatefulWidget {
  const Live_music_page({Key? key}) : super(key: key);

  @override
  State<Live_music_page> createState() => Live_music_pageState();
}

class Live_music_pageState extends State<Live_music_page> {

  List<String> listPaths = [
    "assest/live-music 1.png",
    "assest/dj_img.png",
    "assest/menu 1.png",
    "assest/deal 1.png",
    "assest/meals .png",
  ];

  ScrollController scrollController=ScrollController();
  int currentPos = 0;
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFf141420),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Event",style: GoogleFonts.poppins(textStyle: appBarText),),
      ),
      body: ListView(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          children:[
            SizedBox(
              height: 100,
              child: ListView(
                shrinkWrap: true,
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
                            height: 40,
                            child: Image.asset("assest/live-music 1.png")),
                        const SizedBox(height: 2,),
                        const Text('Live \n music', textAlign: TextAlign.center, style: cardSubtitle),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      // Navigator.pushNamed(context,'/Live_music');
                    },
                    child: Container(
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
                              height: 40,
                              child: Image.asset("assest/nightlife.png")),
                          const SizedBox(height: 2,),
                          const Text('Special \n Nights', textAlign: TextAlign.center, style: cardSubtitle),
                        ],
                      ),
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
                            width:35,
                            height: 35,
                            child: Image.asset("assest/dance-floor.png")),
                        const SizedBox(height: 2,),
                        const Text('Dance \n Floor', textAlign: TextAlign.center, style: cardSubtitle),
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
                              height: 40,
                              child: Image.asset("assest/celebrity.png")),
                        ),
                        const SizedBox(height: 2,),
                        const Text('Celeb \n Night', textAlign: TextAlign.center, style: cardSubtitle),
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
                            height: 40,
                            child: Image.asset("assest/band.png")),
                        const SizedBox(height: 2,),
                        const Text('Band \n Night', textAlign: TextAlign.center, style: cardSubtitle),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
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
                        aspectRatio: 13 / 10,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.2,
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
                                child: Image.asset('assest/party_img.png',fit: BoxFit.fill,height: 200,),
                              ),
                              // Positioned(
                              //   bottom: 10,
                              //   left: 10,
                              //   child:Container(
                              //     width: 70,
                              //     height: 18,
                              //     alignment: Alignment.center,
                              //     padding: EdgeInsets.only(left: 6,right: 5),
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(2),
                              //       gradient: LinearGradient(
                              //         begin: FractionalOffset(0.1, 0.1),
                              //         end: FractionalOffset(0.8, 0.1),
                              //         colors: [Color(0xFFFE262F),Color(0xFFFD2F71),
                              //         ],
                              //       ),
                              //     ),
                              //     child:Text('JOIN NOW',  style: GoogleFonts.poppins(
                              //         fontWeight: FontWeight.w500,
                              //         fontSize: 10, color: Colors.white)) ,
                              //   ),
                              // ),
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
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
              child: Text("Band Night",style: GoogleFonts.robotoSlab(textStyle:  bigTitle)),
            ),
            Stack(
              children: [
                SizedBox(
                  height: 260,
                  child: Stack(
                    children: [
                      Image.asset("assest/pink.png",fit: BoxFit.fill,width: width,height: height/4),
                      Positioned(
                        left: 7,
                        top: 0,
                        child: Image.asset("assest/guest logo.png",width: 50,height: 50,fit: BoxFit.contain),),
                      Positioned(
                          top: 0,
                          left: 0,
                          bottom: 50,
                          right: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Musical",style: GoogleFonts.robotoSlab(textStyle:  cardTitle)),
                              Text("Genres",style: GoogleFonts.robotoSlab(textStyle:  extraBoldText)),
                            ],
                          )
                      ),
                      Positioned(
                          top: 0,
                          left: 130,
                          bottom: 80,
                          right: 0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Image.asset("assest/pink2.png",fit: BoxFit.fill,height: 90,width: 150,),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -10,
                  child: SizedBox(
                    height: 120,
                    width: width,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset("assest/dance1.png",height: 120,width: 100,fit: BoxFit.fill,),
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                top: 0,
                                right: 0,
                                child: Center(
                                    child: Text("Sufi \nSitdown",style: GoogleFonts.robotoSerif(textStyle: cardTitle),textAlign: TextAlign.center)))
                          ],
                        ),
                        Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset("assest/dance2.png",height: 120,width: 100,fit: BoxFit.fill,),
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                top: 0,
                                right: 0,
                                child: Center(
                                    child: Text("BollyWood",style: GoogleFonts.robotoSerif(textStyle: cardTitle),textAlign: TextAlign.center,)))
                          ],
                        ),
                        Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset("assest/dance3.png",height: 120,width: 100,fit: BoxFit.fill,),
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                top: 0,
                                right: 0,
                                child: Center(
                                    child: Text("Western\nMusic",style: GoogleFonts.robotoSerif(textStyle: cardTitle),textAlign: TextAlign.center,)))
                          ],
                        ),
                        Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset("assest/dance2.png",height: 120,width: 100,fit: BoxFit.fill,),
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                top: 0,
                                right: 0,
                                child: Center(
                                    child: Text("Rock\nNight",style: GoogleFonts.robotoSerif(textStyle: cardTitle),textAlign: TextAlign.center,)))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,top: 15),
              child: Row(  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("EVENT / Band Night",style: GoogleFonts.robotoSlab(textStyle:  bigTitle)),
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
              padding: const EdgeInsets.symmetric(horizontal: 15.0,),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset("assest/music2.png",width: width,height: 160,fit: BoxFit.fill),
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset("assest/music2.png",width: width,height: 160,fit: BoxFit.fill),
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset("assest/music2.png",width: width,height: 160,fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 20.0),
              child: ClipRRect(
                child: Image.asset("assest/summer_img.png",width: width,height: 170,fit: BoxFit.fill),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 10.0,bottom: 10),
                  child: Text('Recommended Deals ',style:bigTitle),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0.0,right: 10.0,bottom: 10),
                  child: Text('View all',style:redTitle),
                ),
              ],
            ),
            SizedBox(
              width: width,
              height: 160,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 15),
                scrollDirection:Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
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
                  padding: EdgeInsets.only(left: 10.0,top: 15,bottom: 10),
                  child: Text('Coupon',style:bigTitle),
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
                  padding: const EdgeInsets.only(left: 15),
                  scrollDirection:Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 10.0,top: 20,bottom: 10),
                  child: Text('Past Event',style:bigTitle),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0.0,top: 20,right: 10.0,bottom: 10),
                  child: Text('View all',style:redTitle),
                ),
              ],
            ),
            SizedBox(
              width: width,
              height: 160,
              child: ListView.builder(
                  padding: const EdgeInsets.only(left: 15),
                  scrollDirection:Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
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
