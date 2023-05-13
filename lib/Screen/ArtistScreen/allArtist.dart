
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partywitty_guest/Screen/ArtistScreen/ArtistDetails.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../Api_service/API_link.dart';
import '../../Api_service/allArtistApi.dart';
import '../../Utils/Styles.dart';
import '../../Utils/commonStyles.dart';

class ArtistPage extends StatefulWidget {
  const ArtistPage({Key? key}) : super(key: key);

  @override
  State<ArtistPage> createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  final double _height = Get.height, _width = Get.width;
  final _getFollowUpCont = Get.put(GetAllArtistApi1());
  double? _ratingValue;
  @override
  void initState() {
    _getFollowUpCont.getArtistUpApi().then((value) {});
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1E2E),
        title: const Text("All Artist",style: appBarText),
      ),
      body: mainWidget(),
    );
  }
  Widget mainWidget(){
    return Obx((){
      if(_getFollowUpCont.isLoading.value){
        return const Center(child: CircularProgressIndicator());
      }else{
        return ListView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          itemCount: _getFollowUpCont.All_Artist_list.length,
          itemBuilder: (context, index) {
            var data = _getFollowUpCont.All_Artist_list[index];
            return Column(
              children: [
                const SizedBox(height: 10.0),
                Stack(
                  children: [
                    Image.network("${Api_link.imageUrl}${data.profile}",
                        loadingBuilder:  (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        fit: BoxFit.fill,height: _height*0.50,width: _width),
                    Positioned(
                        top: 10,
                        left: 10,
                        child: Row(
                          children:  [
                            const Icon(Icons.favorite,size: 24,color: Colors.red),
                            const SizedBox(width: 2.0),
                            Text(data.totalLike,style: cardTitle),
                            const SizedBox(width: 5.0),
                            const Icon(Icons.share,size: 24,color: Colors.white),
                          ],
                        )
                    ),
                    Positioned(
                        bottom: 10.0,
                        right: 10.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset("assest/logo.png",fit: BoxFit.fill,height: 25),
                            Text(data.username,style: GoogleFonts.poppins(textStyle: cardTitle)),
                            Text(data.typeOfArtistName,style: GoogleFonts.poppins(textStyle: cardSubtitle)),
                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 80,
                                  child: SizedBox(
                                    width: 100, height: 100, //height and width of guage
                                    child:SfRadialGauge(
                                        enableLoadingAnimation: true, //show meter pointer movement while loading
                                        animationDuration: 4500, //pointer movement speed
                                        axes: <RadialAxis>[ //Radial Guage Axix, use other Guage type here
                                          RadialAxis(
                                              minimum: 0,maximum: 15,
                                              ranges: <GaugeRange>[ //Guage Ranges
                                                GaugeRange(startValue: 0,endValue: 5, color: const Color(0xFF7AFF77), startWidth: 10,endWidth: 10),
                                                GaugeRange(startValue: 5,endValue: 10,color: const Color(0xFF6DFFCF),startWidth: 10,endWidth: 10),
                                                GaugeRange(startValue: 10,endValue: 15,color: const Color(0xFF07BAFE),startWidth: 10,endWidth: 10)
                                              ],
                                              pointers: const <GaugePointer>[
                                                /// pointer dynamic value
                                                NeedlePointer(
                                                  value:8,
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
                                                //add more annotations 'texts inside guage' here
                                              ]
                                          )]
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 2.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.0),
                                    color: Colors.white,
                                  ),
                                  child: const Text("Prize : 4500",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12,color: Colors.black),),
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(5.0),
                              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.white54
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.maps_home_work_outlined,color: appColor,size: 20,),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(
                                            left: 10.0),
                                        child: RatingBar(
                                            initialRating: 4.5,
                                            itemSize: 10,
                                            direction: Axis.horizontal,
                                            allowHalfRating:
                                            true,
                                            glowRadius: 10,
                                            itemCount: 5,
                                            ratingWidget:
                                            RatingWidget(
                                                full: const Icon(
                                                    Icons
                                                        .star,
                                                    size:
                                                    10,
                                                    color: Colors
                                                        .orange),
                                                half:
                                                const Icon(
                                                  Icons
                                                      .star_half,
                                                  size:
                                                  10,
                                                  color:
                                                  Colors.orange,
                                                ),
                                                empty:
                                                const Icon(
                                                  Icons.star_outline,
                                                  size:
                                                  10,
                                                  color:
                                                  Colors.orange,
                                                )),
                                            onRatingUpdate:
                                                (value) {
                                              setState(() {
                                                _ratingValue = value;
                                              });
                                            }),
                                      ),
                                      const SizedBox(width: 2.0),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 2.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4.0),
                                          color: Colors.white,
                                        ),
                                        child: const Text("4.5",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12,color: Colors.black),),
                                      ),
                                      const SizedBox(width: 10.0),
                                      const Icon(Icons.mic,size: 20,color: appColor,),
                                      const Text("12",style: cardSubtitle),
                                    ],
                                  ),
                                  const SizedBox(height: 3.0),
                                  Row(
                                    children: [
                                      const Icon(Icons.groups,color: appColor,size: 20,),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(
                                            left: 10.0),
                                        child: RatingBar(
                                            initialRating: 4,
                                            itemSize: 10,
                                            direction: Axis
                                                .horizontal,
                                            allowHalfRating:
                                            true,
                                            glowRadius: 10,
                                            itemCount: 5,
                                            ratingWidget:
                                            RatingWidget(
                                                full: const Icon(
                                                    Icons
                                                        .star,
                                                    size:
                                                    10,
                                                    color: Colors
                                                        .orange),
                                                half:
                                                const Icon(
                                                  Icons
                                                      .star_half,
                                                  size:
                                                  10,
                                                  color:
                                                  Colors.orange,
                                                ),
                                                empty:
                                                const Icon(
                                                  Icons.star_outline,
                                                  size:
                                                  10,
                                                  color:
                                                  Colors.orange,
                                                )),
                                            onRatingUpdate:
                                                (value) {
                                              setState(() {
                                                _ratingValue = value;
                                              });
                                            }),
                                      ),
                                      const SizedBox(width: 2.0),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 2.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4.0),
                                          color: Colors.white,
                                        ),
                                        child: const Text("4.5",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12,color: Colors.black),),
                                      ),
                                      const SizedBox(width: 2.0),
                                      const Icon(Icons.person,size: 20,color: appColor,),
                                      const Text("1.5K",style: cardSubtitle),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(const ArtistDetails());
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                alignment: Alignment.center,
                                height: 30.0,
                                decoration: boxDecoration(),
                                child: Text('Book Now',style: GoogleFonts.poppins(textStyle: cardSubtitle)
                                ),
                              ),
                            ),
                          ],
                        )
                    )
                  ],
                ),
                const SizedBox(height: 10.0),
              ],
            );
          },
        );
      }
    });
  }
}
