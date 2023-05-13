
// ignore_for_file: camel_case_types

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../Api_service/homeApi.dart';
import '../../Api_service/login_api.dart';
import '../../Modal/dealM.dart';
import '../../Utils/Styles.dart';
import '../viewcart.dart';

class clubAllDeal extends StatefulWidget {
  const clubAllDeal({Key? key}) : super(key: key);

  @override
  State<clubAllDeal> createState() => _clubAllDealState();
}

class _clubAllDealState extends State<clubAllDeal> {
  bool loader = false;
  List <DealData> dealList = [];
  int currentPos = 0;
  List<String> listPaths = [
    "assest/live-music 1.png",
    "assest/dj_img.png",
    "assest/menu 1.png",
    "assest/deal 1.png",
    "assest/meals .png",
  ];
  load(){
    homeApi().Dealapi(deal_typeId: '0').then((value) {
      setState((){
        loader = true;
        dealList = value.data!;
      });
    });
  }
  @override
  void initState() {
    load();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backGround,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1E2E),
        title: Text("All Deals",style: GoogleFonts.poppins(textStyle: appBarText),),
      ),
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
                  child: Align(
                    alignment: Alignment.center,
                    child:  buildIndicator(),
                  )),
              Positioned(
                top : 0,
                right: 5,
                child:Row(
                  children: [
                    SizedBox(
                        width:30,
                        child: IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border,color: Colors.white,size: 20,))),
                    SizedBox(
                        width:30,
                        child: IconButton(onPressed: (){}, icon: const Icon(Icons.share_outlined,color: Colors.white,size: 20,))),
                  ],
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
            ],
          ),
          loader == false ?
          const Center(child: CircularProgressIndicator(color: appColor)) :
          dealList.isEmpty ?
          Container(
              alignment: Alignment.center,
              height: height/2,
              width: width,
              child: Text("Deal not found",style: GoogleFonts.playfairDisplay(textStyle: appBarText),textAlign: TextAlign.center,)) :
          ListView.builder(
            shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: dealList.length,
              itemBuilder: (context, index) {
                var data = dealList[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 7.0),
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(color: const Color(0xFF1F1E2E),
                        borderRadius: BorderRadius.circular(8)),
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
                              child: Text('${data.name}',style: GoogleFonts.poppins(textStyle: labelText)),
                            ),
                            const SizedBox(height: 3,),
                            Text('Free Cancellation',style: GoogleFonts.poppins(textStyle: greenText)),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text('Timing',style: GoogleFonts.poppins(textStyle: cardSubtitle)),
                                    Text('Valid for',style: GoogleFonts.poppins(textStyle: cardSubtitle)),
                                  ],
                                ),
                                const SizedBox(width: 25,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text('Available Time',style: GoogleFonts.poppins(textStyle: cardSubtitle)),
                                        const SizedBox(width: 4,),
                                        InkWell(
                                          onTap: (){
                                            showDialog(context: context,
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    contentPadding: const EdgeInsets.all(0),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(20),
                                                    ),
                                                    content: StatefulBuilder(builder: (context, StateSetter setState) {
                                                      return Container(
                                                        height: 300,
                                                        width: 300,
                                                        padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 20.0),
                                                        decoration: BoxDecoration(
                                                          color: drawerBackGround,
                                                          borderRadius: BorderRadius.circular(20.0),
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: const [
                                                                SizedBox(
                                                                    width: 80,
                                                                    child: Text("Days",style: cardTitle,)),
                                                                SizedBox(
                                                                    width: 80,
                                                                    child: Text("Start Time",style: cardTitle,)),
                                                                Text("End Time",style: cardTitle,),
                                                              ],
                                                            ),
                                                            const SizedBox(height: 5.0,),
                                                            const Divider(color: Colors.white),
                                                            const SizedBox(height: 5.0,),
                                                            ListView.builder(
                                                              physics: const ScrollPhysics(),
                                                              shrinkWrap: true,
                                                              itemCount: data.weeks!.length,
                                                              itemBuilder: (context, index) {
                                                                var weekData = data.weeks![index];
                                                                return Row(
                                                                  children: [
                                                                    Container(
                                                                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                                                                      width: 80,
                                                                        child: Text("${weekData.validOn} : ",style: labelText,)),
                                                                    SizedBox(
                                                                        width: 80,
                                                                        child: Text("${weekData.startTime}",style: labelText,)),
                                                                    Text("${weekData.endTime}",style: labelText,),
                                                                  ],
                                                                );
                                                              },),
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                                  );
                                                }
                                            );
                                          },
                                            child: const Icon(Icons.arrow_drop_down_circle_outlined,color: Color(0xFF008AD8),size: 24)),
                                      ],
                                    ),
                                    Text('2 People', style: GoogleFonts.poppins(textStyle: cardSubtitle)),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                InkWell(
                                  focusColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap:(){
                                    setState(() {
                                      showDetails(context,data.inclusion);
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 4.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        border: Border.all(color: Colors.blue)
                                    ),
                                    child: Text('Inclusions', style: GoogleFonts.poppins(textStyle: cardBlueText)),
                                  ),
                                ),
                                const SizedBox(width: 8,),
                                InkWell(
                                  focusColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap:(){
                                    setState(() {
                                      showDetails(context,data.detail);
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 4.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        border: Border.all(color: Colors.blue)
                                    ),
                                    child: Text('Details',style: GoogleFonts.poppins(textStyle: cardBlueText)),
                                  ),
                                ),
                                const SizedBox(width: 8,),
                                InkWell(
                                  focusColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: (){},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 4.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        border: Border.all(color: Colors.blue)
                                    ),
                                    child: Text('Venue',style: GoogleFonts.poppins(textStyle: cardBlueText)),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('MSP- ${data.maxPrice}',style: GoogleFonts.poppins(textStyle: cardSubtitle)),
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
                                        axes: <RadialAxis>[
                                          RadialAxis(
                                              minimum: double.parse( data.minPrice.toString()),maximum: double.parse( data.maxPrice.toString()),
                                              ranges: <GaugeRange>[
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
                                                  value:double.parse(data.livePrice.toString()),
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
                                              ]
                                          )]
                                    ),
                                  ),
                                ),
                                Text("₹ ${data.livePrice}",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Colors.white),),
                              ],
                            ),
                            const Text("Inc. of all taxes",style: cardGreyText,),
                            const SizedBox(height: 3,),
                            InkWell(
                              onTap: (){
                                showModalBottomSheet<void>(
                                  context: context,
                                    backgroundColor: bottomBarColor,
                                    builder: (BuildContext context){
                                    return SizedBox(
                                      height: 150,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 4),
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                          color: Colors.white54,
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                const Spacer(),
                                                InkWell(
                                                  splashColor: Colors.transparent,
                                                   focusColor: Colors.transparent,
                                                   onTap: (){
                                                     Navigator.pop(context);
                                                   },
                                                    child: const Icon(Icons.clear,color: Colors.white,)),
                                                const SizedBox(width: 5.0,)
                                              ],
                                            ),
                                            const SizedBox(height: 10.0),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                const SizedBox(width: 3,),
                                                const CircleAvatar(
                                                  radius: 22,
                                                  backgroundImage:AssetImage('assest/music_mic.png',),),
                                                const SizedBox(width: 10,),
                                                Text('${data.name}', style: GoogleFonts.poppins(textStyle: labelText)),
                                                const Spacer(),
                                                Text('${data.livePrice}/-',
                                                    textAlign: TextAlign.end,
                                                    style: GoogleFonts.poppins(
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 10, color: Colors.white)),
                                              ],
                                            ),
                                            const SizedBox(height: 10.0),
                                            Row(
                                              children: [
                                                Text('  1 combo save in the cart...',style: GoogleFonts.poppins(textStyle: labelText)),
                                                const Spacer(),
                                                InkWell(
                                                  onTap: (){
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewCard()));
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 6.0),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(3.0),
                                                      gradient: const LinearGradient(
                                                        begin: FractionalOffset(0.1, 0.1),
                                                        end: FractionalOffset(0.8, 0.1),
                                                        colors: [Color(0xFFFE262F),Color(0xFFFD2F71),
                                                        ],
                                                      ),
                                                    ),
                                                    child: Text('View Cart',style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 10, color: Colors.white)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                    }
                                );
                                LoginApi().addCardApi(
                                  context: context,
                                  dealId: data.id.toString()
                                ).then((value){});
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 5.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFAE3C23),
                                    borderRadius: BorderRadius.circular(2)
                                ),
                                child: Text('Add +',style: GoogleFonts.poppins(textStyle: cardSubtitle)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                );
              },
          ),
        ],
      ),
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
        }
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
