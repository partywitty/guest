
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Screen/booking/booking.dart';
import '../Screen/wallet/myWallet.dart';
import '../Utils/Styles.dart';
import '../Utils/sharepref.dart';
import 'login_page.dart';

class guestDrawer{
  getDrawer(){
    return SizedBox(
      width: 320,
      child: Drawer(
        child: Container(
          child: Column(
            children: [
              Container(
                color: Colors.grey,
                padding: const EdgeInsets.only(top: 60.0,left: 20.0,right: 20.0,bottom: 20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration : BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Colors.yellow,
                          ),
                          child: const Icon(Icons.person,size: 100,color: Colors.grey,),
                        ),
                        const SizedBox(width: 20.0,),
                        Column(
                          children: const [
                            Text("Adwerd",style: bigTitle),
                            SizedBox(height: 10.0,),
                            Text("abedf09876@gmail.com",style: textHint,),
                            SizedBox(height: 10.0,),
                            Text("0123456789",style: textHint),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Spacer(),
                        Icon(Icons.edit_note_sharp,size: 30,color: Colors.white),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(0),
                  shrinkWrap: true,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 40,
                      color: const Color(0xFFD9D9D9),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text("Payments",style: drawerTitle),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.account_balance_wallet_outlined, size: 22,color: Colors.grey),
                      title: const Text("Wallet History",style: drawerSubTitle),
                      trailing:  const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        Get.to(const myWalletScreen());
                      },
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 40,
                      color: const Color(0xFFD9D9D9),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text("Activities",style: drawerTitle),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.event_note_rounded, size: 22,color: Colors.grey),
                      title: const Text("Booking History",style: drawerSubTitle),
                      trailing:  const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        Get.to(() => const bookingScreen());
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => grievance(),));
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.event_note_rounded, size: 22,color: Colors.grey),
                      title: const Text("Coupon History",style: drawerSubTitle),
                      trailing:  const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        //Get.to(() => offerScreen());
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.favorite_border, size: 22,color: Colors.grey),
                      title: const Text("Favorites",style: drawerSubTitle),
                      trailing:  const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => grievance(),));
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.notifications_none, size: 22,color: Colors.grey),
                      title: const Text("Notifications",style: drawerSubTitle),
                      trailing:  const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => grievance(),));
                      },
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 40,
                      color: const Color(0xFFD9D9D9),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text("Coupon",style: drawerTitle),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.local_offer_outlined, size: 22,color: Colors.grey),
                      title: const Text("My Coupon",style: drawerSubTitle),
                      trailing:  const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => grievance(),));
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.local_offer_outlined, size: 22,color: Colors.grey),
                      title: const Text("PARTYWITTY Coupon",style: drawerSubTitle),
                      trailing:  const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => grievance(),));
                      },
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 40,
                      color: const Color(0xFFD9D9D9),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text("More",style: drawerTitle),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.messenger_outline, size: 22,color: Colors.grey),
                      title: const Text("Help Centre",style: drawerSubTitle),
                      trailing:  const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => grievance(),));
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.edit, size: 22,color: Colors.grey),
                      title: const Text("Blog",style: drawerSubTitle),
                      trailing:  const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => grievance(),));
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.messenger_outline, size: 22,color: Colors.grey),
                      title: const Text("About Us",style: drawerSubTitle),
                      trailing:  const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => grievance(),));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: ()async{
                              final getuser_id=GetUserDetail();
                              await getuser_id.remove('id');
                              Get.to(() => const Login_page());
                              //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login_page(),),(route)=> false);
                            },
                            child: const Chip(
                              label: Text("Logout"),
                              avatar: Icon(Icons.power_settings_new,color: Colors.grey),),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}