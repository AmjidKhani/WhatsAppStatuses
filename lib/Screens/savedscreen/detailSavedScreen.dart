import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../constant/constant.dart';
import '../../slider.dart';

class DetailSavedScreen extends StatefulWidget {
  String? imagePath;
  bool? isVideo_Or_Image;
  FileSystemEntity? image;
   DetailSavedScreen({Key? key,
   required this.imagePath,
   required this.image,
     required this.isVideo_Or_Image
   }
   ) : super(key: key);
   @override
  State<DetailSavedScreen> createState() => _DetailSavedScreenState();
}
class _DetailSavedScreenState extends State<DetailSavedScreen> {
  ChewieController?  _chewieController;
  @override
  void initState() {
    _chewieController=ChewieController(
      videoPlayerController: VideoPlayerController.file(
          File(widget.imagePath!)
      ),
      autoInitialize: true,
      errorBuilder: (context, errorMessage) => Text(errorMessage),
      allowMuting: true,
      looping: true,
      aspectRatio: 5/6,
      autoPlay: true,
    );
    // TODO: implement initState
    super.initState();
  }
  void dispose() {
    _chewieController!.pause();
    _chewieController!.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Saved',
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.isVideo_Or_Image==true?SizedBox(height: 50.h,):Container(),
          widget.isVideo_Or_Image==true?
      Container(
          height: 422.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
          ),
          child:   Chewie(
            controller: _chewieController!,
          ),
        ): Padding(
            padding:  EdgeInsets.symmetric(horizontal: 0.0.w ,vertical: 0.0.h),
            child: Container(
              height: 550.h,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.contain,
                    image: FileImage(File(widget.imagePath!))
                ),
                // color: Colors.black,

              ),
            ),
          ),

          bottombuttons(widget.image!,widget.imagePath!,context)
        ],
      ),
    );

  }
  Container bottombuttons(FileSystemEntity image,String  imagePath,BuildContext context) {
    return Container(
      height: 90.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: Colors.black
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: ()
              {
                Constant.shareImages(imagePath);
              }, icon: Icon(Icons.ios_share
                ,  size: 30.sp,
                color: Colors.white,
              )),
              Center(child: Text('post',style: TextStyle(color: Colors.white),))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (){
                Constant.shareImages(imagePath);
              },
                  icon: Icon(Icons.share_sharp,
                    size: 30.sp,
                    color: Colors.white,
                  )),
              Center(
                child: Text('Share',style: TextStyle(color: Colors.white

                ),),
              )
            ],
          ),


        ],
      ),
    );
  }
}
