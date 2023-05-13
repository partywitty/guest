
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Utils/Styles.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> with SingleTickerProviderStateMixin{
  TabController? _tabController;
  final double _height = Get.height, _width = Get.width;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      appBar: AppBar(
        backgroundColor: cardBackGround,
        title: Text("Event And Offer",style: GoogleFonts.poppins(textStyle: appBarText)),
      ),
      body: Column(
        children: [
          const SizedBox(height: 5.0),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 00.0),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 0.0),
            height: 50,
            child: TabBar(
              labelColor: Colors.white,
              controller: _tabController,
              isScrollable: true,
              indicatorWeight: 0.0,
              indicatorColor: Colors.grey,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: const EdgeInsets.symmetric(
                  horizontal: 10.0, vertical: 0.0),
              padding: const EdgeInsets.symmetric(
                  horizontal: 0.0, vertical: 5.0),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                // border: Border.all(color: tabBorderColor),
                color: secondColor,
              ),
              tabs: <Widget>[
                Tab(
                  child: Container(
                      alignment: Alignment.center,
                      width: 150,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: secondColor),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text('Event', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500),)),
                ),
                Tab(
                  child: Container(
                      alignment: Alignment.center,
                      width: 150,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: secondColor),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text("Offer", style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500))
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                     decoration: BoxDecoration(
                       color: drawerBackGround,
                       borderRadius: BorderRadius.circular(5.0),
                     ),
                    child: Row(
                      children: [
                        Stack(
                           children: [
                             Image.asset("assest/Mask2.png",height: _height*0.18,width: _width*0.35,fit: BoxFit.fill),
                             Positioned(
                               left: 5,
                                 top: 5,
                                 child: Container(
                                   padding: const EdgeInsets.symmetric(horizontal: 5),
                                   decoration: BoxDecoration(
                                     color: Colors.white54,
                                     borderRadius: BorderRadius.circular(5),
                                   ),
                                   child: const Text("30\nFeb",style: bannerTitle,textAlign: TextAlign.center),
                                 )
                             )
                           ],
                        ),
                        const SizedBox(width: 5.0),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("California party: 2022",style: labelText),
                              const SizedBox(height: 5.0),
                              Row(
                                children: const [
                                  Icon(Icons.access_time_rounded,color: Colors.white,size: 14),
                                  SizedBox(width: 5.0),
                                  Text("05:25 PM",style: textHint,)
                                ],
                              ),
                              const SizedBox(height: 5.0),
                              Row(
                                children: [
                                  const Icon(Icons.disc_full,color: Colors.white,size: 14),
                                  const SizedBox(width: 5.0),
                                  const Text("Sufi, Foke",style: textHint),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: (){},
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 3.0),
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                        color: appColor,
                                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                      ),
                                      child: Text('Book Now', style: GoogleFonts.poppins(textStyle: textHint)),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5.0),
                              Row(
                                children: [
                                  const Icon(Icons.location_pin,color: Colors.white,size: 14),
                                  const SizedBox(width: 5.0),
                                  const Text("California, CA",style: textHint),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: (){},
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 3.0),
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                      ),
                                      child: Text('₹ 5000/-', style: GoogleFonts.poppins(textStyle: buttonText)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },),
                Column(
                  children: [
                    const SizedBox(height: 25.0),
                    Row(
                      children: [
                        const SizedBox(width: 20.0),
                        Text("Offers/Deals",style: GoogleFonts.poppins(textStyle: cardTitle)),
                        const Spacer(),
                        const Text("View more",style: cardRupeeRed),
                        const SizedBox(width: 20.0),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                            child: Row(
                              children: [
                                DottedBorder(
                                  color: appColor,
                                  child: Container(
                                    width: _width*0.50,
                                    height: _height*0.20,
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5.0),
                                            bottomLeft: Radius.circular(5.0)
                                        )
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(height: 5.0),
                                        Text("Cafe on 3 - Holiday Inn",style: GoogleFonts.poppins(textStyle: greenText)),
                                        Text("40% OFF",style: GoogleFonts.poppins(textStyle: extraBoldText)),
                                        Text("Get 20 pts on Bill",style: GoogleFonts.poppins(textStyle: cardTime)),
                                        const SizedBox(height: 5.0),
                                        Row(
                                          children: [
                                            Text("Feb 30, 2022 ",style: GoogleFonts.poppins(textStyle: cardTime)),
                                            const Icon(Icons.access_time_rounded,color: Colors.grey,size: 14),
                                            Text(" 05:25 PM",style: GoogleFonts.poppins(textStyle: cardTime)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.location_pin,color: Colors.grey,size: 24),
                                            Text("California, CA",style: GoogleFonts.poppins(textStyle: fillText)),
                                          ],
                                        ),
                                        const SizedBox(height: 5.0),
                                        Row(
                                          children: [
                                            const Spacer(),
                                            Text("Terms and Conditions *",style: GoogleFonts.poppins(textStyle: cardTime)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                    child: Image.asset("assest/Mask2.png",
                                      fit: BoxFit.fill,width: _width*0.50,height: _height*0.21,)
                                )
                              ],
                            ),
                          );
                        },),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
