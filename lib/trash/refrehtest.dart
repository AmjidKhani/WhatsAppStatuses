// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
//
// import '../Screens/savedscreen/detailSavedScreen.dart';
// import '../Screens/noFound/novideosfound.dart';
// import '../Screens/noFound/nowhatsappfound.dart';
// import '../Screens/videoscreen/video_thumnails.dart';
// import '../constant/constant.dart';
// import '../constant/shimmer.dart';
// import '../provider/new pevider/getdirectorypath.dart';
//
// class refreshtest extends StatefulWidget {
//   const refreshtest({Key? key}) : super(key: key);
//
//   @override
//   State<refreshtest> createState() => _refreshtestState();
// }
// List<String> k=['a','b','c','d','h','k','h','o','l'];
// class _refreshtestState extends State<refreshtest> {
//   var refreshKey2 = GlobalKey<RefreshIndicatorState>();
//   Future<void> refreshList() async {
//     //refreshKey2.currentState?.show(atTop: false);
//     await Future.delayed(Duration(seconds: 2));
//
//     setState(() {
//       new refreshtest();
//     });
//
//     return null;
//   }
//   bool isFetch=false;
//   @override
//   Widget build(BuildContext context) {
//
//   return   Consumer<DirPath>(
//     builder: (context, value, child) {
//     return  RefreshIndicator(
//         onRefresh: refreshList,
//         child: GridView.builder(
//             itemCount: k.length,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 2
//             ),
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   height: 30,
//                   width: 70,
//                   color: Colors.blue,
//                 ),
//               );
//             }),
//       );
//     },
//
//   );
//
//     // Consumer<SavedVideoProvider>(
//     //       builder: (context, snapshot,child) {
//     //         if (isFetch==false) {
//     //           snapshot.getPath('.png');
//     //           snapshot.getPath('.mp4');
//     //           Future.delayed(const Duration(microseconds: 1),(){
//     //             isFetch=true;
//     //           });
//     //         }
//     //         return snapshot.isWhatsappAvailable==false?Center(child: NoWhatsappFound()):
//     //         snapshot.getAllVideosImages.isEmpty?Center(child: NoVideosFound(txt: 'Images',)):
//     //
//     //           RefreshIndicator(
//     //             onRefresh: refreshList,
//     //
//     //             child: GridView.builder(
//     //                 physics: BouncingScrollPhysics(),
//     //                 itemCount: snapshot.getAllVideosImages.length,
//     //                 gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
//     //                   crossAxisCount: 2,
//     //                   crossAxisSpacing: 6.h,
//     //                   mainAxisSpacing: 6.w,
//     //                 ),
//     //                 itemBuilder: (context, index) {
//     //
//     //                   final data=snapshot.getAllVideosImages[index];
//     //                   final String itemPath = snapshot.getAllVideosImages[index].path;
//     //                   if (itemPath.endsWith('.mp4')){
//     //                     return
//     //                       FutureBuilder<String>(
//     //                           future: videoThumbNails(itemPath),
//     //                           builder: (context, snapshot) {
//     //                             if (!snapshot.hasData) {
//     //                               return Center(child: shimmeraffect());
//     //                             }
//     //                             if (snapshot.connectionState==ConnectionState.waiting) {
//     //                               return Center(child: shimmeraffect());
//     //                             }
//     //                             return Stack(
//     //                               alignment: AlignmentDirectional.bottomEnd,
//     //                               children: [
//     //                                 GestureDetector(
//     //                                   onTap: (){
//     //                                     Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailSavedScreen(
//     //                                       imagePath: data.path,
//     //
//     //                                       image: data,
//     //                                       isVideo_Or_Image: true,
//     //
//     //                                     )));
//     //                                   },
//     //                                   child: Container(
//     //                                     decoration: BoxDecoration(
//     //                                       image: DecorationImage(fit: BoxFit.cover,
//     //                                           image: FileImage(File(snapshot.data!))
//     //                                       ),
//     //                                       color: Colors.blue,
//     //                                       borderRadius: BorderRadius.circular(15.r),
//     //                                     ),
//     //                                   ),
//     //                                 ),
//     //                                 Container(
//     //                                   width: double.maxFinite,
//     //                                   height: 35.h,
//     //                                   decoration: BoxDecoration(
//     //                                       color: Color(0x6B111010),
//     //                                       borderRadius: BorderRadius.only(bottomLeft:Radius.circular(15.r),bottomRight:Radius.circular(15.r))
//     //                                   ),
//     //                                   child: Row(
//     //                                     mainAxisAlignment: MainAxisAlignment.end,
//     //                                     children: [
//     //                                       IconButton(onPressed: (){
//     //                                         Constant.shareImages(data.path);
//     //                                       }, icon: Icon(Icons.share_sharp,
//     //                                         color: Colors.white,
//     //                                       ),
//     //                                       ),
//     //
//     //                                     ],
//     //                                   ),
//     //                                 ),
//     //
//     //                                 Align(
//     //
//     //                                   child: Icon(Icons.play_circle,
//     //                                     color: Colors.black,
//     //                                     size: 30.sp,
//     //                                   ),
//     //                                   alignment: Alignment.center,
//     //                                 ),
//     //
//     //                               ],
//     //                             );
//     //                           }
//     //                       );
//     //                   }
//     //                   if(itemPath.endsWith('.jpg')){
//     //                     return Stack(
//     //                       alignment: AlignmentDirectional.bottomEnd,
//     //                       children: [
//     //                         GestureDetector(
//     //                           onTap: (){
//     //                             Navigator.push(
//     //                                 context, MaterialPageRoute(builder: (_)=>DetailSavedScreen(
//     //                               image:data,
//     //                               imagePath:data.path,
//     //                               isVideo_Or_Image: false,
//     //                             )
//     //                             )
//     //                             );
//     //                           },
//     //                           child: Container(
//     //                             decoration: BoxDecoration(
//     //                               image: DecorationImage(fit: BoxFit.cover,
//     //                                   image: FileImage(File(data.path))
//     //                               ),
//     //                               //  color: Colors.blue,
//     //                               borderRadius: BorderRadius.circular(15.r),
//     //                             ),
//     //                           ),
//     //                         ),
//     //                         Container(
//     //                           width: double.maxFinite,
//     //                           height: 35.h,
//     //                           decoration: BoxDecoration(
//     //                               color: Color(0x6B111010),
//     //                               borderRadius: BorderRadius.only(bottomLeft:Radius.circular(15.r),bottomRight:Radius.circular(15.r))
//     //                           ),
//     //                           child: Row(
//     //                             mainAxisAlignment: MainAxisAlignment.end,
//     //                             children: [
//     //                               IconButton(onPressed: (){
//     //                                 Constant.shareImages(data.path);
//     //                                 //  FlutterNativeApi.shareImage(data.path);
//     //                               }, icon: Icon(Icons.share_sharp,
//     //                                 color: Colors.white,
//     //                               ),
//     //                               ),
//     //                             ],
//     //                           ),
//     //                         )
//     //                       ],
//     //                     );
//     //                   }
//     //                   return SizedBox(
//     //                     height: 0.0.h,
//     //                     width: 0.0.w,
//     //                   );
//     //                   //  else{
//     //                   // return  NoVideosFound(txt: 'No Saved',);
//     //                   //
//     //                   //  }
//     //
//     //
//     //                 }),
//     //           );
//     //       }
//     //
//     // );
//   }
// }
