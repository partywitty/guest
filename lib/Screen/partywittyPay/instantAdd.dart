
// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../Utils/Styles.dart';

class instantPay extends StatefulWidget {
  const instantPay({Key? key}) : super(key: key);

  @override
  State<instantPay> createState() => _instantPayState();
}

class _instantPayState extends State<instantPay> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: drawerBackGround,
      appBar: AppBar(
        backgroundColor: timeColor,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50.0,horizontal: 20.0),
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: appColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10.0),
                Container(
                  alignment: Alignment.center,
                  height:height*0.2,
                  child: SizedBox(
                    width: width*0.5,
                    child:SfRadialGauge(
                        enableLoadingAnimation: true, //show meter pointer movement while loading
                        animationDuration: 400, //pointer movement speed
                        axes: <RadialAxis>[
                          RadialAxis(
                              minimum: 0,
                              maximum: 120,
                              ranges: <GaugeRange>[
                                GaugeRange(startValue: 0, endValue: 30, color:Colors.red),
                                GaugeRange(startValue: 30,endValue: 60,color: Colors.yellow),
                                GaugeRange(startValue: 60,endValue: 90,color: Colors.greenAccent),
                                GaugeRange(startValue: 90,endValue: 120,color: Colors.green),
                              ],
                              pointers:  const <GaugePointer>[
                                /// pointer dynamic value
                                NeedlePointer(
                                  value: 60,
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
                              ]
                          )
                        ]
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: appColor),
                    color: timeColor
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Row(
                         children: [
                           const SizedBox(width: 10),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text("Green Leaf",style: GoogleFonts.poppins(textStyle: textHint)),
                               const SizedBox(height: 2.0),
                               Text("Tower Square, Indore ",style:GoogleFonts.poppins(textStyle: smallText)),
                             ],
                           ),
                           const Spacer(),
                           Image.asset("assest/login.png",height: 80,width: 150,fit: BoxFit.fill,)
                         ],
                       ),
                       const Divider(color: Colors.white,height: 20.0),
                       Text("PRTYWT-PAY",style: GoogleFonts.poppins(textStyle: extraBoldText)),
                     ],
                  ),
                ),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Bill Amount",style: GoogleFonts.poppins(textStyle: bigTitle)),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 9,horizontal: 13.0),
                            color: appColor,
                            child: const Text("₹",style: boldText)),
                        Container(
                            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10.0),
                            color: Colors.white,
                            child: Text("5000/-",style: GoogleFonts.poppins(textStyle: fff))),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                Row(
                  children: const [
                    CircleAvatar(
                      radius: 11,
                      backgroundColor: Colors.green,
                      child: Icon(Icons.percent,color: Colors.white,size: 12),
                    ),
                    SizedBox(width: 5.0),
                    Text("10% Off applied",style: greenText),
                    Spacer(),
                    Text("₹ 500/-",style: greenText,)
                  ],
                ),
                const SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it",
                  style: GoogleFonts.poppins(textStyle: smallText)),
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: const Color(0xFFFE262F),
                      checkColor: Colors.white,
                      side: const BorderSide(
                        color: Colors.white,
                      ),
                      value: value,
                      onChanged: (value) {
                        setState(() {
                          value = value!;
                        });
                      },
                    ),
                    const Text("MyCash + PromoCash",style: labelText),
                    const Icon(Icons.keyboard_arrow_down_outlined,size: 24,color: Colors.white,)
                  ],
                ),
                Row(
                  children: [
                    Image.asset("assest/offer.png",color: Colors.green,height: 40,fit: BoxFit.fill),
                    const Text("Apply Promo Code",style: labelText),
                  ],
                ),
                const Divider(color: Colors.white,height: 25),
                Row(
                  children: const [
                    Text("Convenience Fee",style: labelText),
                    Spacer(),
                    Text("₹ 25/-",style: labelText),
                  ],
                ),
                const SizedBox(height: 15.0),
                Row(
                  children: const [
                    Text("Grand Total",style: cardTitle),
                    Spacer(),
                    Text("₹ 5055/-",style: priceCut),
                    SizedBox(width: 10.0),
                    Text("₹ 4525/-",style: cardTitle),
                  ],
                ),
                const SizedBox(height: 15.0),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30.0),
                  alignment: Alignment.center,
                  height: 50,
                   width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: appColor
                  ),
                  child: Text("PRTYWT-PAY",style: GoogleFonts.poppins(textStyle: buttonText)),
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
