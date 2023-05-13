

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partywitty_guest/Screen/resPackage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../Utils/Styles.dart';
import '../../Utils/commonStyles.dart';

class PrivatepartyBooking extends StatefulWidget {
  const PrivatepartyBooking({Key? key}) : super(key: key);

  @override
  State<PrivatepartyBooking> createState() => PrivatepartyBookingState();
}

class PrivatepartyBookingState extends State<PrivatepartyBooking> {
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
      backgroundColor: const Color(0xFF18191A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF18191A),
        title: Text('Book a Venue for Private Party',  style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 16, color: Colors.white)),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:27,bottom: 10),
              child: Text('Few qustion to pick the best suitible venue',  style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 14, color: Colors.white)),
            ),
            SizedBox(
              height: 230,
              width: width,
              child: Column(
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
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction:1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentPos = index;});
                        }),
                    items:listPaths. map((item) =>
                        Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1),
                          ),
                          child: Image.asset('assest/party_img.png',fit: BoxFit.fill,height: 190,width: double.infinity,),
                        ),
                    ).toList(),),
                  Container(
                    color: Colors.transparent,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 1),
                            child: Align(
                              alignment: Alignment.center,
                              child:  buildIndicator(),
                            ),
                          ),]),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:28,top: 10,bottom: 2),
              child: Text('Venue you wish to be book',  style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 14, color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.only(left:27,right: 27,bottom: 2),
              child: TextFormField(
                // controller: emailController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                style: fillText,
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Please enter your email address",
                  hintStyle: textHint,
                  fillColor:  Colors.grey.shade800,
                  suffixIcon: Icon(Icons.keyboard_arrow_down,color: Colors.white,size: 28,),
                  contentPadding: const EdgeInsets.only(
                      left: 25.0, bottom: 12.0, top: 0.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade800),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade800),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:28,top: 10,bottom: 2),
              child: Text('No. of Guest',  style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 14, color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.only(left:27,right: 27,bottom: 2),
              child: TextFormField(
                // controller: emailController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                style: fillText,
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Please enter your email address",
                  hintStyle: textHint,
                  fillColor:  Colors.grey.shade800,
                  contentPadding: const EdgeInsets.only(
                      left: 25.0, bottom: 12.0, top: 0.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade800),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade800),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:28,top: 10,bottom: 2),
              child: Text('Select City',  style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 14, color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.only(left:27,right: 27,bottom: 2),
              child: TextFormField(
                // controller: emailController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                style: fillText,
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Please enter your email address",
                  hintStyle: textHint,
                  fillColor:  Colors.grey.shade800,
                  suffixIcon: Icon(Icons.keyboard_arrow_down,color: Colors.white,size: 28,),
                  contentPadding: const EdgeInsets.only(
                      left: 25.0, bottom: 12.0, top: 0.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade800),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade800),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:28,top: 10,bottom: 2),
              child: Text('Preferred Location',  style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 14, color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.only(left:27,right: 27,bottom: 2),
              child: TextFormField(
                // controller: emailController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                style: fillText,
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Please enter your email address",
                  hintStyle: textHint,
                  fillColor:  Colors.grey.shade800,
                  contentPadding: const EdgeInsets.only(
                      left: 25.0, bottom: 12.0, top: 0.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade800),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade800),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:28,top: 10,bottom: 2),
              child: Text('Choose Package',  style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 14, color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.only(left:27,right: 27,bottom: 2),
              child: TextFormField(
                // controller: emailController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                style: fillText,
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Please enter your email address",
                  hintStyle: textHint,
                  fillColor:  Colors.grey.shade800,
                  contentPadding: const EdgeInsets.only(
                      left: 25.0, bottom: 12.0, top: 0.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade800),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade800),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:28,top: 10,bottom: 2),
              child: Text('Date of Event',  style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 14, color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.only(left:27,right: 27,bottom: 2),
              child: TextFormField(
                // controller: emailController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                style: fillText,
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Please enter your email address",
                  hintStyle: textHint,
                  fillColor:  Colors.grey.shade800,
                  contentPadding: const EdgeInsets.only(
                      left: 25.0, bottom: 12.0, top: 0.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade800),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade800),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:28,top: 20,bottom: 30,right: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width/3.4,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 15.0),
                    decoration: BoxDecoration(
                       color:Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: const Text('Prev',style: buttonText) ,
                  ),
                  InkWell(
                    onTap: (){
                      setState((){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Restpackage(),));
                      });
                    },
                    child: Container(
                      width: width/3.4,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 15.0),
                      decoration: boxDecoration(),
                      child: const Text('Submit',style: buttonText) ,
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
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
