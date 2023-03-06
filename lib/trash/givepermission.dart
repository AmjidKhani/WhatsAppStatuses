// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:saf/saf.dart';
// import '../../constant/constant.dart';
// import '../../constant/dialogs/howtouse.dart';
// import '../../permissionhelper.dart';
// import '../Home.dart';
//
// class PleaseGivePermission extends StatefulWidget {
//   const PleaseGivePermission({Key? key}) : super(key: key);
//
//   @override
//   State<PleaseGivePermission> createState() => _PleaseGivePermissionState();
// }
//
// class _PleaseGivePermissionState extends State<PleaseGivePermission> with AutomaticKeepAliveClientMixin{
//   List<String> images = [];
//   List<String> videos=[];
//   List<String> allData=[];
//   late Saf saf;
//   String whatsapp_path='Android/media/com.whatsapp/WhatsApp/Media/.Statuses';
//   PermissionStatus permissionStatus = PermissionStatus.denied;
//
//
//   Future checkPermission() async {
//     permissionStatus = await Permission.storage.status;
//   }
//   getPermissions(BuildContext context) async {
//     if (permissionStatus.isDenied) {
//       await Permission.storage.request();
//       permissionStatus = await Permission.storage.status;
//       print(permissionStatus);
//     //  check=permissionStatus;
//       //print(check);
//     }
//     if (permissionStatus.isGranted) {
//       saf = Saf(whatsapp_path);
//       await saf.getDirectoryPermission(isDynamic: true);
//
//     }
//   }
//   @override
//   void initState() {
//     checkPermission();
//    getPermissions(context);
//    super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  Stack(
//       children: [
//     Center(
//     child: Align(
//     alignment: Alignment.center,
//       child: ListView(
//           shrinkWrap: true,
//           children: [
//             Center(child: Icon(Icons.info_outline,
//                 size: 40.sp,
//                 color: Constant.buttonColor
//             )),
//             SizedBox(height: 20.h,),
//             Center(child: Text('Please Give Necessary Permission',style: Constant.alertMessage,)),
//             SizedBox(height: 20.h,),
//             Center(child: Text('Click on Allow Permission Button ',style: Constant.alertMessageSmall,)),
//             SizedBox(height: 10.h,),
//             Center(child: Text('Click On Use This Folder',style: Constant.alertMessageSmall)),
//             SizedBox(height: 10.h,),
//             Center(child: Text('Click On Allow',style: Constant.alertMessageSmall)),
//             SizedBox(height: 20.h,),
//             Padding(
//               padding:  EdgeInsets.symmetric(horizontal:65.0.w),
//               child: ElevatedButton(
//                 child: Container(
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.whatsapp,
//                         size: 30.sp,
//                       ),
//                       SizedBox(width: 10.w,),
//                       Text(
//                         'Allow Permission',
//                         style: TextStyle(fontSize: 15.0.sp),
//                       ),
//                     ],
//                   ),
//                 ),
//                 onPressed: () {
//                   permissionhelper().getPermissions(context);
//                   },
//                 style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0.r))),
//                     primary: Constant.buttonColor,
//                     padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
//                     textStyle: TextStyle(
//                         fontSize: 30.sp,
//                         fontWeight: FontWeight.bold)
//                 ),
//               ),
//             ),
//           ]
//       ),
//     ),
//     )
//       ],
//     );
//
//   }
//
//   @override
//   // TODO: implement wantKeepAlive
//   bool get wantKeepAlive => true;
//
// }
