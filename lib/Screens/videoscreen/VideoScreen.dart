import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant/constant.dart';
import '../../constant/shimmer.dart';
import '../../provider/adsProvider/adsprovider.dart';
import '../../provider/new pevider/getdirectorypath.dart';
import '../../slider.dart';
import 'video_thumnails.dart';
import '../Picscreen/Detail_PicScreen.dart';
import 'Detail_VideoScreen.dart';
import '../noFound/novideosfound.dart';
import '../noFound/nowhatsappfound.dart';
class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);
  @override
  State<VideoScreen> createState() => _VideoScreenState();
}
class _VideoScreenState extends State<VideoScreen>with  AutomaticKeepAliveClientMixin{
  void initState() {

    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        downloadedVideos = prefs.getStringList('downloaded_videos')?.toSet() ?? {

        };
      });
    });
    //======For Admob Ads=========//
    // Future.delayed(Duration(seconds: 2)).then((value) {
    //   Provider.of<AdsProvider>(context,listen: false).initializedDetailScreen_Banner();
    // });
    //======For Admob Ads=========//
    Future.delayed(Duration(microseconds: 0)).then((value) {
      Provider.of<DirPath>(context,listen: false).checkPermission();
      Provider.of<DirPath>(context,listen: false).getPermissions(context);
    });
    // TODO: implement initState
    super.initState();
  }
  Set<String> downloadedVideos = {};
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      //======For Admob Ads=========//
      // bottomNavigationBar: Consumer<AdsProvider>(
      //   builder: (context, value, child){
      //     return  value.isDetailScreen_Banner_Loaded?
      //     Padding(
      //       padding: const EdgeInsets.only(bottom: 10.0),
      //       child: Container(
      //           height: value.DetailScreen_Banner.size.height.toDouble(),
      //           width: value.DetailScreen_Banner.size.width.toDouble(),
      //           child: AdWidget(
      //               ad: value.DetailScreen_Banner
      //           )
      //       ),
      //     ):
      //     Padding(
      //       padding: const EdgeInsets.only(bottom: 10.0),
      //       child: Container(height: 0,width: 0,
      //         color: Colors.red,
      //       ),
      //     );
      //     },
      // ),
      //======For Admob Ads=========//
      body:
      Consumer<DirPath>(
          builder: (context, snapshot,child ) {
            if (snapshot.isFetch==false) {
              snapshot.LoadAllCache(context);
              Future.delayed(const Duration(microseconds: 1),(){
                snapshot.changevalue();
              });
            }
            return snapshot.isWhatsappAvailable==false?Center(child: NoWhatsappFound( providersnap: snapshot,getVideo: true, getimages: false,)):
            snapshot.videos.isEmpty?
            NoVideosFound(txt:'Videos' ,snap:snapshot ,getVideos:true ,getImages: false,)

                :RefreshIndicator(
              onRefresh: ()async{
               await snapshot.LoadAllCache(context);
                },
                  child: Padding(
              padding:  EdgeInsets.only(left: 8.0.w,right:8.0.w ,bottom:8.0.h ,top:8.0.h ),
              child: GridView.builder(
                  itemCount: snapshot.videos.length,
                    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.h,
                        mainAxisSpacing: 8.w
                    ),
                    itemBuilder: (context, index) {

                      final data=snapshot.videos[index];


                      final videoPath=snapshot.videos[index];
                      bool isDownloaded = downloadedVideos.contains(data);
                      log('logo cehck==$data');
                      return
                        FutureBuilder<String>(
                          future: videoThumbNails(data),
                          builder: (context, snapshots) {
                            if (!snapshots.hasData) {
                              return Center(child: shimmeraffect());
                              //CircularProgressIndicator());
                            }
                            if (snapshots.connectionState==ConnectionState.waiting) {
                              return Center(child: shimmeraffect());
                            }
                            return Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail_VideoScreen(
                                videoPath: data,
                                video: data,
                              )));
                            },
                            child: Container(
                            decoration: BoxDecoration(
                            image: DecorationImage(fit: BoxFit.cover,
                            image: FileImage(File(snapshots.data!))
                            ),
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15.r),
                            ),
                            ),
                            ),
                                Container(
                                  width: double.maxFinite,
                                  height: 35.h,
                                  decoration: BoxDecoration(
                                      color: Color(0x6B111010),
                                      borderRadius: BorderRadius.only(bottomLeft:Radius.circular(15.r),bottomRight:Radius.circular(15.r))
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(onPressed: (){
                                        Constant.shareImages(data);
                                      }, icon: Icon(Icons.share_sharp,
                                        color: Colors.white,
                                      ),
                                      ),
                                      IconButton(
                                        onPressed:  isDownloaded
    ? (){
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text('Already Saved'),
                                              duration: Duration(seconds: 2),
                                            ),
                                          );
                                        }
                                        :

    () async {


      SharedPreferences prefs = await SharedPreferences.getInstance();
      String imagePaths = data;
      List<String> downloadedvideos = prefs.getStringList('downloaded_videos') ?? [];

      if (downloadedvideos.contains(imagePaths)) {

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Video Already Saved'),
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
                                          Icons.download,
                                        color: Colors.white,
                                      ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
                          }
                      );
                    }),
            ),
                );
          }
      ),
    );


  }
  // Widget NoVideoFounds(var dataofprovider){
  //   return RefreshIndicator(
  //     onRefresh: () async{
  //       await  Future.delayed(Duration(seconds: 1));
  //       // if (widget.getImages==true) {
  //       //   await widget.snap.getPath('.jpg');
  //       // }
  //       // if (widget.getVideos==true) {
  //       //   await widget.snap.getPath('.mp4');
  //       // }
  //       // await Provider.of<DirPath>(context).ge
  //     },
  //     child: Center(
  //       child: Align(
  //         alignment: Alignment.center,
  //         child: ListView(
  //             shrinkWrap: true,
  //             children: [
  //               Center(
  //                   child: Icon(Icons.info_outline,
  //                       size: 40.sp,
  //                       color: Constant.buttonColor
  //                   )
  //               ),
  //               SizedBox(height: 20.h,),
  //               Center(child: Text('No ${widget.txt} Available Now.',style: Constant.alertMessage,)),
  //               SizedBox(height: 20.h,),
  //               Center(child: Text('Open Whatsapp Status',style: Constant.alertMessageSmall,)),
  //               SizedBox(height: 10.h,),
  //               Center(child: Text('View Status From WhatsApp',style: Constant.alertMessageSmall)),
  //               SizedBox(height: 10.h,),
  //               Center(child: Text('Open This App to Download',style: Constant.alertMessageSmall)),
  //               SizedBox(height: 20.h,),
  //               Padding(
  //                 padding:  EdgeInsets.symmetric(horizontal:65.0.w),
  //                 child: ElevatedButton(
  //                   child: Container(
  //                     child: Row(
  //                       crossAxisAlignment: CrossAxisAlignment.center,
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         Icon(Icons.whatsapp,
  //                           size: 30.sp,
  //                         ),
  //                         SizedBox(width: 10.w,),
  //                         Text(
  //                           'Open Whatsapp',
  //                           style: TextStyle(fontSize: 15.0.sp),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   onPressed: () {
  //                     Constant.openApp();
  //                   },
  //                   style: ElevatedButton.styleFrom(
  //                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0.r))),
  //                       primary: Constant.buttonColor,
  //                       padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
  //                       textStyle: TextStyle(
  //                           fontSize: 30.sp,
  //                           fontWeight: FontWeight.bold)
  //                   ),
  //                 ),
  //               ),
  //             ]
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
