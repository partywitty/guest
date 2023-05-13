
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partywitty_guest/Screen/partywittyPay/addOn.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../Utils/Styles.dart';

class AddOnFirst extends StatefulWidget {
  const AddOnFirst({Key? key}) : super(key: key);

  @override
  State<AddOnFirst> createState() => _AddOnFirstState();
}

class _AddOnFirstState extends State<AddOnFirst> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: cardBackGround,
      appBar: AppBar(
        backgroundColor: timeColor,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Image.asset("assest/sacn1.png",fit: BoxFit.fill),
          const SizedBox(height: 15.0),
          Row(
            children: [
              const SizedBox(width: 20.0),
              Text("Showing 4000 restaurant",style: GoogleFonts.poppins(textStyle: labelText)),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: appColor,
                    borderRadius: BorderRadius.circular(4)
                  ),
                  child: Image.asset("assest/filter.png",fit: BoxFit.fill,height: 30,)),
              const SizedBox(width: 20.0),
            ],
          ),
          const SizedBox(height: 15.0),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 20.0),
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    height: 280,
                    child: Stack(
                      children: [
                        Image.asset("assest/sacn1.png",fit: BoxFit.fill,height: 200,width: width),
                        const Positioned(
                            right: 10,
                            top: 10,
                            child: Icon(Icons.favorite_border_outlined,color: Colors.white,size: 24)),
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        height: 160,
                        width: width/1.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(color: appColor),
                            color: Colors.grey[700]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10.0),
                            Row(
                              children: [
                                Text("Castle Barbeque", style: GoogleFonts.robotoMono(textStyle: bigTitle)),
                                const Spacer(),
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4.0),
                                          color: Colors.green
                                      ),
                                      child: Row(
                                        children: const [
                                          Icon(Icons.star,color: Colors.white,size: 16),
                                          Text("4.5",style: labelText,)
                                        ],
                                      ),
                                    ),
                                    Text("(350)", style: GoogleFonts.robotoMono(textStyle: smallText)),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 5.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Icon(Icons.location_pin,size: 18,color: Colors.white),
                                Text("  4th Floor, Mall of India, Sector 18, Noida\n North Indian, chinese",style: smallText)
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 70,
                                  width: width * 0.3,
                                  child: SfRadialGauge(
                                      enableLoadingAnimation: true,
                                      //show meter pointer movement while loading
                                      animationDuration: 400,
                                      //pointer movement speed
                                      axes: <RadialAxis>[
                                        RadialAxis(
                                            minimum: 0,
                                            maximum: 120,
                                            ranges: <GaugeRange>[
                                              GaugeRange(startValue: 0,
                                                  endValue: 30,
                                                  color: Colors.red),
                                              GaugeRange(startValue: 30,
                                                  endValue: 60,
                                                  color: Colors.yellow),
                                              GaugeRange(startValue: 60,
                                                  endValue: 90,
                                                  color: Colors.greenAccent),
                                              GaugeRange(startValue: 90,
                                                  endValue: 120,
                                                  color: Colors.green),
                                            ],
                                            pointers: const <GaugePointer>[

                                              /// pointer dynamic value
                                              NeedlePointer(
                                                value: 60,
                                                needleColor: Colors.white,
                                                needleEndWidth: 5,
                                                knobStyle: KnobStyle(color: Colors.deepOrange,
                                                  borderColor: Colors.lightBlue,),
                                              )
                                            ],
                                            annotations: const <GaugeAnnotation>[
                                              GaugeAnnotation(
                                                  widget: Text('', style: TextStyle(
                                                      fontSize: 0,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white)),
                                                  angle: 90,
                                                  positionFactor: 0.5),
                                            ]
                                        )
                                      ]
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AddOnMeal(),));
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4.0),
                                        color: appColor
                                    ),
                                    child: Text("PRTYWT-PAY",style: GoogleFonts.poppins(textStyle: buttonText)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            );
          },),
        ],
      ),
    );
  }
}
