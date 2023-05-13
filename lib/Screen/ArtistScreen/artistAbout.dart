
import 'package:flick_video_player/flick_video_player.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partywitty_guest/Utils/Styles.dart';

import '../../Api_service/homeApi.dart';
import '../../Modal/artistDetailsM.dart';

class ArtistAboutScreen extends StatefulWidget {
  const ArtistAboutScreen({Key? key}) : super(key: key);

  @override
  State<ArtistAboutScreen> createState() => _ArtistAboutScreenState();
}

class _ArtistAboutScreenState extends State<ArtistAboutScreen> {
  final double _height = Get.height, _width = Get.width;
  List<GenresProfile> getGenresDetails = [];
  List<BudgetsProfile> getBudgetsProfile = [];
  load(){
    homeApi().artistProfileDetailsApi(artistId: "1",profileId: "1").then((value) {
      setState(() {
        getGenresDetails = value.data!.genres!;
        getBudgetsProfile = value.data!.budgets!;
      });
    });
  }
  
  @override
  void initState() {
    super.initState();
    load();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ListView(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      children: [
        const SizedBox(height: 10.0),
        Row(
          children: const [
            Icon(Icons.location_on,color: Colors.white,size: 24,),
            SizedBox(width: 5.0),
            Text("Select Location",style: labelText),
            SizedBox(width: 5.0),
            Icon(Icons.keyboard_arrow_down,color: Colors.white,size: 24,),
          ],
        ),
        const SizedBox(height: 20.0),
        SizedBox(
          height: 220,
          child: FlickVideoPlayer(
            flickManager: FlickManager(
              autoPlay: false,
              videoPlayerController: VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"),
              // VideoPlayerController.network(Api_link.imageUrl  + "${widget.videoUrl}"),
            ),
            flickVideoWithControls: const FlickVideoWithControls(
              controls: FlickPortraitControls(),
            ),
            flickVideoWithControlsFullscreen: const FlickVideoWithControls(
              controls: FlickLandscapeControls(),
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        Container(
          color: Colors.black,
          height: height/3.8,
          child: Stack(
            children: [
              Image.asset("assest/dance3.png",fit: BoxFit.fill,width: _width,height: height/5),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: appColor.withOpacity(0.7),
                ),
                height: height/5,
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        left: 0,
                        bottom: 20,
                        right: 0,
                        child: Center(child: Text("Genres",style: GoogleFonts.robotoSlab(textStyle:  extraBoldText)))
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: SizedBox(
                  height: 120,
                  width: width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: getGenresDetails.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var genreData = getGenresDetails[index];
                      return Stack(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset("assest/music2.png",height: 120,width: 100,fit: BoxFit.fill,),
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              left: 0,
                              top: 0,
                              right: 0,
                              child: Center(
                                  child: Text("${genreData.name}",style: GoogleFonts.robotoSerif(textStyle: cardTitle),textAlign: TextAlign.center)))
                        ],
                      );
                    },),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20.0),
        Container(
          decoration: BoxDecoration(
              color: timeColor,
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(color: appColor)
          ),
          child: ExpansionTile(
            trailing: const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white,),
            title: Row(
              children: [
                const Icon(Icons.calendar_month,color: Colors.white),
                const SizedBox(width: 10.0),
                Text("Availability Check",style: GoogleFonts.poppins(textStyle: cardTitle),),
              ],
            ),
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
                color: Colors.white,
                height: 100,
                child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 70,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: appColor),
                          color: const Color(0xFFffb3d9).withOpacity(0.8)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Fri",style: rowButton,),
                          Text("27",style: rowButton,),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10.0,),
                    Container(
                      width: 70,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Colors.grey),
                          color: Colors.grey.withOpacity(0.8)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Sat",style: rowButton,),
                          Text("28",style: rowButton,),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10.0,),
                    Container(
                      width: 70,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Colors.grey),
                          color: Colors.grey.withOpacity(0.8)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Sun",style: rowButton,),
                          Text("29",style: rowButton,),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10.0,),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: const Color(0xFF005788)),
                          color: const Color(0xFF3DA7E0).withOpacity(0.7)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Mon",style: rowButton,),
                          Text("30",style: rowButton,),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10.0,),
                    Container(
                      width: 70,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: appColor),
                          color: const Color(0xFFffb3d9).withOpacity(0.8)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Fri",style: rowButton,),
                          Text("27",style: rowButton,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20.0),
        const Divider(color: Colors.grey),
        FutureBuilder<ArtistProfileDetails>(
          future: homeApi().artistProfileDetailsApi(artistId: "1",profileId: "1"),
          builder: (context, snapshot){
            if(snapshot.hasData){
              var userData = snapshot.data;
              return Text("${userData!.data!.profiles!.introduction}",style: GoogleFonts.poppins(textStyle: labelText));
            }
            return const SizedBox();
          },
        ),
        const SizedBox(height: 20.0),
        const Divider(color: Colors.grey),
        const SizedBox(height: 10.0),
        Container(
          decoration: BoxDecoration(
              color: timeColor,
              border: Border.all(color: appColor),
              borderRadius: BorderRadius.circular(5.0)
          ),
          child: ExpansionTile(
            trailing: const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white),
            title: Text("Categories",style: GoogleFonts.poppins(textStyle: cardTitle),),
            children: [
              const Divider(color: Colors.white),
              const SizedBox(height: 5.0),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder:  (context, index) {
                    //var budgetData = categoryList[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                      decoration: BoxDecoration(
                          color: appColor,
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: const Text("Vocalist",style: buttonText),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
        const SizedBox(height: 20.0),
        Container(
          decoration: BoxDecoration(
              color: timeColor,
              border: Border.all(color: appColor),
              borderRadius: BorderRadius.circular(5.0)
          ),
          child: ExpansionTile(
            trailing: const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white),
            title: Text("Formation",style: GoogleFonts.poppins(textStyle: cardTitle),),
            children: [
              const Divider(color: Colors.white),
              const SizedBox(height: 5.0),
              SizedBox(
                height: 70,
                child: ListView.builder(
                  itemCount: getBudgetsProfile.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var forData = getBudgetsProfile[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                      decoration: BoxDecoration(
                          color: appColor,
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${forData.subcategoryName}",style: buttonText),
                          const Divider(color: Colors.grey,),
                          Text("₹ ${forData.price}/-",style: buttonText)
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
