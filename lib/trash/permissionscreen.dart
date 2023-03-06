// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'Screens/drawer.dart';
// import 'Screens/noFound/givepermission.dart';
// import 'Screens/savedscreen/savedScreen.dart';
//
//
// class PermissionScreen extends StatefulWidget {
//   const PermissionScreen({Key? key}) : super(key: key);
//
//   @override
//   State<PermissionScreen> createState() => _PermissionScreenState();
// }
// TabController? controller;
// class _PermissionScreenState extends State<PermissionScreen> with SingleTickerProviderStateMixin{
//   @override
//   void initState() {
//     controller = TabController(length: 3, vsync: this, initialIndex: 0);
//
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xff11887A),
//         elevation: 2,
//         title: Text(
//           "Status Saver",
//           style: TextStyle(
//               fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//         actions: [
//           IconButton(
//               onPressed: () {
//
//               },
//               icon: Icon(Icons.help)
//           ),
//           IconButton(onPressed: ()async {
//
//           },
//               icon: Icon(Icons.whatsapp)),
//           IconButton(onPressed: () {
//
//           }, icon: Icon(Icons.share)),
//         ],
//         bottom: TabBar(
//           physics: const BouncingScrollPhysics(),
//           indicatorSize: TabBarIndicatorSize.label,
//           labelColor: Colors.white,
//           indicatorColor: Colors.white,
//           isScrollable: true,
//           labelPadding: EdgeInsets.symmetric(horizontal:30.w,vertical: 10.h),
//           controller: controller,
//           tabs:  [
//             Text("Images", style: TextStyle(color: Colors.white, fontSize: 18.sp)),
//             Text("Videos", style: TextStyle(color: Colors.white, fontSize: 18.sp)),
//             Text("Saved", style: TextStyle(color: Colors.white, fontSize: 18.sp)),
//           ],
//         ),
//       ),
//       drawer: drawer(),
//       body: Container(
//         child: Align(
//           alignment: Alignment.centerLeft,
//           child: TabBarView(
//               physics: BouncingScrollPhysics(),
//               controller: controller,
//               children: [
//                 PleaseGivePermission(),
//                 SavedScreen(),
//                 SavedScreen(),
//               ]
//           ),
//         ),
//       ),
//     );
//   }
// }
