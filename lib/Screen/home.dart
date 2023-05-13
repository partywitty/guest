import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> listPaths = [
    "assest/live-music 1.png",
    "assest/dj_img.png",
    "assest/menu 1.png",
    "assest/deal 1.png",
    "assest/meals .png",
  ];
  List<String> Toplist = [
    "assest/music_mic.png",
    "assest/rec_room.png",
    "assest/music_band.png",
    "assest/music_club.png",
  ];
  List<String> datalist = [
    "assets/images/png/ironmanslider.png",
    "assets/images/png/ironmanslider.png",
    "assets/images/png/ironmanslider.png",
  ];
  List<String> data = [
    "assest/aleksandr-popov1.png",
    "assest/aleksandra-popov.png",
  ];
  int currentPos = 0;
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFf141420),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1E2E),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: (){
            Navigator.pushNamed(context, '/Live_music');
          },
        ),
        centerTitle: true,
        title:  Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Near Tower squre", style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 12, color: Colors.white)),
            SizedBox(
              width: 20,
              child: IconButton(onPressed: (){

              },
                  icon: const Icon(Icons.arrow_drop_down)),
            )
          ],
        ),
        actions: [
          SizedBox(
            width: 32,
            child: IconButton(onPressed: (){ Navigator.pushNamed(context, '/Home_page1');},
                icon: const Icon(Icons.search,color: Colors.white,)),
          ),
         Image.asset('assest/bell.png',scale: 3.5,)
        ],
      ),
      body: ListView(
        children:[
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SizedBox(
            height: 100,
            width: width,
            child:  ListView.builder(
              itemCount: listPaths.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap:(){},
                  child: Padding(
                      padding: const EdgeInsets.only(top: 10,right: 15),
                      child: Container(

                        padding: const EdgeInsets.only(top: 10,bottom:2),
                        width: 68,
                        height: 72,
                        decoration: BoxDecoration(color: const Color(0xFF1F1E2E), borderRadius: BorderRadius.circular(5)
                        ),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width:30,
                                height: 30,

                                child: Image(image: AssetImage(listPaths[index]),)),
                            Text('Live \n music',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10, color: Colors.white)),

                          ],
                        ),
                      )
                  ),
                );
              },)
          ),
        ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: SizedBox(
              height: 240,
              width: width,
              child: ListView(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        height: 200,
                        // height: MediaQuery.of(context).size.height * 0.30,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
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
                                child: Image.asset('assest/party_img.png',fit: BoxFit.fill,),
                              ),
                              Positioned(
                                bottom: 30,
                              left: 210,
                                child:Container(
                                    width: 70,
                                    height: 18,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.only(left: 6,right: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    gradient: const LinearGradient(
                                      begin: FractionalOffset(0.1, 0.1),
                                      end: FractionalOffset(0.8, 0.1),
                                      colors: [Color(0xFFFE262F),Color(0xFFFD2F71),
                                      ],
                                    ),
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
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Text('Top Clubs',  style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 12, color: Colors.white)),
          ) ,
          Padding(
            padding: const EdgeInsets.only(top: 20.0,left: 10,),
            child: Row(
              children: [
                SizedBox(
                    height: 80,
                    width:width*0.88,
                    child:  ListView.builder(
                      itemCount: Toplist.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap:(){},
                          child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8,),
                              child: Container(
                                padding: const EdgeInsets.only(top: 10,bottom:2),
                                width: 70,
                                height: 65,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage(Toplist[index]),fit: BoxFit.cover),
                                    color: Colors.white, borderRadius: BorderRadius.circular(5)
                                ),
                              )
                          ),
                        );
                      },)
                ),
                SizedBox(
                  width: 25,
                    child: IconButton(onPressed: (){},
                        icon: const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 18,)))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0,top :20),
            child: Text('Top Events',  style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 12, color: Colors.white)),
          ) ,
          Padding(
            padding: const EdgeInsets.only(top: 8.0,bottom: 10),
            child: Container(
              height: 148,
              width: 233,
              padding:const EdgeInsets.only(left: 20,),
              child: ListView.builder(
                itemCount: data.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap:(){},
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8,),
                        child: Stack(
                          children: [
                            Container(
                                height: 147,
                                width: 238,
                                decoration: BoxDecoration(
                                    image:DecorationImage(
                                      image:  AssetImage(data[index]),fit: BoxFit.fill,),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                            ),
                            Positioned(
                              top: 26,
                              left: 15,
                              child:SizedBox(
                                height: 40,
                                width: 80,
                              child: Text('It is a long established',
                                  softWrap: true,
                                  overflow: TextOverflow.clip,
                                  textScaleFactor: 1,
                                  style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12, color: Colors.white)),
                            ),),
                            Positioned(
                              bottom: 10,
                              left: 15,
                              child:SizedBox(
                                height: 40,
                                width: 80,
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Upto',
                                        softWrap: true,
                                        overflow: TextOverflow.clip,
                                        textScaleFactor: 1,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12, color: Colors.white)),
                                    Text('50% Off',
                                        softWrap: true,
                                        overflow: TextOverflow.clip,
                                        textScaleFactor: 1,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12, color: Colors.white)),
                                  ],
                                ),
                              ),),
                            Positioned(
                              bottom: 15,
                              left: 170,
                              child:Container(
                                width: 55,
                                height: 20,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.only(left: 6,right: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  gradient: const LinearGradient(
                                    begin: FractionalOffset(0.1, 0.1),
                                    end: FractionalOffset(0.8, 0.1),
                                    colors: [Color(0xFFFE262F),Color(0xFFFD2F71),
                                    ],
                                  ),
                                ),
                                child:Text('JOIN',  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10, color: Colors.white)) ,
                              ),
                            ),
                          ],
                        )
                    ),
                  );
                },),
            ),
          )

     ] ),
    );
  }
  AnimatedSmoothIndicator buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: currentPos,
      count: listPaths.length,
      effect: const ScrollingDotsEffect(
        activeStrokeWidth: 2.6,
        activeDotScale: 1.3,
        maxVisibleDots: 5,
        radius: 8,
        spacing: 8,
        dotHeight: 8,
        dotWidth: 8,
        dotColor: Color(0xFFD9D9D9),
        activeDotColor: Color(0xFFFF2929),
      ),
    );

  }
}
