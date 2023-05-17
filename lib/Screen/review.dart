// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Utils/Styles.dart';

class reviewScreen extends StatefulWidget {
  const reviewScreen({Key? key}) : super(key: key);

  @override
  State<reviewScreen> createState() => _reviewScreenState();
}

class _reviewScreenState extends State<reviewScreen> {
  TextEditingController thoughtController = TextEditingController();
  double? ratingValue;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
           decoration: const BoxDecoration(
             image: DecorationImage(
               image: AssetImage("assest/popupback.png"),fit: BoxFit.fill
             )
           ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 70.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset(0.1, 0.1),
                  end: FractionalOffset(0.7, 0.1),
                  colors: [
                    Color(0xFF2C019E),
                    Color(0xFF8705F8),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15.0),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text("What do you think of our App?",style: labelText),
                  ),
                  const Divider(color: Colors.grey,height: 20.0),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(Icons.emoji_emotions_rounded,color: Colors.yellow,size: 45),
                      Icon(Icons.emoji_emotions_rounded,color: Colors.yellow,size: 45),
                      Icon(Icons.emoji_emotions_rounded,color: Colors.yellow,size: 45),
                      Icon(Icons.emoji_emotions_rounded,color: Colors.yellow,size: 45),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text("What would you like to share with us?",style: labelText),
                  ),
                  const Divider(color: Colors.grey,height: 20.0),
                  const SizedBox(height: 15.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: thoughtController,
                      autofocus: false,
                      keyboardType: TextInputType.text,
                      style: fillText,
                      maxLines: 5,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Your thoughts',
                        hintStyle: textHint,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        contentPadding: const EdgeInsets.all(14),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text("Guest Review",style: labelText),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("Ambience",style: textHint),
                      const SizedBox(width: 10.0),
                      RatingBar(
                          initialRating: 4.5,
                          itemSize: 25,
                          direction: Axis.horizontal,
                          allowHalfRating:
                          true,
                          glowRadius: 10,
                          itemCount: 5,
                          ratingWidget:
                          RatingWidget(
                              full: const Icon(Icons.star, size: 20, color: Colors.orange),
                              half: const Icon(Icons.star_half, size: 20, color: Colors.orange,),
                              empty: const Icon(Icons.star_outline, size: 20, color: Colors.orange,)),
                          onRatingUpdate:
                              (value) {
                            setState(() {
                              ratingValue = value;
                            });
                          }),
                      const Text("4.5",style: textHint),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("Food",style: textHint),
                      const SizedBox(width: 10.0),
                      RatingBar(
                          initialRating: 4.5,
                          itemSize: 25,
                          direction: Axis.horizontal,
                          allowHalfRating:
                          true,
                          glowRadius: 10,
                          itemCount: 5,
                          ratingWidget:
                          RatingWidget(
                              full: const Icon(Icons.star, size: 20, color: Colors.orange),
                              half: const Icon(Icons.star_half, size: 20, color: Colors.orange,),
                              empty: const Icon(Icons.star_outline, size: 20, color: Colors.orange,)),
                          onRatingUpdate:
                              (value) {
                            setState(() {
                              ratingValue = value;
                            });
                          }),
                      const Text("4.5",style: textHint),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("Hygiene",style: textHint),
                      const SizedBox(width: 10.0),
                      RatingBar(
                          initialRating: 4.5,
                          itemSize: 25,
                          direction: Axis.horizontal,
                          allowHalfRating:
                          true,
                          glowRadius: 10,
                          itemCount: 5,
                          ratingWidget:
                          RatingWidget(
                              full: const Icon(Icons.star, size: 20, color: Colors.orange),
                              half: const Icon(Icons.star_half, size: 20, color: Colors.orange,),
                              empty: const Icon(Icons.star_outline, size: 20, color: Colors.orange,)),
                          onRatingUpdate:
                              (value) {
                            setState(() {
                              ratingValue = value;
                            });
                          }),
                      const Text("4.5",style: textHint),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("Music",style: textHint),
                      const SizedBox(width: 10.0),
                      RatingBar(
                          initialRating: 4.5,
                          itemSize: 25,
                          direction: Axis.horizontal,
                          allowHalfRating:
                          true,
                          glowRadius: 10,
                          itemCount: 5,
                          ratingWidget:
                          RatingWidget(
                              full: const Icon(Icons.star, size: 20, color: Colors.orange),
                              half: const Icon(Icons.star_half, size: 20, color: Colors.orange,),
                              empty: const Icon(Icons.star_outline, size: 20, color: Colors.orange,)),
                          onRatingUpdate:
                              (value) {
                            setState(() {
                              ratingValue = value;
                            });
                          }),
                      const Text("4.5",style: textHint),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("Pricing",style: textHint),
                      const SizedBox(width: 10.0),
                      RatingBar(
                          initialRating: 4.5,
                          itemSize: 25,
                          direction: Axis.horizontal,
                          allowHalfRating:
                          true,
                          glowRadius: 10,
                          itemCount: 5,
                          ratingWidget:
                          RatingWidget(
                              full: const Icon(Icons.star, size: 20, color: Colors.orange),
                              half: const Icon(Icons.star_half, size: 20, color: Colors.orange,),
                              empty: const Icon(Icons.star_outline, size: 20, color: Colors.orange,)),
                          onRatingUpdate:
                              (value) {
                            setState(() {
                              ratingValue = value;
                            });
                          }),
                      const Text("4.5",style: textHint),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("Service",style: textHint),
                      const SizedBox(width: 10.0),
                      RatingBar(
                          initialRating: 4.5,
                          itemSize: 25,
                          direction: Axis.horizontal,
                          allowHalfRating:
                          true,
                          glowRadius: 10,
                          itemCount: 5,
                          ratingWidget:
                          RatingWidget(
                              full: const Icon(Icons.star, size: 20, color: Colors.orange),
                              half: const Icon(Icons.star_half, size: 20, color: Colors.orange,),
                              empty: const Icon(Icons.star_outline, size: 20, color: Colors.orange,)),
                          onRatingUpdate:
                              (value) {
                            setState(() {
                              ratingValue = value;
                            });
                          }),
                      const Text("4.5",style: textHint),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5.0),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: appColor,
                            borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          ),
                          child: Text('Submit', style: GoogleFonts.poppins(textStyle: buttonText)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
