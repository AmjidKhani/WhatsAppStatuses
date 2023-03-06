import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';


Future<String> videoThumbNails(String paths)async{
  var directory = await getTemporaryDirectory();

  String?  thub=await VideoThumbnail.thumbnailFile(
    thumbnailPath:directory.path ,
    video: paths,
  );
  return thub!;
}

