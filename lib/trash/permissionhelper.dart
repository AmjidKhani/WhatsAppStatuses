// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:saf/saf.dart';
//
// class permissionhelper{
//   List<String> images = [];
//   List<String> videos=[];
//   List<String> allData=[];
//   late Saf saf;
//   String whatsapp_path='Android/media/com.whatsapp/WhatsApp/Media/.Statuses';
//
//
//   PermissionStatus permissionStatus = PermissionStatus.denied;
//
//  checkPermission() async {
//   permissionStatus = await Permission.storage.status;
// }
// Future getPermissions(BuildContext context) async {
//
//   if (permissionStatus.isDenied) {
//     await Permission.storage.request();
//     permissionStatus = await Permission.storage.status;
//
//   }
//   if (permissionStatus.isGranted) {
//     saf = Saf(whatsapp_path);
//     await saf.getDirectoryPermission(isDynamic: true);
//
//   }
// }
//   loadimages(BuildContext context)async{
//     try{
//       var cachedFilesPath = await saf.cache();
//       if (cachedFilesPath != null) {
//         loadImage(cachedFilesPath);
//       }
//     }
//     catch(e)
//     {
//       Permission.storage.request();
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('please Give Necessary Permissions')));
//     }
//   }
//   loadImage(paths) {
//     for (String path in paths) {
//       allData.add(path);
//       if (path.endsWith('.mp4') ) {
//         videos.add(path);
//       }
//
//       if (path.endsWith(".jpg")) {
//
//         images.add(path);}
//       // setState(() {
//       // });
//     }
//   }
// }
