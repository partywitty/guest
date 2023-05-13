
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import '../../Utils/Styles.dart';

class bookingScreen extends StatefulWidget {
  const bookingScreen({Key? key}) : super(key: key);

  @override
  State<bookingScreen> createState() => _bookingScreenState();
}

class _bookingScreenState extends State<bookingScreen> with SingleTickerProviderStateMixin{
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: cardBackGround,
      appBar: AppBar(
        backgroundColor: cardBackGround,
        title: const Text("Booking",style: appBarText),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 5.0),
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Image.asset("assest/aleksandra-popov.png",fit: BoxFit.fill,width: width),
                  Positioned(
                    top: 0,
                    right: 0,
                    bottom: 0,
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF538AFF).withOpacity(0.9),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 20.0),
                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 10.0),
                                Image.asset("assest/off.png",width: 60,height: 40,fit: BoxFit.fill),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SizedBox(height: 20.0),
                                Text("A PARTYWITTY Coupon of\n ₹ 500 is waiting for you",style: bigTitle),
                                SizedBox(height: 2.0),
                                Text("Refer & earn",style: underLineText),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.calendar_month_outlined,color: Colors.white,size: 24,),
                            SizedBox(width: 10.0),
                            Text('Bookings', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500),),
                          ],
                        )),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assest/offer.png",color: Colors.white,fit: BoxFit.fill,width: 30,height: 30),
                            const SizedBox(width: 10.0),
                            const Text("Coupons", style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500)),
                          ],
                        )
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
                  ListView(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    children: [
                      const SizedBox(height: 25.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: appColor),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Column(
                          children: [
                            Image.asset("assest/upcoming.png",height: height/3,width: width/3,fit: BoxFit.contain),
                            const SizedBox(height: 10.0),
                            const Text("No upcoming booking or order available",style: drawerSubTitle),
                            const SizedBox(height: 10.0),
                            /// book now button
                            GestureDetector(
                              onTap: (){

                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 160,
                                height: 50.0,
                                decoration: const BoxDecoration(
                                  color: secondColor,
                                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                ),
                                child: const Text('Book Now',style: buttonText),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    children: const [
                      SizedBox(height: 25.0),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
