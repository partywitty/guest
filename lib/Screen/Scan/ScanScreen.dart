
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partywitty_guest/Utils/Styles.dart';

class ScanHome extends StatefulWidget {
  const ScanHome({Key? key}) : super(key: key);

  @override
  State<ScanHome> createState() => _ScanHomeState();
}

class _ScanHomeState extends State<ScanHome> with SingleTickerProviderStateMixin{
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: cardBackGround,
      appBar: AppBar(
        backgroundColor: cardBackGround,
        title: const Text("Scan",style: appBarText),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset("assest/sacn1.png",fit: BoxFit.fill,height: 200,width: width),
              Positioned(
                  right: 30,
                  top: 70,
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Colors.white70
                    ),
                    child:  Image.asset("assest/qr.png",fit: BoxFit.fill,height: 70,width: 70),
                  )
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                  child: Row(
                    children: [
                      Text("Search restaurant \nor Scan to pay",style: GoogleFonts.robotoSlab(textStyle: extraBoldText)),
                      Image.asset("assest/hand.png",fit: BoxFit.fill,height: 80)
                    ],
                  )),
            ],
          ),
          const SizedBox(height: 10.0),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            // color: Colors.black12,
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
                      children: [
                        Image.asset("assest/qr.png",color: Colors.white,fit: BoxFit.fill,width: 20,height: 20),
                        // Icon(Icons.account_balance_wallet_outlined,color: Colors.white,size: 24,),
                        const SizedBox(width: 10.0),
                        const Text('Checkout scan', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500),),
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
                          Image.asset("assest/qr.png",color: Colors.white,fit: BoxFit.fill,width: 20,height: 20),
                          const SizedBox(width: 10.0),
                          const Text("Payout Scan", style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500)),
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
                    SizedBox(
                      height: 220,
                      child: Stack(
                        children: [
                          Image.asset("assest/aleksandra-popov.png"),
                          Positioned(
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: pinkColor.withOpacity(0.7),
                                  )
                                ],
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width/2.5,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(height: 30.0),
                                        Text("Super \nEasy \nto Use",style: GoogleFonts.robotoSlab(textStyle: extraBoldText)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 1,
                              left: 5,
                              child:  Image.asset("assest/guest logo.png",width: 50,height: 50,fit: BoxFit.contain),),
                          SizedBox(
                            width: double.infinity,
                            child: ListView.builder(
                              padding: const EdgeInsets.only(left: 150),
                              itemCount: 1,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                      margin: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 5.0),
                                      width: 120,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(5.0)
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children:  [
                                          Image.asset("assest/qr2.png",width: 50,height: 50,fit: BoxFit.contain),
                                          const SizedBox(height: 5.0,),
                                          const Text("Step 1",style: drawerTitle),
                                          const SizedBox(height: 5.0,),
                                          const Text("It is a long esta\nblished fact that a\nreader wi",style: drawerSubTitle,textAlign: TextAlign.center),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 5.0),
                                      width: 120,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(5.0)
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children:  [
                                          Image.asset("assest/qr3.png",width: 50,height: 50,fit: BoxFit.contain),
                                          const SizedBox(height: 5.0,),
                                          const Text("Step 1",style: drawerTitle),
                                          const SizedBox(height: 5.0,),
                                          const Text("It is a long esta\nblished fact that a\nreader wi",style: drawerSubTitle,textAlign: TextAlign.center),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 5.0),
                                      width: 120,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(5.0)
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children:  [
                                          Image.asset("assest/qr2.png",width: 50,height: 50,fit: BoxFit.contain),
                                          const SizedBox(height: 5.0,),
                                          const Text("Step 1",style: drawerTitle),
                                          const SizedBox(height: 5.0,),
                                          const Text("It is a long esta\nblished fact that a\nreader wi",style: drawerSubTitle,textAlign: TextAlign.center),
                                        ],
                                      ),
                                    )
                                  ],
                                );
                              },),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),

                    Stack(
                      children: [
                        Image.asset("assest/offer5.png",fit: BoxFit.fill,width: width,height: height/1.3),
                        Positioned(
                          top: 0,
                          right: 0,
                          bottom: 0,
                          left: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.8),
                                )
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                  child: Text("FAQs",style: GoogleFonts.poppins(textStyle:  fff)),
                                ),
                                const Divider(color: Colors.grey),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                      child: Text("What is Checkout scan & Payout Scan?",style: GoogleFonts.poppins(textStyle:  drawerSubTitle),),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: Icon(Icons.add,size: 18,color: Colors.black,),
                                    ),
                                  ],
                                ),
                                const Divider(color: Colors.grey),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                      child: Text("Why should I use Checkout scan & Payout\n Scan?",style: GoogleFonts.poppins(textStyle:  drawerSubTitle)),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: Icon(Icons.add,size: 18,color: Colors.black,),
                                    ),
                                  ],
                                ),
                                const Divider(color: Colors.grey),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:  [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                      child: Text("It is a long established fact that a reader\nwill be distracted by the readable content?",style: GoogleFonts.poppins(textStyle:  drawerSubTitle)),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: Icon(Icons.add,size: 18,color: Colors.black,),
                                    ),
                                  ],
                                ),
                                const Divider(color: Colors.grey),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                      child: Text("It is a long established fact that a reader\nwill be distracted by the readable content?",style: GoogleFonts.poppins(textStyle:  drawerSubTitle)),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: Icon(Icons.add,size: 18,color: Colors.black,),
                                    ),
                                  ],
                                ),
                                const Divider(color: Colors.grey),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                      child: Text("It is a long established fact that a reader\nwill be distracted by the readable content?",style: GoogleFonts.poppins(textStyle:  drawerSubTitle)),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: Icon(Icons.add,size: 18,color: Colors.black,),
                                    ),
                                  ],
                                ),
                                const Divider(color: Colors.grey),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:  [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                      child: Text("It is a long established fact that a reader \nwill be distracted by the readable content?",style: GoogleFonts.poppins(textStyle:  drawerSubTitle)),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: Icon(Icons.add,size: 18,color: Colors.black,),
                                    ),
                                  ],
                                ),
                                const Divider(color: Colors.grey),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:  [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                      child: Text("It is a long established fact that a reader \nwill be distracted by the readable content?",style: GoogleFonts.poppins(textStyle:  drawerSubTitle)),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: Icon(Icons.add,size: 18,color: Colors.black,),
                                    ),
                                  ],
                                ),
                                const Divider(color: Colors.grey),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                      child: Text("Terms and conditions",style: drawerTitle,),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: Icon(Icons.arrow_forward_ios,size: 22,color: Colors.black,),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10.0),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Container(
                    //   color: transColor,
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    //         child: Text("FAQs",style: GoogleFonts.poppins(textStyle:  fff)),
                    //       ),
                    //       const Divider(color: Colors.black),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Padding(
                    //             padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    //             child: Text("What is Checkout scan & Payout Scan?",style: GoogleFonts.poppins(textStyle:  drawerSubTitle),),
                    //           ),
                    //           const Padding(
                    //             padding: EdgeInsets.only(right: 10.0),
                    //             child: Icon(Icons.add,size: 18,color: Colors.black,),
                    //           ),
                    //         ],
                    //       ),
                    //       const Divider(color: Colors.black),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Padding(
                    //             padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    //             child: Text("Why should I use Checkout scan & Payout\n Scan?",style: GoogleFonts.poppins(textStyle:  drawerSubTitle)),
                    //           ),
                    //           const Padding(
                    //             padding: EdgeInsets.only(right: 10.0),
                    //             child: Icon(Icons.add,size: 18,color: Colors.black,),
                    //           ),
                    //         ],
                    //       ),
                    //       const Divider(color: Colors.black),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children:  [
                    //           Padding(
                    //             padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    //             child: Text("It is a long established fact that a reader\nwill be distracted by the readable content?",style: GoogleFonts.poppins(textStyle:  drawerSubTitle)),
                    //           ),
                    //           const Padding(
                    //             padding: EdgeInsets.only(right: 10.0),
                    //             child: Icon(Icons.add,size: 18,color: Colors.black,),
                    //           ),
                    //         ],
                    //       ),
                    //       const Divider(color: Colors.black),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Padding(
                    //             padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    //             child: Text("It is a long established fact that a reader\nwill be distracted by the readable content?",style: GoogleFonts.poppins(textStyle:  drawerSubTitle)),
                    //           ),
                    //           const Padding(
                    //             padding: EdgeInsets.only(right: 10.0),
                    //             child: Icon(Icons.add,size: 18,color: Colors.black,),
                    //           ),
                    //         ],
                    //       ),
                    //       const Divider(color: Colors.black),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Padding(
                    //             padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    //             child: Text("It is a long established fact that a reader\nwill be distracted by the readable content?",style: GoogleFonts.poppins(textStyle:  drawerSubTitle)),
                    //           ),
                    //           const Padding(
                    //             padding: EdgeInsets.only(right: 10.0),
                    //             child: Icon(Icons.add,size: 18,color: Colors.black,),
                    //           ),
                    //         ],
                    //       ),
                    //       const Divider(color: Colors.black),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children:  [
                    //           Padding(
                    //             padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    //             child: Text("It is a long established fact that a reader \nwill be distracted by the readable content?",style: GoogleFonts.poppins(textStyle:  drawerSubTitle)),
                    //           ),
                    //           const Padding(
                    //             padding: EdgeInsets.only(right: 10.0),
                    //             child: Icon(Icons.add,size: 18,color: Colors.black,),
                    //           ),
                    //         ],
                    //       ),
                    //       const Divider(color: Colors.black),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children:  [
                    //           Padding(
                    //             padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    //             child: Text("It is a long established fact that a reader \nwill be distracted by the readable content?",style: GoogleFonts.poppins(textStyle:  drawerSubTitle)),
                    //           ),
                    //           const Padding(
                    //             padding: EdgeInsets.only(right: 10.0),
                    //             child: Icon(Icons.add,size: 18,color: Colors.black,),
                    //           ),
                    //         ],
                    //       ),
                    //       const Divider(color: Colors.black),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: const [
                    //           Padding(
                    //             padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    //             child: Text("Terms and conditions",style: drawerTitle,),
                    //           ),
                    //           Padding(
                    //             padding: EdgeInsets.only(right: 10.0),
                    //             child: Icon(Icons.arrow_forward_ios,size: 22,color: Colors.black,),
                    //           ),
                    //         ],
                    //       ),
                    //       const SizedBox(height: 10.0),
                    //     ],
                    //   ),
                    // ),
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
    );
  }
}
