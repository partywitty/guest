
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partywitty_guest/Screen/thankyou_1.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../Utils/Styles.dart';
import '../Utils/commonStyles.dart';

class Restpackage extends StatefulWidget {
  const Restpackage({Key? key}) : super(key: key);

  @override
  State<Restpackage> createState() => RestpackageState();
}

class RestpackageState extends State<Restpackage>   with SingleTickerProviderStateMixin {
  int currentPos = 0;
  List<String> listPaths = [
    "assest/live-music 1.png",
    "assest/dj_img.png",
    "assest/menu 1.png",
    "assest/deal 1.png",
    "assest/meals .png",
  ];
  List<String> data = [
    "assest/aleksandr-popov1.png",
    "assest/aleksandra-popov.png",
  ];
  late TabController _tabController;
  bool  select=false;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
  }
  List<String> homeBanner = [
    "assest/Mask group.png",
    "assest/Mask group.png",
    "assest/Mask group.png",
    "assest/Mask group.png",
  ];
  List item = [
    "assest/pdf_imd1.png",
    "assest/pdf_img2.png",
    "assest/pdf_img3.png",
  ];
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  int selectitem=0;
  bool check = false;
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFf141420),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('  Restaurant Packages', style: GoogleFonts.poppins(textStyle: appBarText)),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Stack(
                children: [
                  SizedBox(
                    height: 208,
                    width: width,
                    child: ListView(
                      children: [
                        CarouselSlider(
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
                      ],
                    ),
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
                                  child: IconButton(onPressed: (){},
                                      icon: const Icon(Icons.favorite_border_outlined,color: Colors.white,size: 20,))),
                              SizedBox(
                                  width:30,
                                  child: IconButton(onPressed: (){},
                                      icon: const Icon(Icons.share_outlined,color: Colors.white,size: 20,))),
                            ],
                          )
                        ],
                      ) ,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15,),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Packages',  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 15, color: Colors.white)),
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
                        child: IconButton(
                          focusColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: (){},
                            padding: const EdgeInsets.all(2),
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
                        child: IconButton(
                            focusColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: (){},
                            padding: const EdgeInsets.all(2),
                            icon: Image.asset('assest/filter.png',width: 15,)
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            ) ,
            const SizedBox(height: 15,),
            Container(
              height: 34,
              alignment: Alignment.center,
              child:  TabBar(
                labelColor:const Color(0xFFFD2F71),
                controller: _tabController,
                isScrollable: true,
                indicatorWeight: 0.0,
                automaticIndicatorColorAdjustment: true,
                indicatorColor: Colors.blue,
                labelStyle: const TextStyle(fontSize: 12),
                unselectedLabelStyle: const TextStyle(color: Color(0xFF919191),fontSize: 12),
                unselectedLabelColor:const Color(0xFF919191),
                indicatorSize: TabBarIndicatorSize.tab,
                labelPadding: EdgeInsets.symmetric(horizontal: width*0.02,vertical:0),
                padding: const EdgeInsets.symmetric(vertical: 3.0),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: const Color(0xFFFD2F71),width: 1)
                ),
                tabs: const [
                  Tab(
                    child:Text('  All  '),
                  ),
                  Tab(
                    child:Text('  Veg  '),),
                  Tab(
                    child:Text(' Non-Veg ',),
                  ),
                  Tab(
                    child:Text(' IMFL '),),
                  Tab(
                    child:Text('  Imported  ',),),
                  Tab(
                    child:Text('  Single Malt  '),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:12.0),
              child: SizedBox(
                height: height/1.3,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    About(height,width),
                    About(height,width),
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
      ),
    );
  }

  About(height,width){
    return ListView(
      children: [
        Padding(
            padding: const EdgeInsets.only(top:10),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                          decoration: BoxDecoration(
                              image: const DecorationImage(image: AssetImage('assest/wallet1.png'),fit: BoxFit.fill),
                              color: const Color(0xFF1F1E2E),
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                            padding: const EdgeInsets.all(7),
                            child:  Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset('assest/dimondF.png',height: 40,width: 40,),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                                width:30,
                                                height: 25,
                                                child: IconButton(
                                                    focusColor: Colors.transparent,
                                                    splashColor: Colors.transparent,
                                                    onPressed: (){},
                                                    icon: const Icon(Icons.favorite_border_outlined,color: Colors.white,size: 20,),
                                                    padding: const EdgeInsets.all(0))),
                                            SizedBox(
                                                width:30,
                                                height: 25 ,
                                                child: IconButton(
                                                    focusColor: Colors.transparent,
                                                    splashColor: Colors.transparent,
                                                    onPressed: (){},
                                                    icon: const Icon(Icons.share_outlined,color: Colors.white,size: 20,),
                                                    padding: const EdgeInsets.all(0))),
                                          ],
                                        ),
                                        Container(
                                          height:15,
                                          padding: const EdgeInsets.only(left: 7,right: 5,),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(3),
                                              border: Border.all(color: Colors.green)
                                          ),
                                          child:
                                          Text('56% OFF',
                                              style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                          ),),
                                      ],
                                    )

                                  ],
                                ),
                                const SizedBox(height: 6,),
                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('188 bought',
                                        style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white54)
                                    ),
                                    Text(
                                        'Unlimited IMFL + Food(Veg / Non - veg)',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        textScaleFactor: 1.1,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.white)
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 3,),
                                Text('Live Music', overflow: TextOverflow.clip,
                                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.green)
                                ),
                                const SizedBox(height: 6,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text('Valid on',
                                                  style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 8,
                                                    color: Colors.white)
                                            ),
                                            Text('Timming',
                                                overflow: TextOverflow.clip,
                                                softWrap: true,
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 8,
                                                    color: Colors.white)
                                            ),
                                            Text('Valid for',
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
                                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('All days',
                                                   style: GoogleFonts.poppins(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 8,
                                                        color: Colors.white)
                                                ),
                                                Row(
                                                  children: [
                                                    Text('12:00 PM- 10:00 AM',
                                                      style: GoogleFonts.poppins(
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 8,
                                                            color: Colors.white)
                                                    ),
                                                    const SizedBox(width: 4,),
                                                    const Icon(Icons.arrow_drop_down_circle_outlined,color: Color(0xFF008AD8),size: 12,)
                                                  ],
                                                ),
                                                Text('2 People',
                                                    textAlign: TextAlign.start,
                                                    style: GoogleFonts.poppins(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 8,
                                                        color: Colors.white)
                                                ),
                                              ],
                                            ),
                                          ]
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text('4500/-', overflow: TextOverflow.clip,
                                            style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 11, color: const Color(0xFFFD2F71))
                                        ),
                                        Text('M.R.P.: 4500/-', overflow: TextOverflow.clip,
                                            style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white.withOpacity(0.7))
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height:15,
                                          padding: const EdgeInsets.only(left: 7,right: 6,),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(3),
                                              border: Border.all(color: Colors.blue)
                                          ),
                                          child:
                                          Text(
                                              'Inclusions',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 8,
                                                  color: Colors.blue)
                                          ),),
                                        const SizedBox(width: 8,),
                                        Container(
                                          height:15,
                                          padding: const EdgeInsets.only(left: 8,right: 6,),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(3),
                                              border: Border.all(color: Colors.blue)
                                          ),
                                          child:
                                          Text(
                                              'Details',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 8,
                                                  color: Colors.blue)
                                          ),),
                                        const SizedBox(width: 8,),
                                        Container(
                                          height:15,
                                          padding: const EdgeInsets.only(left: 7,right: 6,),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(3),
                                              border: Border.all(color: Colors.blue)
                                          ),
                                          child: Text(
                                              'Venue',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 8,
                                                  color: Colors.blue)
                                          ),),

                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xFFFFFFFF),
                                          borderRadius: BorderRadius.circular(30)
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(left: 6,right: 6),
                                            height: 20,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFFE55100),
                                                borderRadius: BorderRadius.circular(30)
                                            ),
                                            child: Text('Shortlisted'  , style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 8,
                                                color: Colors.white)),

                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(left: 5,right: 6),
                                            height: 20,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFFFFFFFF),
                                                borderRadius: BorderRadius.circular(30)
                                            ),
                                            child: Text('Choose'  , style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 8,
                                                color: Colors.grey.withOpacity(0.4))),

                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )),
                    ),
                  );

                })),
        SizedBox(
          height: 35,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                splashRadius: 10,
                activeColor:  const Color(0xFFFD2F71),
                checkColor: Colors.white,
                side: const BorderSide(
                  color: Color(0xFFFD2F71),
                ),
                value: check,
                onChanged: (value) {
                  setState(() {
                    check = value!;
                  });
                },
              ),
              Text('I agree the ',style:GoogleFonts.firaSans(
                  fontWeight: FontWeight.w400,fontSize: 12,color: Colors.white
              )),
              InkWell(
                onTap: (){
                  // showdatails(context);
                },
                child: Text('T&C ',style:GoogleFonts.firaSans(
                    fontWeight: FontWeight.w400,fontSize: 13,color:const Color(0xFFFD2F71)
                )),
              ),
            ],
          ),
        ),
        const SizedBox(height:10,),
        InkWell(
          onTap: (){
            setState((){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Thankyou_1(),));
            });
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 45,
                alignment: Alignment.center,
                padding:  const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                decoration: boxDecoration(),
                child: const Text('Know your Option',style: buttonText) ,
              ),
            ],
          ),
        ),
        const SizedBox(height:30,),
      ],
    );
  }
  Deals(height,width){
    return  ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 8),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 3),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFFD2F71)),
                    borderRadius: BorderRadius.circular(16)
                ),
                child: Text('All \nDeals',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12, color: const Color(0xFFFD2F71))),

              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 3),
                decoration: BoxDecoration(
                  // border: Border.all(color: Color(0xFFFD2F71)),
                    borderRadius: BorderRadius.circular(16)
                ),
                child: Text('Club \nDeals',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 11, color: const Color(0xFFA3A3A3))),

              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 3),
                decoration: BoxDecoration(
                  // border: Border.all(color: Color(0xFFFD2F71)),
                    borderRadius: BorderRadius.circular(16)
                ),
                child: Text('Restaurant \nDeals ',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 11, color: const Color(0xFFA3A3A3))),

              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 3),
                decoration: BoxDecoration(
                  // border: Border.all(color: Color(0xFFFD2F71)),
                    borderRadius: BorderRadius.circular(16)
                ),
                child: Text('Full Bottles \nDeals',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 11, color: const Color(0xFFA3A3A3))),

              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 3),
                decoration: BoxDecoration(
                  // border: Border.all(color: Color(0xFFFD2F71)),
                    borderRadius: BorderRadius.circular(16)
                ),
                child: Text('Jump start \nDeals',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 11, color: const Color(0xFFA3A3A3))),

              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 18, left:18,
            ),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 7,
                itemBuilder: (context, index) {
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
                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        '188 bought',
                                        overflow: TextOverflow.clip,
                                        softWrap: true,
                                        textScaleFactor: 1.1,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 8,
                                            color: Colors.white54)
                                    ),
                                    SizedBox(
                                      width:140,
                                      child: Text(
                                          '4IMFL(30ml)/4 BEAR +1 Starter/Pint',
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
                                    Text(
                                        'Free Cancellation',
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
                                            Text(
                                                'Valid on',
                                                overflow: TextOverflow.clip,
                                                softWrap: true,

                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 8,
                                                    color: Colors.white)
                                            ),
                                            Text(
                                                'Timming',
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
                                        // SizedBox(width: 30,),
                                        const SizedBox(width: 25,),
                                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                'All days',
                                                overflow: TextOverflow.clip,
                                                softWrap: true,

                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 8,
                                                    color: Colors.white)
                                            ),

                                            Row(
                                              children: [
                                                Text(
                                                    '12:00 PM- 10:00 AM',
                                                    overflow: TextOverflow.clip,
                                                    softWrap: true,

                                                    style: GoogleFonts.poppins(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 8,
                                                        color: Colors.white)
                                                ),
                                                const SizedBox(width: 4,),
                                                const Icon(Icons.arrow_drop_down_circle_outlined,color: Color(0xFF008AD8),size: 12,)

                                              ],
                                            ),
                                            Text(
                                                '2 People',
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
                                        Container(
                                          height:15,
                                          padding: const EdgeInsets.only(left: 7,right: 6,),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(3),
                                              border: Border.all(color: Colors.blue)
                                          ),
                                          child:
                                          Text(
                                              'Inclusions',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 8,
                                                  color: Colors.blue)
                                          ),),
                                        const SizedBox(width: 8,),
                                        Container(
                                          height:15,
                                          padding: const EdgeInsets.only(left: 8,right: 6,),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(3),
                                              border: Border.all(color: Colors.blue)
                                          ),
                                          child:
                                          Text(
                                              'Details',
                                              style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 8, color: Colors.blue)
                                          ),),
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Text(
                                        'MSP- 4500',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 8,
                                            color: Colors.white)
                                    ),
                                    const SizedBox(height: 6,),
                                    Container(
                                      height:15,
                                      padding: const EdgeInsets.only(left: 7,right: 5,),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3),
                                          border: Border.all(color: Colors.green)
                                      ),
                                      child:
                                      Text(
                                          '56% OFF',
                                          style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                      ),),
                                    Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height:height*0.1,
                                          child: SizedBox(
                                            width: 45, //height and width of guage
                                            child:SfRadialGauge(
                                                enableLoadingAnimation: true, //show meter pointer movement while loading
                                                animationDuration: 4500, //pointer movement speed
                                                axes: <RadialAxis>[ //Radial Guage Axix, use other Guage type here
                                                  RadialAxis(
                                                      minimum: 0,maximum: 15,
                                                      ranges: <GaugeRange>[ //Guage Ranges
                                                        GaugeRange(startValue: 0,endValue: 5, color: const Color(0xFF7AFF77), startWidth: 10,endWidth: 10),
                                                        GaugeRange(startValue: 5,endValue: 10,color: const Color(0xFF6DFFCF),startWidth: 10,endWidth: 10),
                                                        GaugeRange(startValue: 10,endValue: 15,color: const Color(0xFF07BAFE),startWidth: 10,endWidth: 10)
                                                      ],
                                                      pointers: const <GaugePointer>[
                                                        /// pointer dynamic value
                                                        NeedlePointer(value:8,
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
                                                        //add more annotations 'texts inside guage' here
                                                      ]
                                                  )]
                                            ),
                                          ),
                                        ),
                                        const Text("₹4500",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Colors.white),),
                                      ],
                                    ),
                                    Text("Inc. of all taxes",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 9,color: Colors.white.withOpacity(0.6)),),
                                    const SizedBox(height: 3,),
                                    Container(
                                      padding: const EdgeInsets.only(left: 4,right: 3),
                                      width: 45,
                                      height: 22,
                                      alignment: Alignment.center,
                                      child: Text('Add +'  , style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 9, color: Colors.white)),
                                      decoration: BoxDecoration(color: const Color(0xFFAE3C23),
                                          borderRadius: BorderRadius.circular(2)
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          )),
                    ),
                  );
                })),
        const Padding(
          padding: EdgeInsets.only(left: 18.0,top:18),
          child: Divider(height: 0.1,
            color: Colors.grey,),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0,top :15,bottom: 15),
          child: Text('Promo Codes for Extra savings',  style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 12, color: Colors.white)),
        ) ,
        Container(
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
        const SizedBox(height:15),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 4),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color(0xFFD9D9D9),
          ),
          child: Column(
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 3,),
                  const CircleAvatar(
                    radius: 22,
                    backgroundImage:AssetImage('assest/music_mic.png',),),
                  const SizedBox(width: 10,),
                  Flexible(
                    child: Text('Lord of the Drinks Chamber ',  style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 14, color: Colors.white)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(width: 100,),
                  Text('12,999/-',
                      textAlign: TextAlign.end,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 10, color: Colors.white)),
                ],
              ),
              const SizedBox(height:4,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 30,),
                  Text('1 combo save in the cart...',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 12, color: Colors.white)),
                  Row(
                    children: [
                      Container(
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
                        child: Text('View Cart',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 10, color: Colors.white)
                        ),),
                      const SizedBox(width: 10,),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 2.0,vertical: 1.0),
                        decoration: BoxDecoration(
                          border:Border.all(color: const Color(0xFFFD2F71)),

                        ),
                        child:const Icon(Icons.delete_forever_outlined,color: Color(0xFFFD2F71),
                        ),),
                      const SizedBox(width: 10,),
                    ],
                  ),

                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 70,),
      ],
    );
  }
  Order(height,width){
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 8),
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
                      border: Border.all(color: selectitem==0?const Color(0xFFFD2F71):Colors.transparent),
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Text('Food \nMenu',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 12, color: selectitem==0? const Color(0xFFFD2F71):const Color(0xFFA3A3A3))),

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
                      border: Border.all(color: selectitem==1?const Color(0xFFFD2F71):Colors.transparent),
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Text('Bar \nMenu ',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 11, color: selectitem==1? const Color(0xFFFD2F71):const Color(0xFFA3A3A3))),

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
                          fontSize: 11, color: selectitem==2? const Color(0xFFFD2F71):const Color(0xFFA3A3A3))),

                ),
              ),

            ],
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end,
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
              child: IconButton(onPressed: (){},padding: const EdgeInsets.all(2),
                  icon: Image.asset('assest/filter.png',width: 15,)
              ),
            ),
            const SizedBox(width: 20,),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(item[selectitem])),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Align(
                    alignment: Alignment.center,
                    child:  AnimatedSmoothIndicator(
                      activeIndex: selectitem,
                      count: item.length,
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
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0,top :15,bottom: 15),
          child: Text('Promo Codes for Extra savings',  style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 12, color: Colors.white)),
        ) ,
        Container(
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
    );
  }
  Review(width){
    return  ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0.0,top :20,),
          child: Text('User Rating & Reviews Summary',  style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 12, color: Colors.white)),
        ) ,
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 15,horizontal: 0),
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
                          print(rating);
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
        Padding(
          padding: const EdgeInsets.only(right: 20,top: 15,left: 20),
          child: Container(
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
        ),
        const SizedBox(height:10,),
        Container(
          decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(5),
              color: const Color(0xFF1F1E2E)
          ),
          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 12),
          margin:const EdgeInsets.only(left: 20.0,top :20,right: 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
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
                          Text('Adword',  style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 11, color: Colors.white)),
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
                          print(rating);
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
        const SizedBox(height: 70,),
      ],
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
