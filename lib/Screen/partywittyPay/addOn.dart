
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:popup_menu/popup_menu.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../Utils/Styles.dart';

class AddOnMeal extends StatefulWidget {
  const AddOnMeal({Key? key}) : super(key: key);

  @override
  State<AddOnMeal> createState() => _AddOnMealState();
}

class _AddOnMealState extends State<AddOnMeal> {
  PopupMenu? menu;
  GlobalKey btnKey = GlobalKey();
  GlobalKey btnKey2 = GlobalKey();
  @override
  void initState() {
    super.initState();
    menu = PopupMenu(items: [
      // MenuItem(title: 'Copy', image: Image.asset('assets/copy.png')),
      // MenuItem(title: 'Home', image: Icon(Icons.home, color: Colors.white,)),
      MenuItem(
          title: 'Mail',
          image: Icon(
            Icons.mail,
            color: Colors.white,
          )),
      MenuItem(
          title: 'Power',
          image: Icon(
            Icons.power,
            color: Colors.white,
          )),
      MenuItem(
          title: 'Setting',
          image: Icon(
            Icons.settings,
            color: Colors.white,
          )),
      MenuItem(
          title: 'PopupMenu',
          image: Icon(
            Icons.menu,
            color: Colors.white,
          ))
    ], onClickMenu: onClickMenu, onDismiss: onDismiss, maxColumn: 1);
  }

  void stateChanged(bool isShow) {
    print('menu is ${isShow ? 'showing' : 'closed'}');
  }

  void onClickMenu(MenuItemProvider item) {
    print('Click menu -> ${item.menuTitle}');
  }

  void onDismiss() {
    print('Menu is dismiss');
  }

  @override
  Widget build(BuildContext context) {
    PopupMenu.context = context;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: cardBackGround,
      appBar: AppBar(
        backgroundColor: timeColor,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 10.0, vertical: 10.0),
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
                  height: height * 0.2,
                  child: SizedBox(
                    width: width * 0.5,
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
                ),
                Text("Extra Add on Calculator",
                    style: GoogleFonts.poppins(textStyle: bigTitle)),
                const Divider(color: Colors.white),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("minimum spend value",
                        style: GoogleFonts.poppins(textStyle: labelText)),
                    Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 9, horizontal: 13.0),
                            color: appColor,
                            child: const Text("₹", style: boldText)),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10.0),
                            color: Colors.white,
                            child: Text("5000/-", style: GoogleFonts.poppins(
                                textStyle: fff))),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  color: timeColor,
                  child: Row(
                    children: const [
                      Text("You can spend  ", style: smallText),
                      Text("₹ 6000/-", style: bigTitle),
                      Spacer(),
                      Text("  including", style: smallText),
                      Text(" @ 20% ", style: rowButton),
                      Text("off", style: smallText),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Text("Free Add on Offer",
                        style: GoogleFonts.poppins(textStyle: bannerTitle)),
                    Text(" (How to Avail) ",
                        style: GoogleFonts.poppins(textStyle: textHint)),
                    InkWell(
                      key: btnKey,
                      onTap: (){
                        maxColumn();
                      },
                        child: const Icon(Icons.info_outline, color: Colors.blue, size: 24)),
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
                const SizedBox(height: 15.0),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          Center(child: Text("Castle Barbeque", style: GoogleFonts.robotoMono(textStyle: bigTitle),)),
        ],
      ),
    );
  }

  void maxColumn() {
    PopupMenu menu = PopupMenu(
       backgroundColor: Colors.grey,
      // lineColor: Colors.tealAccent,
        maxColumn: 1,
        items: [
          MenuItem(
              title: 'this amount will we saved in the wallet for redemption. T&C',
            textStyle: textHint,
            userInfo:  Container(
              color: Colors.white,
            )
          ),
        ],
        onClickMenu: onClickMenu,
        stateChanged: stateChanged,
        onDismiss: onDismiss);
    menu.show(widgetKey: btnKey);
  }

}