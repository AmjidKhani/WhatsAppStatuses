import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../constant/constant.dart';
class SavedVideoProvider extends ChangeNotifier{
  List<FileSystemEntity>  _getSavedImages=[];
  List<FileSystemEntity>  _getSavedVideos=[];
  List<FileSystemEntity>  _getAllImagesVideos=[];
  List<FileSystemEntity> get  getSavedVideos =>_getSavedVideos;
  List<FileSystemEntity> get  getSavedImages =>_getSavedImages;
  List<FileSystemEntity> get  getAllVideosImages =>_getAllImagesVideos;
  bool _isWhatsappAvailable=false;
  bool  get isWhatsappAvailable  =>_isWhatsappAvailable;


  Future getPath(String ext ) async {
    final status = await Permission.storage.request();
    if (status.isDenied) {
      Permission.storage.request();
      log('Permission Denied');
      return;
    }
    if (status.isGranted) {
      final directory = Directory(Constant.whatsapp_Status_Saved_Path);
      if (directory.existsSync()) {
        final items = directory.listSync();
        _getAllImagesVideos=items;
        notifyListeners();
        if (ext ==".jpg") {
          _getSavedImages=  items.where((images) {
            return images.path.endsWith('.jpg');
          }).toList();
          notifyListeners();
        }
        else{
          _getSavedVideos=  items.where((videos) {
            return videos.path.endsWith('.mp4');
          }).toList();
          notifyListeners();
        }


        _isWhatsappAvailable=true;
        notifyListeners();
//log(items);
      } else {
        log('No Whatsapp Found');
        _isWhatsappAvailable=false;
        notifyListeners();
      }
    }
  }

}