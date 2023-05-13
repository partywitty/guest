
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partywitty_guest/Modal/couponM.dart';
import 'package:partywitty_guest/Screen/home/searchPage.dart';
import 'package:partywitty_guest/Utils/Styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../Api_service/API_link.dart';
import '../../Api_service/homeApi.dart';
import '../../Auth/gettingStart.dart';
import '../../Auth/login_page.dart';
import '../../Auth/notificationPage.dart';
import '../../Modal/bestofferM.dart';
import '../../Modal/bottomBanner.dart';
import '../../Modal/generesM.dart';
import '../../Modal/happenningPartyM.dart';
import '../../Modal/highlyRecM.dart';
import '../../Modal/middlebanner.dart';
import '../../Modal/newOnM.dart';
import '../../Modal/popularClubM.dart';
import '../../Modal/promocodeM.dart';
import '../../Modal/topbanner.dart';
import '../../Modal/topclubM.dart';
import '../../Utils/sharepref.dart';
import '../Event/EventPage.dart';
import '../about.dart';
import '../bottle_deal.dart';
import '../drinkFish_Deal.dart';
import '../guest_wallets.dart';
import '../jump_start_deal.dart';
import '../privateParty.dart';
import '../restaurant_deals.dart';
import 'clubAllDeals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController=ScrollController();
  void scrollup(){
    scrollController.animateTo(scrollController.offset-200, duration: const Duration(milliseconds: 500),
        curve: Curves.linear);
  }
  void scrolldown(){
    scrollController.animateTo(scrollController.offset+200, duration: const Duration(milliseconds: 500),
        curve: Curves.linear);
  }
  List<String> listPaths = [
    "assest/live-music 1.png",
    "assest/dj_img.png",
    "assest/menu 1.png",
    "assest/deal 1.png",
    "assest/meals .png",
  ];

  List<TopbannerData> topbanner=[];
  List<MiddlebannerData> middlebanner=[];
  List<BestofferData> bestoffer=[];
  List<HighlyRecData> highlyRec=[];
  List<TopclubData> topClub=[];
  List<HappenningPartyData> happeningParty=[];
  List<BottomBannerData> bottomBanner=[];
  List<GeneresData> generes=[];
  List<NewOnData> newOn=[];
  List<PopularClubData> popularClub=[];
  List<CouponData> coupon=[];
  List<PromocodeData> promoCode=[];

  int currentPos = 0;
  var drawerselect;
  final getUserDetail = GetUserDetail();
  var email;
  var name;
  var contact;
  @override
  void initState() {
    super.initState();
    load();
  }
  load()async{
    email = await getUserDetail.getUserData("email");
    name = await getUserDetail.getUserData("name");
    contact = await getUserDetail.getUserData("contact");
    homeApi().topbanner().then((value) {
      setState((){
        topbanner=value.data!;
      });
    });
    homeApi().middlebanner().then((value) {
      setState((){
        middlebanner=value.data!;
      });
    });
    homeApi().BestOfferapi().then((value) {
      setState((){
        bestoffer=value.data!;
      });
    });
    homeApi().Topclubapi().then((value) {
      setState((){
        topClub = value.data!;
      });
    });
    homeApi().HighlyRecMapi().then((value) {
      setState((){
        highlyRec = value.data!;
      });
    });
    homeApi().HappenningPartyapi().then((value) {
      setState((){
        happeningParty = value.data!;
      });
    });
    homeApi().BottomBannerapi().then((value) {
      setState((){
        bottomBanner = value.data!;
      });
    });
    homeApi().Generesapi().then((value) {
      setState((){
        generes = value.data!;
      });
    });
    homeApi().NewOnapi().then((value) {
      setState((){
        newOn = value.data!;
      });
    });
    homeApi().PopularClubapi().then((value) {
      setState((){
        popularClub = value.data!;
      });
    });
    homeApi().couponApi().then((value) {
      setState((){
        coupon = value.data!;
      });
    });
    homeApi().promoCodeApi().then((value) {
      setState((){
        promoCode = value.data!;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF141420),
      drawer:getDrawer(context),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1E2E),
        centerTitle: true,
        title:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Near Tower Square", style: cardSubtitle),
            Icon(Icons.arrow_drop_down,color: Colors.white,size: 24)
          ],
        ),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage(),));
            },
              child: const Icon(Icons.search,color: Colors.white,size: 24)),
          const SizedBox(width: 5.0),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const notification()));
            },
              child: const Icon(Icons.notifications_none_sharp,color: Colors.white,size : 24)),
          const SizedBox(width: 10.0),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
          physics: const ScrollPhysics(),
          children:[
            const SizedBox(height: 5.0),
            SizedBox(
              height: 100,
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: [
                  InkWell(
                    onTap : (){
                      Navigator.pushNamed(context,'/Live_music_page');
                    },
                    child: Container(
                      height: 90,
                      width: 80,
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
                              child: Image.asset("assest/event.png",fit: BoxFit.fill,)),
                          const SizedBox(height: 2,),
                          const Text('Event', textAlign: TextAlign.center, style: cardSubtitle),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                    //  Navigator.push(context,MaterialPageRoute(builder: (c)=>Club_deal()));
                      Navigator.push(context,MaterialPageRoute(builder: (c)=> const clubAllDeal()));
                    },
                    child: Container(
                      height: 90,
                      width: 80,
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
                              width:45,
                              height: 40,
                              child: Image.asset("assest/dj_img.png",fit: BoxFit.fill,)),
                          const SizedBox(height: 2,),
                          const Text('Club \n Deals', textAlign: TextAlign.center, style: cardSubtitle),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (c)=>const Restaurant_deals()));
                    },
                    child: Container(
                      height: 90,
                      width: 80,
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
                              child: Image.asset("assest/food-tray 1.png",fit: BoxFit.fill,)),
                          const SizedBox(height: 2,),
                          const Text('Restaurant \n Deals', textAlign: TextAlign.center, style: cardSubtitle),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (c)=>const BottleDeals()));
                    },
                    child: Container(
                      height: 90,
                      width: 80,
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
                              child: Image.asset("assest/liquor.png",fit: BoxFit.fill,)),
                          const SizedBox(height: 2,),
                          const Text('Full Bottle \n Deals', textAlign: TextAlign.center, style: cardSubtitle),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (c)=>const JumpStartDeals()));
                    },
                    child: Container(
                      height: 90,
                      width: 80,
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
                              child: Image.asset("assest/wall-clock 1.png",fit: BoxFit.fill,)),
                          const SizedBox(height: 2,),
                          const Text('Jump Start \n Deals', textAlign: TextAlign.center, style: cardSubtitle),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (c)=>const DrinkFishDeal()));
                    },
                    child: Container(
                      height: 90,
                      width: 80,
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
                              width:45,
                              height: 40,
                              child: Image.asset("assest/fish 1.png",fit: BoxFit.fill,)),
                          const SizedBox(height: 2,),
                          const Text('Drink Like \n a Fish', textAlign: TextAlign.center, style: cardSubtitle),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.20,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  // enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction:0.90,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentPos = index;});
                  }),
              items:topbanner.map((item) =>
                  Padding(
                    padding: const EdgeInsets.only(left:10,top:8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: Image.network(Api_link.imageUrl+item.banner.toString(),fit: BoxFit.fill,height: 180,)),
                          // Positioned(
                          //     top: 10,
                          //     left: 10,
                          //     child: Container(
                          //       alignment: Alignment.center,
                          //       padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                          //       decoration: BoxDecoration(
                          //         color:Color(0xFFFE262F),
                          //         borderRadius: BorderRadius.circular(2.0),
                          //       ),
                          //       child:const Text('Get 1000 OFF',style: cardTitle) ,
                          //     )),
                          // Positioned(
                          //     top: 40,
                          //     left: 10,
                          //     child: Text('every time you \neat out. Forever!',style: cardTitle)),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(10.0),
                                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  gradient: const LinearGradient(
                                    begin: FractionalOffset(0.1, 0.1),
                                    end: FractionalOffset(0.8, 0.1),
                                    colors: [Color(0xFFFE262F),Color(0xFFFD2F71),
                                    ],
                                  ),
                                ),
                                child:const Text('JOIN NOW',style: cardSubtitle) ,
                              )),
                          // Positioned(
                          //    top: 10,
                          //     left: 5,
                          //     child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Container(
                          //           alignment: Alignment.center,
                          //           padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                          //           decoration: BoxDecoration(
                          //             borderRadius: BorderRadius.circular(5.0),
                          //             gradient: const LinearGradient(
                          //               begin: FractionalOffset(0.1, 0.1),
                          //               end: FractionalOffset(0.8, 0.1),
                          //               colors: [Color(0xFFFE262F),Color(0xFFFD2F71),
                          //               ],
                          //             ),
                          //           ),
                          //           child:const Text('Get ₹1000 OFF',style: cardSubtitle) ,
                          //         ),
                          //         const Text('every time you\neat out. Forever!',style: boldText),
                          //       ],
                          //     )),
                        ],
                      )
                    ),
                  ),
              ).toList(),),
            const Padding(
              padding: EdgeInsets.only(left: 15.0,top :10.0,bottom: 8),
              child: Text('Best Offers', style: cardTitle),
            ),
            SizedBox(
              height: 130,
              child: ListView.builder(
                itemCount: bestoffer.length,
                padding: const EdgeInsets.only(left: 10.0,),
                physics:const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx,i){
                  var data =bestoffer[i];
                  return  Container(
                    margin: const EdgeInsets.all(5.0),
                    child: Stack(
                      children: [
                        Image.network(Api_link.imageUrl+data.image.toString(),width: 85,height: 130,fit: BoxFit.fill),
                        Positioned(
                            right: 0,
                            left: 0,
                            bottom: 0,
                            top: 10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment :  CrossAxisAlignment.center,
                              children: [
                                Text("${data.off.toString()}%",style: cardTitle),
                                const Text("OFF",style: extraBoldText),
                                const SizedBox(height: 25.0,),
                                Text(data.offer.toString(),style: cardSubtitle,textAlign: TextAlign.center),
                              ],
                            ))
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 15.0,top :15.0,bottom: 10),
                  child: Text('Highly Recommended', style: cardTitle),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0.0,top: 10,right: 10.0,bottom: 10),
                  child: Text('View all',style:redTitle),
                ),
              ],
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
                shrinkWrap: true,
                physics:const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: highlyRec.length,
                itemBuilder: (ctx,i){
                  var data =highlyRec[i];
                  return  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child:Image.network(Api_link.imageUrl+data.image.toString(),width: 120 ,height: 110,fit: BoxFit.fill),
                            ),
                            // Positioned(
                            //     bottom: 7,
                            //     right: 10,
                            //     child: Container(
                            //       padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 2.0),
                            //       decoration: BoxDecoration(
                            //           color: Colors.green,
                            //           borderRadius: BorderRadius.circular(20.0)
                            //       ),
                            //       child: Text("4.5",style: textHint),
                            //     ))
                          ],
                        ),
                        const SizedBox(height: 5.0),
                        Text(data.clubName.toString(),style: appBarText,textAlign: TextAlign.center),
                        const SizedBox(height: 2.0),
                        Text(data.address.toString(),style: cardSubtitle,textAlign: TextAlign.center,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset('assest/offer.png',fit: BoxFit.fill,height: 30,width: 30,),
                            Text("${data.off.toString()}% OFF ",style: redText,)
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: width,
              height: 155,
              child: ListView.builder(
                  padding: const EdgeInsets.only(left: 15),
                  scrollDirection:Axis.horizontal,
                  itemCount: middlebanner.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (ctx,index){
                    var data =middlebanner[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child:Image.network(Api_link.imageUrl+data.banner.toString(),
                        fit: BoxFit.fill,
                        width: 290,
                            height: 145),
                      ),
                    );
                  }),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0,top: 20,bottom: 15),
              child: Text('Top Clubs',  style:cardTitle),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                      height: 85,
                      child:  ListView.builder(
                        controller: scrollController,
                        itemCount: topClub.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var data = topClub[index];
                          return InkWell(
                            onTap:(){},
                            child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Container(
                                  padding: const EdgeInsets.only(top: 10,bottom:2),
                                  width: 90,
                                  height: 85,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(image: NetworkImage(Api_link.imageUrl+data.image.toString()),fit: BoxFit.fill),
                                      color: Colors.white, borderRadius: BorderRadius.circular(3)
                                  ),
                                )
                            ),
                          );
                        },)
                  ),
                ),
                SizedBox(
                    width: 25,
                    child: IconButton(onPressed: (){
                      scrolldown();
                    },
                        icon: const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 18,)))
              ],
            ),
            const SizedBox(height: 25.0),
            SizedBox(
              height: 250,
              child: Stack(
                children: [
                  Image.asset("assest/music7.png"),
                  Positioned(
                    top: 0,
                    right: 0,
                    bottom: 0,
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF538AFF).withOpacity(0.7),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: width/2.5,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 0.0),
                                  Image.asset("assest/guest logo.png",width: 50,height: 50,fit: BoxFit.contain),
                                  const SizedBox(height: 10.0),
                                  Text("Happening",style: GoogleFonts.robotoSlab(textStyle: cardTitle)),
                                  const SizedBox(height: 5.0),
                                  Text("Party",style: GoogleFonts.robotoSlab(textStyle: extraBoldText)),
                                  const SizedBox(height: 10.0),
                                  const Text("It is a long established fact that a reader will be distracted by the readable content", style: cardSubtitle,textAlign: TextAlign.start),
                                  const SizedBox(height: 20.0),
                                  Container(
                                    width: width/4,
                                    // height: 20,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      gradient: const LinearGradient(
                                        begin: FractionalOffset(0.1, 0.1),
                                        end: FractionalOffset(0.8, 0.1),
                                        colors: [Color(0xFFFE262F),Color(0xFFFD2F71),
                                        ],
                                      ),
                                    ),
                                    child: const Text('View All',style: buttonText) ,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ListView.builder(
                      physics:const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(left: 150),
                      itemCount: happeningParty.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var data = happeningParty[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Container(
                                    margin: const EdgeInsets.all(10.0),
                                    height: height/5,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(7.0),
                                      child: Image.network(Api_link.imageUrl+data.image.toString(),fit: BoxFit.fill,width: 150,height: 140,),
                                    )
                                ),
                                 Positioned(
                                  left: 20,
                                    top: 20,
                                    child: SizedBox(
                                      width: 140,
                                      child: Text(data.clubName.toString(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,style: appBarText,),
                                    )),
                                // const Positioned(
                                //     left: 20,
                                //     bottom: 20,
                                //     child: Text("Upto \n20% Off",style: appBarText,)),
                                // Positioned(
                                //     right: 20,
                                //     bottom: 20,
                                //     child: Container(
                                //       width: width/5,
                                //       // height: 20,
                                //       alignment: Alignment.center,
                                //       padding:  EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                                //       decoration: BoxDecoration(
                                //         borderRadius: BorderRadius.circular(5.0),
                                //         gradient: const LinearGradient(
                                //           begin: FractionalOffset(0.1, 0.1),
                                //           end: FractionalOffset(0.8, 0.1),
                                //           colors: [Color(0xFFFE262F),Color(0xFFFD2F71),
                                //           ],
                                //         ),
                                //       ),
                                //       child: Text('JOIN',style: buttonText) ,
                                //     ),),
                              ],
                            ),
                          ],
                        );
                      },),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),
            CarouselSlider(
              options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 16 / 8,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.20,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  // enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction:0.90,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentPos = index;});
                  }),
              items:bottomBanner.map((item) =>
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Stack(
                          children: [
                            Image.network(Api_link.imageUrl+item.image.toString(),fit: BoxFit.fill,height: 160),
                            Positioned(
                                top: 0,
                                right: 10,
                                child: Image.asset("assest/guest logo.png",width: 50,height: 50,fit: BoxFit.contain)),
                            Positioned(
                                top: 0,
                                left: 0,
                                bottom: 0,
                                right: 0,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10.0),
                                    Text('Garrison The Club',style: GoogleFonts.robotoMono(textStyle: boldText)),
                                    const SizedBox(height: 5.0),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("ART",style: GoogleFonts.robotoSerif(textStyle: boldText)),
                                        Text("IST",style: GoogleFonts.robotoSerif(textStyle: boldText)),
                                        Text("NAME",style: GoogleFonts.robotoSerif(textStyle: boldText)),
                                      ],
                                    ),
                                    const SizedBox(height: 8.0),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Text("Sunday",style: cardSubtitle),
                                        SizedBox(width: 25,),
                                        Text("15.01.2023",style: cardSubtitle),
                                        SizedBox(width: 20,),
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
            const SizedBox(height: 15.0),
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
                      height: 130,
                      width: width,
                      child: ListView.builder(
                        itemCount: generes.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (c,i){
                          var data = generes[i];
                          return  Stack(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset("assest/dance1.png",height: 100,width: 90,fit: BoxFit.fill,),
                                  // Image.network("${Api_link.imageUrl+data.image.toString()}",height: 100,width: 100,fit: BoxFit.fill,),
                                ),
                              ),
                              Positioned(
                                  bottom: 0,
                                  left: 0,
                                  top: 0,
                                  right: 0,
                                  child: Center(
                                      child: Text(data.name.toString(),style: GoogleFonts.robotoSerif(textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white)),textAlign: TextAlign.center,)))
                            ],
                          );
                        },
                      ),
                    ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0,top: 15,bottom: 15),
              child: Text('New on Party Witty',  style:cardTitle),
            ),
            SizedBox(
              height: height/4.4,
              width: width,
              child: ListView.builder(
              itemCount: newOn.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 5.0),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (c,i){
                    var data = newOn[i];
                    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Image.network(Api_link.imageUrl+data.photo.toString(),height: height/8.5,width: width/2.7,fit: BoxFit.fill,),
                            Positioned(
                                top: 10,
                                left: 15,
                                child: Column(
                                  children:  [
                                    Text('${data.off.toString()}%',style: cardTitle,),
                                    const Text("OFF",style: boldText,),
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
                                  child:  Text(data.rating.toString(),),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5.0),
                       Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(data.eventName.toString(),style: bannerTitle),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,top: 2.0),
                        child: Row(
                          children: [
                             Text("₹ ${data.fee.toString()}/-",style: priceCut),
                            const SizedBox(width: 20.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                const SizedBox(height: 5.0,),
                                Text("₹ ${data.entryFees.toString()}/-",style: cardSubtitle),
                                const Text("Inc. of all taxes",style: cardTime),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );},

              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 15.0,top: 5),
                  child: Text('Popular Clubs',style:cardTitle),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0.0,right: 10.0,top: 5),
                  child: Text('View all',style:redTitle),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              height: height/3.4,
              width: width,
              child: ListView.builder(
                  itemCount: popularClub.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 5.0),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (c,i){
                    var data= popularClub[i];
                return
                  Stack(
                    children: [
                      Container(
                        height: height/3.4,
                        width: width/2.2,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(Colors.grey.withOpacity(0.7), BlendMode.dstATop),
                            image:  NetworkImage(Api_link.imageUrl+data.image.toString()),
                          )
                       ),
                        margin: const EdgeInsets.only(left: 15.0,top: 10),
                      ),
                      Positioned(
                          left: 20,
                          bottom: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:  [
                              Text(data.name.toString(),style: bigTitle,),
                              // Text("3 Places",style: bannerTitle,),
                            ],
                          )),
                      Positioned(
                          right: 5,
                          bottom: 5,
                          child: Container(
                            alignment: Alignment.bottomRight,
                            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2.0),
                            decoration: BoxDecoration(
                              color: cardBackGround,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Row(
                              children: const [
                                Text("₹800 -",style: smallText,),
                                Text("₹800",style: smallText,),
                              ],
                            ),
                          )),
                    ],
                  );
                  }
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0,top: 20,bottom: 10),
              child: Text('Recommended nearbuy!',  style:cardTitle),
            ),
            SizedBox(
              height: height/3.8,
              width: width,
              child: ListView(
                physics:const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 15.0,top: 10),
                        child: Stack(
                          children: [
                            Image.asset("assest/hotal1.png",height: height/6,width: width/1.9,fit: BoxFit.fill,),
                            Positioned(
                                top: 10,
                                left: 15,
                                child: Column(
                                  children: const [
                                    Text("40%",style: cardTitle,),
                                    Text("OFF",style: boldText,),
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
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text("Castle Barbeque ",style: bannerTitle),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,top: 2.0),
                        child: Row(
                          children: [
                            const Text("₹ 2000/-",style: priceCut),
                            const SizedBox(width: 10.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SizedBox(height: 5.0,),
                                Text("₹ 2000/-",style: cardSubtitle),
                                Text("Inc. of all taxes",style: cardTime),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        child: Stack(
                          children: [
                            Image.asset("assest/hotal2.png",height: height/6,width: width/1.9,fit: BoxFit.fill,),
                            Positioned(
                                top: 10,
                                left: 15,
                                child: Column(
                                  children: const [
                                    Text("40%",style: cardTitle,),
                                    Text("OFF",style: boldText,),
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
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text("Castle Barbeque",style: bannerTitle),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,top: 2.0),
                        child: Row(
                          children: [
                            const Text("₹ 2000/-",style: priceCut),
                            const SizedBox(width: 10.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SizedBox(height: 5.0,),
                                Text("₹ 2000/-",style: cardSubtitle),
                                Text("Inc. of all taxes",style: cardTime),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        child: Stack(
                          children: [
                            Image.asset("assest/hotal3.png",height: height/6,width: width/1.9,fit: BoxFit.fill,),
                            Positioned(
                                top: 10,
                                left: 15,
                                child: Column(
                                  children: const [
                                    Text("40%",style: cardTitle,),
                                    Text("OFF",style: boldText,),
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
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text("Castle Barbeque",style: bannerTitle),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,top: 2.0),
                        child: Row(
                          children: [
                            const Text("₹ 2000/-",style: priceCut),
                            const SizedBox(width: 10.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SizedBox(height: 5.0,),
                                Text("₹ 2000/-",style: cardSubtitle),
                                Text("Inc. of all taxes",style: cardTime),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 15.0,top: 0,bottom: 8.0),
                  child: Text('Coupon',  style:cardTitle),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.0,top: 15,bottom: 8),
                  child: Text('View all',  style: redText),
                ),
              ],
            ),
            CarouselSlider(
              options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.35,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  // enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction:0.90,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentPos = index;});
                  }),
              items:coupon.map((item) =>
                  Padding(
                    padding: const EdgeInsets.only(left:10,top:8.0),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: 300,
                              width: 330,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      colorFilter: ColorFilter.mode(Colors.grey.withOpacity(0.5), BlendMode.dstATop),
                                      image:  NetworkImage(Api_link.imageUrl+item.image.toString()),
                                  )
                              ),
                            ),
                            Positioned(
                                top: 0,
                                right: 10,
                                child: Image.asset("assest/guest logo.png",width: 50,height: 50,fit: BoxFit.contain)),
                            const Positioned(
                                bottom: 0,
                                left: 0,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 5,left: 10),
                                  child: Text("T & C.",style: redText),
                                ),
                            ),
                            Positioned(
                                top: 5,
                                left: 15,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 5.0),
                                    Container(
                                      margin: const EdgeInsets.only(left: 5.0),
                                      alignment: Alignment.center,
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children:  [
                                          const Text("UP TO",style: cardSubtitle),
                                          Text("${item.off.toString()}%",style: bigTitle),
                                          const Text("OFF",style: cardSubtitle),
                                        ],
                                      ),
                                    ),
                                     Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Up to ${item.off.toString()}% off, deal of the day \nand other great offers",
                                      style: smallText),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.all(5.0),
                                      child: DottedBorder(
                                        radius: const Radius.circular(5.0),
                                        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                                        color: secondColor,
                                        strokeWidth: 1,
                                        child: const Text("Z O M T J P W I",style: appBarText,),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 5.0),
                                      child: Text("Copy Code",style: smallText,textAlign: TextAlign.start),
                                    ),
                                  ],
                                )),
                          ],
                        )
                    ),
                  ),
              ).toList(),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 15.0,top: 20),
                  child: Text('Promo Codes for Extra savings',  style:cardTitle),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.0,top: 15),
                  child: Text('View all',  style: redText),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Container(
              margin: const EdgeInsets.all(5.0),
                child: Image.asset('assest/off.png',fit: BoxFit.fill,height: 180)),
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

  Future<void> scratchDialog(BuildContext context) {
    return showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: const EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: StatefulBuilder(builder: (context, StateSetter setState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset("assest/star.png",fit: BoxFit.fill),
                      Positioned(
                         left: 0,
                        right: 0,
                        bottom: 0,
                          child: Stack(
                            children: [
                              Center(child: Image.asset("assest/timer.png",fit: BoxFit.fill)),
                              Positioned(
                                bottom: 0,
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  child: Center(child: Image.asset("assest/mainlogo.png",fit: BoxFit.fill,height: 40))
                              ),
                              Positioned(
                                top: 5,
                                  right: 85,
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                      child: const Icon(Icons.cancel,color: Colors.white)))
                            ],
                          ))
                    ],
                  ),
                 const SizedBox(height: 20),
                 // Image.asset("assest/bomb.png",fit: BoxFit.fill,height: 100),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("condition :",style: drawerSubTitle,),
                        Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",style: drawerSubTitle,),
                      ],
                    ),
                  ),
                ],
              );
            }),
          );
        }
    );
  }

  getDrawer(context){
    return SizedBox(
      width: 320,
      child: Drawer(
        backgroundColor: Colors.black,
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Container(
              color: drawerBackGround,
              padding: const EdgeInsets.only(top: 10.0,left: 20.0,right: 20.0,bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.verified_user_rounded,color: Colors.green,size: 20),
                  Row(
                    children: [
                      Container(
                        decoration : BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: Colors.yellow,
                        ),
                        child: const Icon(Icons.person,size: 100,color: Colors.grey,),
                      ),
                      const SizedBox(width: 20.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("$name",style: bigTitle),
                          const SizedBox(height: 10.0,),
                          Row(
                            children: [
                              const Icon(Icons.email,color: Colors.white,size: 18),
                              const SizedBox(width: 5.0),
                              Text("$email",style: textHint),
                            ],
                          ),
                          const SizedBox(height: 10.0,),
                          Row(
                            children: [
                              const Icon(Icons.call,color: Colors.white,size: 18),
                              const SizedBox(width: 5.0),
                              Text("$contact",style: textHint),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Spacer(),
                      Icon(Icons.edit_note_sharp,size: 25,color: Colors.white),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                children: [
                  const SizedBox(height: 10.0),
                  Container(
                    color: drawerBackGround,
                    child: ListTile(
                      leading: const Icon(Icons.account_balance_wallet_outlined, size: 22,color: Colors.white),
                      title: const Text("Wallet",style: labelText),
                      trailing:  const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Guest_wallet(club_id: "1"),));
                      },
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    color: drawerBackGround,
                    child: ListTile(
                      leading: const Icon(Icons.thumb_up, size: 22,color: Colors.white),
                      title: const Text("My Favorites",style: labelText),
                      trailing:  const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const About(),));
                      },
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    color: drawerBackGround,
                    child: ListTile(
                      leading: const Icon(Icons.notifications_none, size: 22,color: Colors.white),
                      title: const Text("Notifications",style: labelText),
                      trailing:  const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const notification(),));
                      },
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    color: drawerBackGround,
                    child: ListTile(
                      leading: const Icon(Icons.credit_card, size: 22,color: Colors.white),
                      title: const Text("My Scratch Cards",style: labelText),
                      trailing:  const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const EventScreen(),));
                      },
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    color: drawerBackGround,
                    child: ListTile(
                      leading: const Icon(Icons.info_outline, size: 22,color: Colors.white),
                      title: const Text("About Us",style: labelText),
                      trailing:  const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const gettingReady(),));
                      },
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    color: drawerBackGround,
                    child: ListTile(
                      leading: const Icon(Icons.library_books_rounded, size: 22,color: Colors.white),
                      title: const Text("Reviews",style: labelText),
                      trailing:  const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const gettingReady(),));
                      },
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    color: drawerBackGround,
                    child: ListTile(
                      leading: const Icon(Icons.library_books_rounded, size: 22,color: Colors.white),
                      title: const Text("Blog",style: labelText),
                      trailing:  const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const gettingReady(),));
                      },
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    color: drawerBackGround,
                    child: ListTile(
                      leading: const Icon(Icons.support_agent_sharp, size: 22,color: Colors.white),
                      title: const Text("Help / Faq",style: labelText),
                      trailing:  const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const gettingReady(),));
                      },
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    color: drawerBackGround,
                    child: ListTile(
                      leading: const Icon(Icons.verified_outlined, size: 22,color: Colors.white),
                      title: const Text("Legal",style: labelText),
                      trailing:  const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const gettingReady(),));
                      },
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    color: drawerBackGround,
                    child: ListTile(
                      leading: const Icon(Icons.support_agent_sharp, size: 22,color: Colors.white),
                      title: const Text("Services at party witty",style: labelText),
                      trailing:  const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const gettingReady(),));
                      },
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: (){
                          setState((){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Privateparty(),));
                            drawerselect=1;
                          });
                        },
                        child: Container(
                          height: 105,
                          width:125,
                          decoration: BoxDecoration(
                              color: drawerBackGround,
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: drawerselect==1?appColor:Colors.transparent)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assest/glass.png",scale: 3.5,),
                              const SizedBox(height: 2),
                              const Text("Book a Venue for Private Party",
                                  textAlign: TextAlign.center,style: labelText),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState((){
                            drawerselect=2;
                          });
                        },
                        child: Container(
                          height: 105,
                          width:125,
                          decoration: BoxDecoration(
                              color: drawerBackGround,
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: drawerselect==2?appColor:Colors.transparent)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.mic,color: appColor,size: 20),
                              const SizedBox(height: 2,),
                              const Text("Book a Artist for Private Party",
                                  textAlign: TextAlign.center,style: labelText),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  TextButton(
                      onPressed: ()async{
                        final getUserId=GetUserDetail();
                        await getUserId.remove('id');
                        Get.to(() => const Login_page());
                      },
                      child: Text("Sign Out",
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.grey),
                      )
                  ),
                  const SizedBox(height: 30.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


