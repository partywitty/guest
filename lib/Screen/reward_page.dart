// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partywitty_guest/Api_service/reward_api.dart';
import 'package:partywitty_guest/Screen/qrscan.dart';

class Reward_page extends StatefulWidget {
  const Reward_page({Key? key}) : super(key: key);

  @override
  State<Reward_page> createState() => Reward_pageState();
}

class Reward_pageState extends State<Reward_page> {

  @override
  void initState() {
    load();

    super.initState();
  }


  var data;
  load(){
    GetReward_api().getreward_api().then((value) {
      setState(() {
        data=value;
        //print('cluvid-----${data['reward_name'].toString()}');
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF2D2B43),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1E2E),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [
              Positioned(
                top: height*0.02  ,
                child: const Padding(
                    padding: EdgeInsets.only( left: 30),
                    child: SizedBox(
                        width: 43,
                        height: 49,
                        child: Image(image: AssetImage('assest/Y_circle.png'),))

                ),
              ),
              Positioned(
                top: height*0.14  ,
                right: 10,
                child: const Padding(
                    padding: EdgeInsets.only(),
                    child: SizedBox(
                        width: 45,
                        height: 49,
                        child: Image(image: AssetImage('assest/Y_line.png'),))
                ),
              ),
              Positioned(
                top: height*0.14 ,
                right: 10,
                child: const Padding(
                    padding: EdgeInsets.only(),
                    child: SizedBox(
                        width: 43,
                        height: 49,
                        child: Image(image: AssetImage('assest/Y_line1.png'),))

                ),
              ),
              Positioned(
                top: height*0.14  ,
                child: const Padding(
                    padding: EdgeInsets.only(),
                    child: SizedBox(
                        width: 45,
                        height: 49,
                        child: Image(image: AssetImage('assest/P_line.png'),))

                ),
              ),
              Positioned(
                top:10  ,
                right: 10,
                child: Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: CircleAvatar(
                      maxRadius: 23,
                      backgroundColor: Colors.blue.shade500,
                    )

                ),
              ),
              Positioned(
                top: height*0.14  ,
                child: const Padding(
                    padding: EdgeInsets.only(),
                    child: SizedBox(
                        width: 43,
                        height: 49,
                        child: Image(image: AssetImage('assest/P_line1.png'),))

                ),
              ),
              Positioned(top: 224,
                  bottom: 0 ,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Container(
                      width: width,
                      // height: height,
                      decoration: const BoxDecoration(
                        color: Color(0xFF222033),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(50), topLeft: Radius.circular(50)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50.0,),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                                padding: EdgeInsets.only(left: 34.0),
                                child: SizedBox(
                                    width: 287,
                                    height: 75,
                                    child: Image(image: AssetImage('assest/Congrats!.png'),))
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child:data==null?const Text(''):Text(data['reward_name'],
                                  style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.white)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(width: 60,),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,MaterialPageRoute(builder: (context)=>
                                          ScanQrPage(club_id: data!=null?data['id'].toString():''))).then((value){
                                            Get.off(ScanQrPage(club_id: '',));
                                      });
                                    },
                                    child: Container(
                                      width: 70,
                                      height: 25.0,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: FractionalOffset(0.1, 0.1),
                                          end: FractionalOffset(0.7, 0.1),
                                          colors: [
                                            Color(0xFFFE262F),
                                            Color(0xFFFD2F71),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(3)),
                                      ),
                                      child: Center(
                                        child: Text('Claim',
                                          style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 11, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      // Navigator.push(context,MaterialPageRoute(builder: (context)=>
                                      //   Bottom_navigation())).then((value){Get.off(ScanQrPage(club_id: '',));
                                      //   });
                                      },
                                    child: SizedBox(
                                      width: 60,
                                      child: Text(
                                        'Igonre',
                                        style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 10, color: const Color(0xFFFE262F)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
              Positioned(
                top: 60,
                left: width*0.26,
                child: SizedBox(
                  width: 170,
                  height: 200,
                  child: Image.asset('assest/wining_img.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: height*0.27  ,
                right: 10,
                child: Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: CircleAvatar(
                      maxRadius: 18,
                      backgroundColor: Colors.pink.shade100,
                    )

                ),
              ),
              Positioned(
                top: height*0.27  ,
                child: Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: CircleAvatar(
                      maxRadius: 23,
                      backgroundColor: Colors.blue.shade200,
                    )

                ),
              ),
              Positioned(
                top: height*0.31  ,
                child: const Padding(
                    padding: EdgeInsets.only(left: 18),
                    child: SizedBox(
                        width: 30,
                        height: 30,
                        child: Image(image: AssetImage('assest/p_circle.png'),))

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}