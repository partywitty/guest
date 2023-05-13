// ignore_for_file: must_be_immutable
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:partywitty_guest/Api_service/claim_api.dart';
import 'package:partywitty_guest/Screen/guest_wallets.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrPage extends StatefulWidget {
  
  String club_id;
  ScanQrPage({required this.club_id});
  @override
  State<StatefulWidget> createState() => _ScanQrPageState();
}

class _ScanQrPageState extends State<ScanQrPage> {


  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey();


  @override
  void initState() {
    readQr();
    super.initState();
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((scanData) {

      setState(() => result = scanData);
    });
  }
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void readQr() async {
    try {
      if (result != null) {
        setState(() {
          controller!.pauseCamera().then((value) {
            showDialogBox(context, widget.club_id);
          });
        });
      } else {
        controller!.resumeCamera();
      }
    }catch(e){
      print('errroeoeo$e');
    }
  }
  @override
  Widget build(BuildContext context) {
    readQr();
    return Scaffold(
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Colors.orange,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: 250,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
  Future showDialogBox(context ,id){
    return showDialog(
      barrierColor: Colors.black,
      barrierDismissible: false,
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor:const Color(0xFF2D2B42),
        title:  Text("Congratulations",
            style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 22, color: Colors.white)),
        content:  Text("You got one beer free ",
            style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white)),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              setState(() {
                AddProductApi().addProductApiService(context: context,clubId:widget.club_id.toString(),rewardId: result!.code.toString())
                    .then((value){Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) => Guest_wallet(club_id: widget.club_id),),(route)=> false);
              });
              });
            },
            child: Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                gradient: const LinearGradient(
                  begin: FractionalOffset(0.1, 0.1),
                  end: FractionalOffset(0.8, 0.1),
                  colors: [Color(0xFFFE262F),Color(0xFFFD2F71),
                  ],
                ),
              ),
              alignment: Alignment.center,
              child: const Text("Claim",style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12, color: Colors.white),),
            ),
          ),
          TextButton(
            onPressed: () {
             // Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>Bottom_navigation()),(route)=>false);
            },
            child: Container(width: 60,
              height: 30,
              alignment: Alignment.center,
              child:  Text('Ignore', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 10, color: const Color(0xFFFE262F)),
    ),
            ),
          ),
        ],
      ),
    );
  }
}