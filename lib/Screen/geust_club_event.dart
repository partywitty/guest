import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:partywitty_guest/Utils/Styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class GuestEvent extends StatefulWidget {
const GuestEvent({Key? key}) : super(key: key);

@override
State<GuestEvent> createState() => _GuestEventState();
}

class _GuestEventState extends State<GuestEvent> {

  double? _ratingValue;
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
        backgroundColor: const Color(0xFF1F1E2E),
        centerTitle: false,
        title:  Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: (){},
            ),
            Container(
              width: 60,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only( ),
              child: const Image(image:AssetImage('assest/guest logo.png',),height: 30,
                width: 50,),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: (){},
              icon: const Icon(Icons.search,color: Colors.white,))
        ],
      ),
      bottomNavigationBar: Container(
        width: width,
        height: 50,
        color: const Color(0xFF2D2B43),
        child: Padding(
          padding: const EdgeInsets.only(),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 100,
                height: 20,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                        height: 15,
                        child: Image(image: AssetImage('assest/updown.png'))),
                    const SizedBox(width: 5,),
                    Text('Sort',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 11, color: Colors.white)),
                  ],
                ),
              ),
              Container(width: 1,
                height: 34,
                color: Colors.white,),
              SizedBox(
                width: 100,
                child: Row(
                  children: [
                    const SizedBox(
                        height: 15,
                        child: Image(image: AssetImage('assest/filter.png'))),
                    const SizedBox(width: 5,),
                    Text('Filter',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 11, color: Colors.white)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: ListView(
          children:[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  SizedBox(
                      height: 100,
                      width:width*0.89,
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
                  SizedBox(
                      width: 25,
                      child: IconButton(onPressed: (){},
                          icon: const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 20,)))

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: SizedBox(
                height: 240,
                width: width,
                child: ListView(
                  physics: const ScrollPhysics(),
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                          height: 200,
                          // height: MediaQuery.of(context).size.height * 0.30,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.26,
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
                                  bottom: 10,
                                  left: 10,
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
            Container(
                width: width,

                padding:const EdgeInsets.only(left: 15),
                child:ListView.builder(
                  physics: const ScrollPhysics(),
                  itemCount: listPaths.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap:(){},
                      child: Padding(
                          padding: const EdgeInsets.only(top: 10,right: 15),
                          child: Container(
                            width:227,
                            // height:137,
                            decoration: BoxDecoration(color:  const Color(0xFF1F1E2E), borderRadius: BorderRadius.circular(5)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: SizedBox(
                                    height: 88,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 12,left: 10),
                                          child: SizedBox(
                                            height: 80,
                                            width: 98,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                    height: 60,
                                                    width: 98,
                                                    child: Image(image: AssetImage('assest/ticket.png'),fit: BoxFit.cover,)),
                                                Text('1+1 on Buffets', style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 12.0,top: 8),
                                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width:width*0.56,
                                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text('Castle Barbeque', style: GoogleFonts.poppins(
                                                        fontWeight: FontWeight.w400, fontSize: 12, color: const Color(0xFfA06000))),
                                                    Align(
                                                      alignment: Alignment.centerRight,
                                                      child: SizedBox(
                                                        width: 25,
                                                        height: 27,
                                                        child: IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border_outlined,color: Colors.red,
                                                          size: 15
                                                          ,)),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 80,
                                                    height: 15,
                                                    decoration: BoxDecoration(

                                                        border: Border.all(color: Colors.white),
                                                        borderRadius: BorderRadius.circular(3)
                                                    ),
                                                    child:    Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .only(),
                                                          child: RatingBar(
                                                              initialRating: 0,
                                                              itemSize: 12,
                                                              direction:
                                                              Axis.horizontal,
                                                              allowHalfRating:
                                                              true,
                                                              glowRadius: 13,
                                                              itemCount: 5,
                                                              ratingWidget:
                                                              RatingWidget(
                                                                  full: const Icon(Icons.star, size: 12,
                                                                      color: Colors.orange),
                                                                  half: const Icon(Icons.star_half,
                                                                    size: 12,
                                                                    color: Colors.orange,
                                                                  ),
                                                                  empty: const Icon(
                                                                    Icons.star_outline,
                                                                    size: 12,
                                                                    color: Colors.orange,
                                                                  )),
                                                              onRatingUpdate:
                                                                  (value) {
                                                                setState(() {
                                                                  _ratingValue = value;
                                                                });
                                                              }),
                                                        ),
                                                        const SizedBox(width:2,),
                                                        Text('4.2', style: GoogleFonts.poppins(
                                                            fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white))
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5,),
                                                  Text('(367ratings)', style: GoogleFonts.poppins(
                                                      fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)),
                                                ],
                                              ),
                                              const SizedBox(height: 5,),
                                              Text('673.2 km - Connaught Place', style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Row(
                                    children: [
                                      Text('Start at', style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)),
                                      const SizedBox(width:3,),
                                      const Text('₹', style:TextStyle(
                                          fontWeight: FontWeight.w400, fontSize: 9, color: Colors.white)),
                                      const SizedBox(width:1,),
                                      Text('3965 for 2 pepole', style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)),
                                      const SizedBox(width:4,),
                                      Text('50% OFF', style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400, fontSize: 8, color: Colors.red)),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 15,),
                                Container(
                                  padding: const EdgeInsets.only(left: 10,right: 14) ,
                                  width: width,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF2D2B43) ,),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Valid till 30 Nov 2022',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 10, color: Colors.white)),

                                      const SizedBox(
                                          height: 13,
                                          width: 15,
                                          child: Icon(Icons.shopping_bag_outlined,size: 24,color: appColor)
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                      ),
                    );
                  },)
            ),

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