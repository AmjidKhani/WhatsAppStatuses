import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:statussaver/provider/new%20pevider/getdirectorypath.dart';
import 'package:video_player/video_player.dart';
import '../../constant/constant.dart';
import '../../slider.dart';
import '../Picscreen/Detail_PicScreen.dart';
class Detail_VideoScreen extends StatefulWidget {
  String? videoPath;
  String? video;
   Detail_VideoScreen({Key? key,this.videoPath,required this.video}) : super(key: key);
   @override
  State<Detail_VideoScreen> createState() => _Detail_VideoScreenState();
}
class _Detail_VideoScreenState extends State<Detail_VideoScreen> {
   ChewieController?  _chewieController;

  @override
  void initState() {

    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        downloadedVideos = prefs.getStringList('downloaded_videos')?.toSet() ?? { };
      });
    });
    _chewieController=ChewieController(
        videoPlayerController: VideoPlayerController.file(
          File(widget.videoPath!)
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
   Set<String> downloadedVideos = {};
  @override
  void dispose() {
    _chewieController!.pause();
    _chewieController!.dispose();

    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final Videoss=Provider.of<DirPath>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Video'
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 30.h,),
          Container(
            height: 432.h,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.red
            ),
            child:   Chewie(
              controller: _chewieController!,
            ),
          ),
      bottombuttons(context,widget.videoPath!, downloadedVideos ),
        ],
      ),
    );
  }

  Container bottombuttons(BuildContext context,String videoPath,var downloadedVideos) {
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
              IconButton(onPressed: (){
                Constant.shareImages(videoPath);
              }, icon: Icon(Icons.ios_share
                ,  size: 30.sp,
                color: Colors.white,
              )),
              Center(child: Text('Post',style: TextStyle(color: Colors.white),))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (){
                Constant.shareImages(videoPath,);
              }, icon: Icon(Icons.share_sharp,
                size: 30.sp,
                color: Colors.white,
              )),
              Center(
                child: Text('Share',style: TextStyle(color: Colors.white
                ),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<DirPath>(
                builder: (context, value, child) {
                  bool isDownloaded = downloadedVideos.contains(videoPath);
                  return  IconButton(
                      onPressed:isDownloaded
                          ?
                          (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Already Saved'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }:
                          () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        String imagePaths = videoPath;
                        List<String> downloadedvideos = prefs.getStringList('downloaded_videos') ?? [];
                        if (downloadedvideos.contains(imagePaths)) {

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Image already downloaded'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                        else
                        {
                          per().saveVideo(imagePaths, context).then((value) {
                            downloadedvideos.add(imagePaths);
                            prefs.setStringList('downloaded_videos', downloadedvideos);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Save Successfully'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          });
                        }
                      },
                      icon: Icon(
                        isDownloaded? Icons.done:

                        Icons.download
                    ,size: 30.sp,
                    color: Colors.white,
                  ));
                },
              ),
              Center(child: Text( 'Save',style: TextStyle(color: Colors.white),))
            ],
          ),

        ],
      ),
    );
  }
}
