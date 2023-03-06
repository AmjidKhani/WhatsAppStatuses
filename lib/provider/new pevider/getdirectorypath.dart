import 'dart:core';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:saf/saf.dart';

import '../../constant/constant.dart';
import '../../main.dart';

class DirPath extends ChangeNotifier{
 // List<bool> doneList = List<bool>.generate(down.length, (index) => false);
  List<String> _images = [];
  List<String> _videos=[];
  List<String> _allData=[];
  bool _isImageDownload=false;
  bool _isVideoDownload=false;
  List<bool> _doneList=[];

  List<bool> get doneList=>_doneList;
  bool _Refreshornot=false;
  bool get Refreshornot=>_Refreshornot;
  Refreshed(){
    _Refreshornot=!_Refreshornot;
    notifyListeners();
  }
  getIndex(var index){
    _doneList=List<bool>.generate(_allData.length, (index) => false);
    doneList[index] = true;
    notifyListeners();
  }
  bool get  isImageDownload=>_isImageDownload;
  bool get  isVideoDownload=>_isVideoDownload;
  changeVideoDownloadFalseToTrue(){
    _isVideoDownload=true;
    notifyListeners();
  }
  changeImageDownloadFalseToTrue(){
    _isImageDownload=true;
    notifyListeners();
  }
  List<String> get images=>_images;
  List<String> get videos=>_videos;
  List<String> get AllData=>_allData;
  bool _isWhatsappAvailable=false;
  bool _isFetch=false;
  bool get isFetch=>_isFetch;
  bool  get isWhatsappAvailable  =>_isWhatsappAvailable;

  Saf saf=Saf('Android/media/com.whatsapp/WhatsApp/Media/.Statuses');
  Saf safw4b=Saf('Android/media/com.whatsapp.w4b/WhatsApp Business/Media/.Statuses');
  bool  _changeColor=false;
  bool get changeColor=>_changeColor;
  ChangeColorMethode(BuildContext context){
    //checkPermission();
    //getw4bPermissions(context);
    _changeColor=!_changeColor;
    notifyListeners();
  }
  changevalue(){
    _isFetch=true;
    notifyListeners();
  }
   PermissionStatus permissionStatus = PermissionStatus.denied;
   checkPermission() async {
    permissionStatus = await Permission.storage.status;
    notifyListeners();
  }

  getw4bPermissions(BuildContext context) async {
    if (permissionStatus.isDenied) {
      await Permission.storage.request();
      permissionStatus = await Permission.storage.status;
      print(permissionStatus);
      //check=permissionStatus;
      //print(check);
    }
    if (permissionStatus.isGranted) {
     // saf = Saf(whatsapp_path);
      await safw4b.getDirectoryPermission(isDynamic: true);
notifyListeners();
    }
    notifyListeners();
  }


  getPermissions(BuildContext context) async {
    if (permissionStatus.isDenied) {
      await Permission.storage.request();
      permissionStatus = await Permission.storage.status;
      print(permissionStatus);
      //check=permissionStatus;
      //print(check);
    }
    if (permissionStatus.isGranted) {
      // saf = Saf(whatsapp_path);
      await saf.getDirectoryPermission(isDynamic: true);
      notifyListeners();
    }
    notifyListeners();
  }

  //WhatsApp For Business
  LoadB4bCache(BuildContext context) async {
     try
     {
       var cachedFilesPath = await safw4b.cache();
       if (cachedFilesPath != null) {

         notifyListeners();
       }
     }
     catch(e){
print(e.toString());
     }
  }
  LoadAllCache(BuildContext context)async{
    try{
      var cachedFilesPath = await saf.cache();
      if (cachedFilesPath != null) {
        _isWhatsappAvailable=true;
        _allData.clear();
        _videos.clear();
        _images.clear();
        if (_changeColor == true) {
          var w4bListOfPaths = await safw4b.cache();
          if (w4bListOfPaths != null) {
            cachedFilesPath.addAll(w4bListOfPaths);
          }
        }
        loadImage(cachedFilesPath);

          notifyListeners();
      }
    }
    catch(e)
    {
      print('Value Of saf ==$e');
       }
  }

  loadImage(paths)
 async {
    for (String path in paths) {
      _allData.add(path);

      if (path.endsWith('.mp4') ) {
        _videos.add(path);
      }
      if (path.endsWith(".jpg")) {

        _images.add(path);
      }
      notifyListeners();

    }

  }
    }