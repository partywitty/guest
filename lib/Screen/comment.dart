// import 'package:bubble/bubble.dart';
// import 'package:comment_box/comment/comment.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:octo_image/octo_image.dart';
// import 'package:partywitty_guest/Utils/Styles.dart';
//
// class comment extends StatefulWidget {
//   comment({Key? key}) : super(key: key);
//
//   @override
//   State<comment> createState() => _commentState();
// }
//
// class _commentState extends State<comment> {
//
//   final formKey = GlobalKey<FormState>();
//   final TextEditingController commentController = TextEditingController();
//   var focusNode = FocusNode();
//   var cmtID;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       appBar: AppBar(
//         backgroundColor: appColor,
//         title: const Text("Comments",),
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: SizedBox(
//         height: MediaQuery.of(context).size.height,
//         child: CommentBox(
//           userImage: const NetworkImage("https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png?20150327203541"),
//           labelText: "Write a comment",
//           withBorder: false,
//           errorText: 'Comment cannot be blank',
//           sendButtonMethod: () {},
//           formKey: formKey,
//           focusNode: focusNode,
//           commentController: commentController,
//           backgroundColor: Colors.grey[300],
//           textColor: const Color(0xFF00599D),
//           sendWidget: const Icon(Icons.send_sharp, size: 30, color: Color(0xFF00599D)),
//           child: ListView(
//             children: [
//               ListTile(
//                 leading: Padding(
//                   padding: const EdgeInsets.only(left: 8.0),
//                   child: SizedBox(
//                     height: 45,
//                     width: 45,
//                     child: OctoImage.fromSet(
//                       fit: BoxFit.cover,
//                       image: const NetworkImage("https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png?20150327203541"),
//                       octoSet: OctoSet.circleAvatar(
//                         backgroundColor: appColor,
//                         text: const Text("A",
//                             style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white)),
//                       ),
//                     ),
//                   ),
//                 ),
//                 contentPadding: const EdgeInsets.all(0),
//                 title: Padding(
//                   padding: const EdgeInsets.only(left: 5.0, bottom: 0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       RichText(
//                         text: const TextSpan(
//                           text: "Deepanshu",style: TextStyle(color: Colors.black),
//                           children:  <TextSpan>[],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 //Text("${data.user!.name}",style: title),
//                 subtitle: Row(
//                   children: [
//                     const Icon(Icons.location_on_outlined,size: 18,color: Colors.black,),
//                     const SizedBox(width: 2.0,),
//                     const Text("Inadia",style:TextStyle(color: Colors.black) ),
//                     const SizedBox(width: 5.0,),
//                     const Text("Indre",style:TextStyle(color: Colors.black) ),
//                   ],
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(left: 10.0,bottom: 5.0),
//                 child: Text("Comments",
//                   style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
//                   // maxLines: 2,
//                   // overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(top: 10),
//                 padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//                 child:
//                 ListView.builder(
//                   physics: const ScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount: 1,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding:
//                       const EdgeInsets.only(right: 20, left: 14, bottom: 10),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               SizedBox(
//                                 height: 45,
//                                 width: 45,
//                                 child: OctoImage.fromSet(
//                                   fit: BoxFit.cover,
//                                   image: const NetworkImage("https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png?20150327203541"),
//                                   octoSet: OctoSet.circleAvatar(
//                                     backgroundColor: appColor,
//                                     text: const Text("S",
//                                         style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white)),
//
//                                   ),
//                                 ),
//                               ),
//                               Flexible(
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Bubble(
//                                         nip: BubbleNip.leftBottom,
//                                         child: Column(
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             const Text("name"),
//                                             const Text("body"),
//                                           ],
//                                         ),
//                                       ),
//                                       const SizedBox(height: 6.0,),
//                                       SizedBox(
//                                         width:200,
//                                         child: Row(
//                                           mainAxisAlignment: MainAxisAlignment.start,
//                                           children: [
//                                             const Padding(
//                                               padding: EdgeInsets.symmetric(horizontal: 8.0),
//                                               child: Text("12-05-2023",),
//                                             ),
//                                             const Text('like',),
//                                             const SizedBox(width: 10.0,),
//                                             const Text('Reply',),
//                                           ],
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           // ListView.builder(
//                           //   shrinkWrap: true,
//                           //   physics: const ScrollPhysics(),
//                           //   itemCount: 1,
//                           //   itemBuilder: (context, i) {
//                           //     return Row(
//                           //       mainAxisAlignment: MainAxisAlignment.center,
//                           //       crossAxisAlignment: CrossAxisAlignment.start,
//                           //       children: [
//                           //         SizedBox(
//                           //           height: 45,
//                           //           width: 45,
//                           //           child: OctoImage.fromSet(
//                           //             fit: BoxFit.cover,
//                           //             image: const NetworkImage("https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png?20150327203541"),
//                           //             octoSet: OctoSet.circleAvatar(
//                           //               backgroundColor: appColor,
//                           //               text: const Text("N",
//                           //                   style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white)),
//                           //
//                           //             ),
//                           //           ),
//                           //         ),
//                           //         // CircleAvatar(
//                           //         //   backgroundImage: NetworkImage(Url.IMAGE_URL+"${repdata.userImage}"),
//                           //         //   radius: 18.0,
//                           //         // ),
//                           //         Flexible(
//                           //           child: Column(
//                           //             crossAxisAlignment: CrossAxisAlignment.start,
//                           //             children: [
//                           //               Bubble(
//                           //                 nip: BubbleNip.leftBottom,
//                           //                 child: Column(
//                           //                   crossAxisAlignment: CrossAxisAlignment.start,
//                           //                   children: [
//                           //                     const Text("sender"),
//                           //                     const Text("body"),
//                           //                   ],
//                           //                 ),
//                           //               ),
//                           //               const SizedBox(height: 6.0,),
//                           //               SizedBox(
//                           //                 width:160,
//                           //                 child: Row(
//                           //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           //                   children: [
//                           //                     const Text("13-05-2023"),
//                           //                     InkWell(
//                           //                       child: const Text(' reply'),
//                           //                       onTap: (){
//                           //                       },
//                           //                     ),
//                           //                     const SizedBox(width: 10.0,),
//                           //                   ],
//                           //                 ),
//                           //               ),
//                           //             ],
//                           //           ),
//                           //         ),
//                           //       ],
//                           //     );
//                           //   },),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Flexible(
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.end,
//                                     children: [
//                                       Bubble(
//                                         nip: BubbleNip.rightBottom,
//                                         child: Column(
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             const Text("name 2"),
//                                             const Text("body"),
//                                           ],
//                                         ),
//                                       ),
//                                       const SizedBox(height: 6.0,),
//                                       SizedBox(
//                                         width:200,
//                                         child: Row(
//                                           mainAxisAlignment: MainAxisAlignment.end,
//                                           children: [
//                                             const Padding(
//                                               padding: EdgeInsets.symmetric(horizontal: 8.0),
//                                               child: Text("12-05-2023",),
//                                             ),
//                                             const Text('like',),
//                                             const SizedBox(width: 10.0,),
//                                             const Text('Reply',),
//                                           ],
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 45,
//                                 width: 45,
//                                 child: OctoImage.fromSet(
//                                   fit: BoxFit.cover,
//                                   image: const NetworkImage("https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png?20150327203541"),
//                                   octoSet: OctoSet.circleAvatar(
//                                     backgroundColor: appColor,
//                                     text: const Text("S",
//                                         style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white)),
//
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }