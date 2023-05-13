
// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Utils/Styles.dart';

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  int selectItem=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1E2E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1E2E),
        title: const Text("Notification",style: appBarText),
        actions: const [
          Icon(Icons.settings,color: Colors.white,size: 24),
          SizedBox(width: 20.0),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
        shrinkWrap: true,
        physics: const ScrollPhysics(),
         children: [
           Container(
             padding: const EdgeInsets.symmetric(vertical: 20.0),
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(5.0)
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 InkWell(
                   onTap: (){
                     setState(() {
                       selectItem=0;
                     });
                   },
                   child: Text('160 Notifications',
                       textAlign: TextAlign.center,
                       style: GoogleFonts.poppins(
                           fontWeight: FontWeight.w500,
                           fontSize: 14, color: selectItem==0? cardBackGround :const Color(0xFFA3A3A3))),
                 ),
                 InkWell(
                   onTap: (){
                     setState(() {
                       selectItem=1;
                     });
                   },
                   child: Text('Activity',
                       textAlign: TextAlign.center,
                       style: GoogleFonts.poppins(
                           fontWeight: FontWeight.w500,
                           fontSize: 14, color: selectItem==1? cardBackGround :const Color(0xFFA3A3A3))),
                 ),
                 InkWell(
                   onTap: (){
                     setState(() {
                       selectItem=2;
                     });
                   },
                   child: Text('News',
                       textAlign: TextAlign.center,
                       style: GoogleFonts.poppins(
                           fontWeight: FontWeight.w500,
                           fontSize: 14, color: selectItem == 2 ? cardBackGround :const Color(0xFFA3A3A3))),
                 ),
               ],
             ),
           ),
           const SizedBox(height: 10.0),
           selectItem == 0 ?
           Column(
             children: [
               ListTile(
                 leading: const CircleAvatar(
                   backgroundColor: Color(0xFF8E5F00),
                   child: Icon(Icons.email_outlined,color: Colors.white,size: 24),
                 ),
                 title: RichText(
                   text: TextSpan(
                     text: 'Arnold Berry ',
                     style: GoogleFonts.poppins(textStyle: yellowText),
                     children: const <TextSpan>[
                       TextSpan(text: 'and 1 other posted on your talk page.', style: labelText),
                     ],
                   ),
                 ),
                 subtitle: Row(
                   children: const [
                     Icon(Icons.verified,color: Colors.yellow,size: 20),
                     SizedBox(width: 5.0),
                     Text("1 Min ago",style: labelText),
                   ],
                 ),
               ),
               const Divider(color: Colors.grey),
               ListTile(
                 leading: CircleAvatar(
                   radius: 25,
                   backgroundColor: appColor,
                   child: Image.asset("assest/boy_img.png",fit: BoxFit.fill,height: 50),
                 ),
                 title : Text("Joshua",style: GoogleFonts.poppins(textStyle: labelText)),
                 subtitle: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("Commented on Your Post",style: GoogleFonts.poppins(textStyle: cardSubtitle)),
                     RichText(
                       text: TextSpan(
                         text: 'It is a long established fact that a reader will be distracted',
                         style: GoogleFonts.poppins(textStyle: cardTitle),
                       ),
                     ),
                     const SizedBox(height: 5.0),
                     Row(
                       children: const [
                         Icon(Icons.verified,color: Colors.yellow,size: 20),
                         SizedBox(width: 5.0),
                         Text("22 Min ago",style: labelText),
                       ],
                     ),
                   ],
                 )
               ),
               const Divider(color: Colors.grey),
               ListTile(
                   leading: CircleAvatar(
                     radius: 25,
                     backgroundColor: appColor,
                     child: Image.asset("assest/boy_img.png",fit: BoxFit.fill,height: 50),
                   ),
                   title: RichText(
                     text: TextSpan(
                       text: 'Arnold Berry ',
                       style: GoogleFonts.poppins(textStyle: yellowText),
                       children: const <TextSpan>[
                         TextSpan(text: 'and 1 other posted on your talk page.', style: labelText),
                       ],
                     ),
                   ),
                   subtitle: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Row(
                         children: const [
                           Icon(Icons.picture_as_pdf_outlined,color: Colors.blue,size: 30),
                           SizedBox(width: 5.0),
                           Text("Name.doc",style: cardTitle)
                         ],
                       ),
                       const SizedBox(height: 5.0),
                       Row(
                         children: const [
                           Icon(Icons.verified,color: Colors.blue,size: 20),
                           SizedBox(width: 5.0),
                           Text("22 Min ago",style: labelText),
                         ],
                       ),
                     ],
                   )
               ),
               const Divider(color: Colors.grey),
               ListTile(
                   leading: CircleAvatar(
                     radius: 25,
                     backgroundColor: appColor,
                     child: Image.asset("assest/boy_img.png",fit: BoxFit.fill,height: 50),
                   ),
                   title: const Text("You have a new friend suggestions.",style: cardTitle),
                   subtitle: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       RichText(
                         text: TextSpan(
                           text: 'Arnold Berry ',
                           style: GoogleFonts.poppins(textStyle: yellowText),
                           children: const <TextSpan>[
                             TextSpan(text: 'Accept / Decline', style: blueText),
                           ],
                         ),
                       ),
                       Row(
                         children: const [
                           Icon(Icons.calendar_month_outlined,color: Colors.white,size: 24),
                           SizedBox(width: 5.0),
                           Text("2 days ago - 08:30AM",style: labelText,)
                         ],
                       ),
                     ],
                   )
               ),
               const Divider(color: Colors.grey),
               ListTile(
                 leading: const CircleAvatar(
                   backgroundColor: Color(0xFF8E5F00),
                   child: Icon(Icons.email_outlined,color: Colors.white,size: 24),
                 ),
                 title: RichText(
                   text: TextSpan(
                     text: 'Arnold Berry ',
                     style: GoogleFonts.poppins(textStyle: yellowText),
                     children: const <TextSpan>[
                       TextSpan(text: 'and 1 other posted on your talk page.', style: labelText),
                     ],
                   ),
                 ),
                 subtitle: Row(
                   children: const [
                     Icon(Icons.verified,color: Colors.yellow,size: 20),
                     SizedBox(width: 5.0),
                     Text("1 Min ago",style: labelText),
                   ],
                 ),
               ),
             ],
           ):
           selectItem == 1 ?
           Column(
             children: const [
               Text("Activity",style: cardTitle)
             ],
           )  :
           Column(
             children: const [
               Text("News",style: cardTitle)
             ],
           )
         ],
      ),
    );
  }
}
