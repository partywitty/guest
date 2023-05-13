
// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Utils/Styles.dart';

class myWalletScreen extends StatefulWidget {
  const myWalletScreen({Key? key}) : super(key: key);

  @override
  State<myWalletScreen> createState() => _myWalletScreenState();
}

class _myWalletScreenState extends State<myWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1E2E),
        automaticallyImplyLeading: false,
        title: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: appColor,
              child: Image.asset("assest/boy_img.png",fit: BoxFit.fill,height: 50),
            ),
            title : Text("Hey",style: GoogleFonts.poppins(textStyle: labelText)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Arnold Berry",style: GoogleFonts.poppins(textStyle: cardTitle)),
                const SizedBox(height: 5.0),
              ],
            )
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF383856),
               borderRadius: BorderRadius.circular(15.0)
            ),
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Your Balance",style: bottomText),
                const SizedBox(height: 5.0),
                const Text("₹ 6000/-",style: extraBoldText),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("My Cash",style: bottomText),
                        SizedBox(height: 5.0),
                        Text("₹ 16000/-",style: bigTitle),
                      ],
                    ),
                    Container(
                      height: 30,
                      width: 1,
                      color: appColor,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Promo Cash",style: bottomText),
                        SizedBox(height: 5.0),
                        Text("₹ 16000/-",style: bigTitle),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 120,
                width: 100,
                decoration: BoxDecoration(
                    color: const Color(0xFF383856),
                    borderRadius: BorderRadius.circular(15.0)
                ),
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF468076),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Image.asset("assest/diraction.png",height: 20.0,fit: BoxFit.fill),
                    ),
                    const SizedBox(height: 5.0),
                    const Text("Send",style: cardTitle,)
                  ],
                ),
              ),
              Container(
                height: 120,
                width: 100,
                decoration: BoxDecoration(
                    color: const Color(0xFF383856),
                    borderRadius: BorderRadius.circular(15.0)
                ),
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF804650),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: const Icon(Icons.file_download_outlined,size: 22,color: Color(0xFFD26460),),
                    ),
                    const SizedBox(height: 5.0),
                    const Text("Request",style: cardTitle,)
                  ],
                ),
              ),
              Container(
                height: 120,
                width: 100,
                decoration: BoxDecoration(
                    color: const Color(0xFF383856),
                    borderRadius: BorderRadius.circular(15.0)
                ),
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF183582),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: const Text("...",style: TextStyle(fontSize: 25,color: Color(0xFF7594E5),fontWeight: FontWeight.bold),),
                    ),
                    const SizedBox(height: 5.0),
                    const Text("More",style: cardTitle,)
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Text("Transaction",style: GoogleFonts.poppins(textStyle: cardTitle)),
          Text("Today, 20 Sep",style: GoogleFonts.poppins(textStyle: bottomText)),
          const SizedBox(height: 20.0),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xFF383856),
                borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: Colors.grey)
            ),
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Image.asset("assest/music_mic.png",fit: BoxFit.fill,height: 50),
                const SizedBox(width: 5.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Club Name",style: GoogleFonts.poppins(textStyle: cardTitle)),
                    Text("Debit Card",style: GoogleFonts.poppins(textStyle: bottomText)),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("- ₹ 16000/-",style: GoogleFonts.poppins(textStyle: cardTitle)),
                    Text("11:45 PM",style: GoogleFonts.poppins(textStyle: bottomText)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xFF383856),
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: Colors.grey)
            ),
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Image.asset("assest/rec_room.png",fit: BoxFit.fill,height: 50),
                const SizedBox(width: 5.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Club Name",style: GoogleFonts.poppins(textStyle: cardTitle)),
                    Text("Debit Card",style: GoogleFonts.poppins(textStyle: bottomText)),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("- ₹ 16000/-",style: GoogleFonts.poppins(textStyle: cardTitle)),
                    Text("11:45 PM",style: GoogleFonts.poppins(textStyle: bottomText)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xFF383856),
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: Colors.grey)
            ),
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Image.asset("assest/music_band.png",fit: BoxFit.fill,height: 50),
                const SizedBox(width: 5.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Club Name",style: GoogleFonts.poppins(textStyle: cardTitle)),
                    Text("Debit Card",style: GoogleFonts.poppins(textStyle: bottomText)),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("- ₹ 16000/-",style: GoogleFonts.poppins(textStyle: cardTitle)),
                    Text("11:45 PM",style: GoogleFonts.poppins(textStyle: bottomText)),
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
