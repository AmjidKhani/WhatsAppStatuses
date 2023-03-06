import 'dart:io';
import 'package:flutter/material.dart';
import 'package:media_scanner/media_scanner.dart';
import 'package:path_provider/path_provider.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
class per{



 static Future<bool> requestPermission() async {

    bool storagePermission = await Permission.storage.isGranted;
    bool mediaPermission = await Permission.accessMediaLocation.isGranted;
    bool manageExternal = await Permission.manageExternalStorage.isGranted;

    if (!storagePermission) {
      storagePermission = await Permission.storage.request().isGranted;
    }
    if (!mediaPermission) {
      mediaPermission =
      await Permission.accessMediaLocation.request().isGranted;
    }

    if (!manageExternal) {
      manageExternal =
      await Permission.manageExternalStorage.request().isGranted;
    }

    bool isPermissionGranted =
        storagePermission && mediaPermission && manageExternal;

    if (isPermissionGranted) {
      return true;
    } else {
      return false;
    }}

 //For Creating Directory

 static Future initRecorder(context,String filename) async {
    bool permission = await requestPermission();
    if (Platform.isAndroid) {
      if (permission) {
        var directory = await getExternalStorageDirectory();
        String newPath = "";
        print(directory);
        String convertedDirectoryPath = (directory?.path).toString();
        List<String> paths = convertedDirectoryPath.split("/");
        for (int x = 1; x < convertedDirectoryPath.length; x++) {
          String folder = paths[x];
          if (folder != "Android") {
            newPath += "/" + folder;
          } else {
            break;
          }
        }
        newPath = newPath+"/Whatsapp Status Saver/Video";
        print(newPath);
        directory = Directory(newPath);
        if (!await directory.exists()) {
          await directory.create(recursive: true);
        }
        // if(await directory.exists()){
        //   File saveFile = File(directory.path + "/$filename");
        //   await ImageGallerySaver.saveFile(saveFile.path);
        // }
      }

      else {
        print("permssion denied");
        Navigator.of(context).pop();
        print('Please give neccessary permission');
     //   Fluttertoast.showToast(msg: "Please give neccesary permissions");
        return false;
      }
    }}

//For Saving Files

 Future<void> saveImage(String image,context) async {
   bool permission = await requestPermission();
   if (Platform.isAndroid) {
     if (permission) {
       var directory = await getExternalStorageDirectory();
       String newPath = "";
       print(directory);
       String convertedDirectoryPath = (directory?.path).toString();
       List<String> paths = convertedDirectoryPath.split("/");
       for (int x = 1; x < convertedDirectoryPath.length; x++) {
         String folder = paths[x];
         if (folder != "Android") {
           newPath += "/" + folder;
         } else {
           break;
         }
       }
       newPath = newPath+"/Status Saver";
       print(newPath);
       directory = Directory(newPath);
       if (!await directory.exists()) {
         await directory.create(recursive: true);
       }
       if(await directory.exists()){
         final fileName = DateTime.now().millisecondsSinceEpoch.toString();
         final filePath = '${directory.path}/$fileName.jpg';
         final file = File(image);
         await file.copy(filePath);

         await MediaScanner.loadMedia(path: filePath);
         //await MediaScanner.scanFile(filePath);
       }
     }
     else {

       print("permssion denied");
       Navigator.of(context).pop();
       print('Please give neccessary permission');

       // return false;
     }
   }
 }

 Future<void> saveVideo(String image,context) async {
    bool permission = await requestPermission();
    if (Platform.isAndroid) {
      if (permission) {
        var directory = await getExternalStorageDirectory();
        String newPath = "";
        print(directory);
        String convertedDirectoryPath = (directory?.path).toString();
        List<String> paths = convertedDirectoryPath.split("/");
        for (int x = 1; x < convertedDirectoryPath.length; x++) {
          String folder = paths[x];
          if (folder != "Android") {
            newPath += "/" + folder;
          } else {
            break;
          }
        }
        newPath = newPath+"/Status Saver";
        print(newPath);
        directory = Directory(newPath);
        if (!await directory.exists()) {
          await directory.create(recursive: true);
        }
        if(await directory.exists()){
          final fileName = DateTime.now().millisecondsSinceEpoch.toString();
          final filePath = '${directory.path}/$fileName.mp4';
          final file = File(image);
          await file.copy(filePath);
          await MediaScanner.loadMedia(path: filePath);
        }
      }
      else {
        print("permssion denied");
        Navigator.of(context).pop();
        print('Please give neccessary permission');
      }
    }
  }
}

