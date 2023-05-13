
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Utils/Styles.dart';
import '../../Utils/commonStyles.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController clubController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          children: [
            const SizedBox(height: 20.0),
            TextFormField(
              controller: clubController,
              style: fillText,
              decoration: inputDecoration(context,
                  prefixIcon: const Icon(Icons.search,color: Colors.white,size: 18,),
                  suffixIcon: const Icon(Icons.mic,size: 18,color: appColor,),
                  hint: "Search Clubs, locations or cuisines"
              ),
            ),
            const SizedBox(height: 20.0),
            Text("Top searched clubs",style: GoogleFonts.poppins(textStyle: labelText)),
            const SizedBox(height: 10.0),
            SizedBox(
              height: 300,
              child: GridView.builder(
                itemCount : 10,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2.5 / 1.0,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  //   var data = searchArtist[index];
                  return InkWell(
                    onTap: (){
                      setState(() {
                        // selectedBox = true;
                        // artistSelect = data.name;
                        // artistId = data.id;
                        // subcategoryId = data.subcategory;
                      });
                    },
                    child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(vertical: 5.0),
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        decoration: BoxDecoration(
                            color: drawerBackGround,
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.arrow_upward,color: Colors.white,size: 16),
                            Text("Stounge", style: fillText,textAlign: TextAlign.center,)
                          ],
                        )
                    ),
                  );
                },),
            ),
            const SizedBox(height: 20.0),
            Text("Most booked restaurants",style: GoogleFonts.poppins(textStyle: labelText),),
            SizedBox(
              height: height/3,
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset("assest/music6.png",fit: BoxFit.fill,height: height/6,width: 200),
                          ),
                          Positioned(
                              top: 5,
                              left: 5,
                              child: Column(
                                children: [
                                  Text("40%",style:  GoogleFonts.poppins(textStyle:bigTitle)),
                                  Text("OFF",style: GoogleFonts.poppins(textStyle: extraBoldText)),
                                ],
                              )
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 7.0,vertical: 2.0),
                              child: const Text("4.5",style: timerCount,),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      Text("Castle Barbeque",style: GoogleFonts.poppins(textStyle: labelText),),
                    ],
                  ),
                  const SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset("assest/music7.png",fit: BoxFit.fill,height: height/6,width: 200),
                          ),
                          Positioned(
                              top: 5,
                              left: 5,
                              child: Column(
                                children: [
                                  Text("40%",style:  GoogleFonts.poppins(textStyle:bigTitle)),
                                  Text("OFF",style: GoogleFonts.poppins(textStyle: extraBoldText)),
                                ],
                              )
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 7.0,vertical: 2.0),
                              child: const Text("4.5",style: timerCount,),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      Text("Castle Barbeque",style: GoogleFonts.poppins(textStyle: labelText),),
                    ],
                  ),
                  const SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset("assest/music8.png",fit: BoxFit.fill,height: height/6,width: 200),
                          ),
                          Positioned(
                              top: 5,
                              left: 5,
                              child: Column(
                                children: [
                                  Text("40%",style:  GoogleFonts.poppins(textStyle:bigTitle)),
                                  Text("OFF",style: GoogleFonts.poppins(textStyle: extraBoldText)),
                                ],
                              )
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 7.0,vertical: 2.0),
                              child: const Text("4.5",style: timerCount,),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      Text("Castle Barbeque",style: GoogleFonts.poppins(textStyle: labelText),),
                    ],
                  ),
                  const SizedBox(width: 10.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
