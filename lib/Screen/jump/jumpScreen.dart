
// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../Utils/Styles.dart';

class Jump_start extends StatefulWidget {
  const Jump_start({Key? key}) : super(key: key);

  @override
  State<Jump_start> createState() => Jump_startState();
}

class Jump_startState extends State<Jump_start> {

  double? _ratingValue;
  List<String> listPaths = [
    "assest/live-music 1.png",
    "assest/dj_img.png",
    "assest/menu 1.png",
    "assest/deal 1.png",
    "assest/meals .png",
  ];
  ScrollController scrollController=ScrollController();

  void scrollDown(){
    scrollController.animateTo(scrollController.offset+200, duration: const Duration(milliseconds: 500),
        curve: Curves.linear);
  }
  int currentPos = 0;
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFf141420),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1E2E),
        leading:  Padding(
          padding: const EdgeInsets.only(left: 30.0,),
          child: SizedBox(
            width: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ),
        ),
        centerTitle: false,
        title: Container(
          width: 60,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only( ),
          child: const Image(image:AssetImage('assest/guest logo.png',),height: 30,
            width: 50,),
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
                        controller: scrollController,
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
                      child: IconButton(onPressed: (){
                        scrollDown();
                      },
                          icon: const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 20,)))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: SizedBox(
                height: 240,
                width: width,
                child: CarouselSlider(
                  options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 16 / 7,
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
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Stack(
                              children: [
                                Image.asset('assest/club1.png',fit: BoxFit.fill,height: 200),
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
                                        const SizedBox(height: 10.0),
                                        Text('Castle Barbeque',style:
                                        GoogleFonts.robotoMono(textStyle: boldText)),
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
                  ).toList(),),
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
                      onTap:(){
                        Navigator.pushNamed(context,'/about');
                      },
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
                                          padding: const EdgeInsets.only(left: 10),
                                          child: SizedBox(
                                            height: 81,
                                            width: 98,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                    height: 64,
                                                    width: 98,
                                                    child: Image(image: AssetImage('assest/music7.png'),fit: BoxFit.cover,)),
                                                const SizedBox(height: 3,),
                                                Text('1+1 on Buffets', style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 12.0,),
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
                                          child: Icon(Icons.shopping_bag_outlined,color: appColor,size: 24,)
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
}



