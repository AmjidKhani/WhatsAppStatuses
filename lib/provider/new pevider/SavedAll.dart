import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:saf/saf.dart';

import '../../constant/constant.dart';

class SavedAllDataProvider extends ChangeNotifier{

  List<String>  _getAllImagesVideos=[];

  List<String> get  getAllVideosImages =>_getAllImagesVideos;
  bool _isWhatsappAvailable=false;
  bool  get isWhatsappAvailable  =>_isWhatsappAvailable;

  String whatsapp_path='Android/media/com.whatsapp/WhatsApp/Media/.Statuses';
  Saf saf=Saf('Android/media/com.whatsapp/WhatsApp/Media/.Statuses');
loadSaveFiles(){

}

}