import 'package:cc_avenue/cc_avenue.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partywitty_guest/Utils/Styles.dart';
import '../Api_service/claim_api.dart';
import '../Api_service/login_api.dart';
import '../Modal/cardDetailsM.dart';

class ViewCard extends StatefulWidget {
  const ViewCard({Key? key}) : super(key: key);

  @override
  State<ViewCard> createState() => _ViewCardState();
}

class _ViewCardState extends State<ViewCard> {

  List<Cart> cardDataList = [];

  Future<void> initPlatformState() async {
    try {
      await CcAvenue.cCAvenueInit(
          transUrl: 'https://secure.ccavenue.com/transaction/initTrans',
          accessCode: '4YRUXLSRO20O8NIH',
          amount: '1',
          cancelUrl: 'http://122.182.6.216/merchant/ccavResponseHandler.jsp',
          currencyType: 'INR',
          merchantId: '2',
          orderId: '519',
          redirectUrl: 'http://122.182.6.216/merchant/ccavResponseHandler.jsp',
          rsaKeyUrl: 'https://secure.ccavenue.com/transaction/jsp/GetRSA.jsp'
      );
    } on PlatformException {
      print('PlatformException---------------plat');
    }
  }

  var totalPay;
  load(){
    AddProductApi().cardDetailApi().then((value){
      setState(() {
        cardDataList = value.data!.cart!;
        totalPay = value.data!.totalPayble;
      });
    });
  }
  @override
  void initState() {
    load();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20,top: 30,left: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFF1F1E2E),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 3,),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Image.asset('assest/music_mic.png',scale: 4.3,)),
                  const SizedBox(width: 10,),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Lord of the Drinks Chamber ',  style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14, color: Colors.white)),
                        const SizedBox(height:4,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.location_on,size: 15,color: Colors.white,),
                            const SizedBox(width: 2,),
                            Flexible(
                              child: Text('670.5 km away, Rajouri Garden Main Market, Rajouri Garden ',  style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10, color: Colors.white)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 25.0, right: 20, left:20,),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cardDataList.length,
                  itemBuilder: (context, index) {
                    var data = cardDataList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
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
                                    Text('${data.bought} bought',style: GoogleFonts.poppins(textStyle: cardGreyText)),
                                    SizedBox(
                                      width:140,
                                      child: Text('${data.name}',style: GoogleFonts.poppins(textStyle: labelText)),
                                    ),
                                    const SizedBox(height: 5,),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text('Timing',style: GoogleFonts.poppins(textStyle: cardSubtitle)),
                                            Text('Valid for',style: GoogleFonts.poppins(textStyle: cardSubtitle)),
                                          ],
                                        ),
                                        // SizedBox(width: 30,),
                                        const SizedBox(width: 25,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
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
                                                child: const Icon(Icons.arrow_drop_down_circle_outlined,color: Color(0xFF008AD8),size: 20)),
                                            Text('2 People', style: GoogleFonts.poppins(textStyle: cardSubtitle)),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5,),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        LoginApi().deleteCardApi(context: context,dealId: data.id.toString()).then((value) {
                                          setState(() {
                                            load();
                                          });
                                        });
                                      },
                                        child: const Icon(Icons.delete_forever_outlined,color: appColor,size: 24,)),
                                    Text('MSP- ${data.maxPrice}',style: GoogleFonts.poppins(textStyle: cardSubtitle)),
                                    const SizedBox(height: 6,),
                                    Container(
                                      height:15,
                                      padding: const EdgeInsets.only(left: 7,right: 5,),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3),
                                          border: Border.all(color: Colors.green)
                                      ),
                                      child: Text('56% OFF',style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                      ),),
                                    const SizedBox(height: 30,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        const Text("₹6500",
                                          style: TextStyle(
                                              decoration: TextDecoration.lineThrough,
                                              fontWeight: FontWeight.w300,fontSize: 9,color: Color(0xFF919191)),),
                                        const SizedBox(width: 5,),
                                        Text("₹3500/-",style: const TextStyle(fontWeight: FontWeight.w300,fontSize: 11,color: Color(0xFFFD2F71)),),
                                      ],
                                    ),
                                    const SizedBox(height: 3,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: const [
                                        Text("Saved", style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: Color(0xFF158203)),),
                                        SizedBox(width: 5,),
                                        Text("₹2000/-",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: Color(0xFF158203)),),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    );
                  })
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 20, left:20,),
            child: Container(
                decoration: BoxDecoration(color: const Color(0xFF1F1E2E),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(9),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                         SizedBox(
                             width: 40,
                             height: 40,
                             child: Stack(
                               alignment: Alignment.center,
                               children: [
                                 Image.asset('assest/Star 13.png',color: const Color(0xFF169601),fit: BoxFit.fill,),
                                 const Text('%',style:TextStyle(color: Colors.white,)),
                               ],
                             )),
                          const SizedBox(width: 8,),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Save more',
                                  overflow: TextOverflow.clip,
                                  softWrap: true,
                                  textScaleFactor: 1.1,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Colors.white)
                              ),
                              Text(
                                  'Apply now and get extra savings',
                                  overflow: TextOverflow.clip,
                                  softWrap: true,
                                  textScaleFactor: 1.1,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 8,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                          const SizedBox(height: 5,),

                        ],
                      ),
                      const SizedBox(height: 15,),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 2,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (ctx,i){
                          return Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Container(
                              width: 240,
                              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF434445),
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(color: const Color(0xFFFE262F),
                                width: 0.7)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Win Rs. 500 instant off code',
                                          style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 11, color: Colors.white)
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 3.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3.0),
                                          gradient: const LinearGradient(
                                            begin: FractionalOffset(0.1, 0.1),
                                            end: FractionalOffset(0.8, 0.1),
                                            colors: [Color(0xFFFE262F),Color(0xFFFD2F71),
                                            ],
                                          ),
                                        ),
                                        child: Text('Apply',
                                            style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                        ),),
                                    ],
                                  ),
                                  Container(
                                    width:180,
                                    margin: const EdgeInsets.only(top: 5),
                                    child: Text('Valid on all perpaid deals | No minmum purchase T&C',
                                      style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 10, color: Colors.white.withOpacity(0.7)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );}),
                      ),
                      const SizedBox(height: 10,),
                      const Divider(color: Color(0xFF919191),),
                      const SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Have a promo Code',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 9,
                                  color: Colors.white)
                          ),
                          Text("Apply",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 11,color: Color(0xFFFD2F71)),),
                        ],
                      ),
                      const SizedBox(height: 4,),
                    ],
                  ),
                )),
          ),
          const SizedBox(height: 40),
          Container(
            decoration: const BoxDecoration(color: Color(0xFF1F1E2E),),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total payable", style: labelText),
                      const SizedBox(width: 5,),
                      Text("₹ $totalPay/-",style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Color(0xFFFD2F71)),),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20,),
                  child: Text("Inc. of all taxes & Charges",
                    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 9,color: Color(0xFFA3A3A3)),),
                ),
                const SizedBox(height: 8,),
                const Divider(color: Color(0xFF919191),),
                InkWell(
                  onTap: (){
                    initPlatformState();
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                        color: const Color(0xFFFD2F71)
                    ),
                    child: Text('Proceed to pay',style: GoogleFonts.poppins(textStyle: buttonText)
                    ),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
