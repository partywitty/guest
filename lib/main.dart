import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'Auth/introDuction.dart';
import 'Auth/notify.dart';
import 'Auth/otp.dart';
import 'Auth/signup.dart';
import 'Auth/spleshScreen.dart';
import 'Screen/about.dart';
import 'Screen/guest_wallets.dart';
import 'Screen/home.dart';
import 'Screen/home/homePage.dart';
import 'Screen/jump/jumpScreen.dart';
import 'Screen/live_music.dart';
import 'Screen/qrscan.dart';
import 'Screen/reward_page.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'party_witty', // id
  'party_witty', // title
  importance: Importance.high,
  playSound: true,
  showBadge: true,
);
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('-----------FULLY BACKGROUND ON TAP------------');
  await Firebase.initializeApp();
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettings = InitializationSettings(android: initializationSettingsAndroid,
  );

  flutterLocalNotificationsPlugin.initialize(initializationSettings,
    onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async {
      print('The App bar is clicked------------------------onDidReceiveNotificationResponse-----------------');
      print('The Response in the notification is ----------------------onDidReceiveNotificationResponse----------------${notificationResponse.payload.toString()}');
    },);
  FirebaseMessaging.instance.getInitialMessage();
  flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()!.requestPermission();
  await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.
  createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);


  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((message) {
      print("USER NOTIFICATION DATA-----------------onMessage----------------");
      print('The Message is ----notification-----${message.notification}');
      print('The Message is ----------data----------${message.toMap()}');
      LocalNoti.diplay(message);
    });
  }


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Party Witty Guest",
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const splash(),
          '/signUp': (context) => const SignUp(),
          '/s': (context) => Otp_page(Ids: ""),
          '/reward_page': (context) => const Reward_page(),
          '/Introduction': (context) => Introduction(),
          '/QR': (context) => ScanQrPage(club_id: '',),
          '/guest_wallet': (context) => Guest_wallet(club_id: '',),
          '/d': (context) => const Home(),
          '/about': (context) => const About(),
          '/HomePage': (context) => const HomePage(),
          '/Live_music_page': (context) => const Live_music_page(),
          '/jump_start': (context) => const Jump_start(),
        }
    );
  }
}








