
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Utils/Styles.dart';
import 'Scan/privatepartyBooking.dart';

class Privateparty extends StatefulWidget {
  const Privateparty({Key? key}) : super(key: key);

  @override
  State<Privateparty> createState() => _PrivatepartyState();
}

class _PrivatepartyState extends State<Privateparty> {
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Book a Venue for Private Party',  style: GoogleFonts.poppins(textStyle: bannerTitle)),
      ),
      body: SafeArea(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 0),
          itemCount: 6,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            // var data =HappenningParty[index];
            return   InkWell(
              onTap: (){
                setState((){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PrivatepartyBooking(),));
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                          margin: const EdgeInsets.all(10.0),
                          height: height/4.5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: Image.asset("assest/wallet1.png",fit: BoxFit.fill,width: width,),
                          )
                      ),
                      Positioned(
                          left: 20,
                          top: 10,
                          child: Text("Restaurant",style: GoogleFonts.poppins(textStyle: cardTitle))
                      ),
                    ],
                  ),
                ],
              ),
            );
          },),
      ),
    );
  }
}
