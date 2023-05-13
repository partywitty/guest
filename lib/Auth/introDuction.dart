
import 'package:flutter/material.dart';
import 'package:partywitty_guest/Auth/locationScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Utils/Styles.dart';

class Introduction extends StatefulWidget {
  @override
  _IntroductionState createState() => _IntroductionState();
}
class _IntroductionState extends State<Introduction> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  PageController page = PageController(initialPage: 0);
  int pageIndex = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: page,
            scrollDirection: Axis.horizontal,
            pageSnapping: true,
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assest/intro1.png"),fit: BoxFit.fill
                  )
                ),
                child: Column(
                  children: [
                    InkWell(
                      focusColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CurrentLocation(),));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 10,top: 50),
                            child: Text("Skip>>",style: bannerTitle),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 45.0),
                      child: Text("Party like there's no tomorrow",style: boldText,),
                    ),
                  ],
                ),
                // color: Colors.deepOrange,
              ),
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assest/intro2.png"),fit: BoxFit.fill
                    )
                ),
                child: Column(
                  children: [
                    InkWell(
                      focusColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CurrentLocation(),));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 10,top: 50),
                            child: Text("Skip>>",style: bannerTitle),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 45.0),
                      child: Text("Drink like nobody's business",style: boldText,),
                    ),
                  ],
                ),
                // color: Colors.deepOrange,
              ),
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assest/intro3.png"),fit: BoxFit.fill
                    )
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CurrentLocation(),));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 10,top: 50),
                            child: Text("Skip>>",style: bannerTitle),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 45.0),
                      child: Text("Dance like nobody's watching",style: boldText,),
                    ),
                  ],
                ),
                // color: Colors.deepOrange,
              ),
            ],
          ),
          Positioned(
            bottom: 15,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                    controller: page,  // PageController
                    count:  3,
                    effect:  const WormEffect(),  // your preferred effect
                    onDotClicked: (index){
                    }
                ),
              )),
        ],
      ),
    );
  }
}