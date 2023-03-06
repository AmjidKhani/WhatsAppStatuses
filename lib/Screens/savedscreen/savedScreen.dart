import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import '../../constant/constant.dart';
import '../../constant/shimmer.dart';
import '../../provider/adsProvider/adsprovider.dart';
import '../../provider/savedvideoprovider/savevideoprovider.dart';
import '../../slider.dart';
import '../Picscreen/Detail_PicScreen.dart';
import '../noFound/novideosfound.dart';
import '../noFound/nowhatsappfound.dart';
import '../videoscreen/video_thumnails.dart';
import 'detailSavedScreen.dart';
class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);
  @override
  State<SavedScreen> createState() => _SavedScreenState();
}
class _SavedScreenState extends State<SavedScreen> with AutomaticKeepAliveClientMixin {
  var refreshKey2 = GlobalKey<RefreshIndicatorState>();

bool isFetche=false;
bool ischeck=false;
@override
  void initState() {
  //======For Admob Ads=========//
  // Future.delayed(Duration(seconds: 2)).then((value) {
  //   Provider.of<AdsProvider>(context,listen: false).initializedSavedScreen_Banner();
  // });
  //======For Admob Ads=========//
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //======For Admob Ads=========//

      //   bottomNavigationBar: Consumer<AdsProvider>(
      //     builder: (context, value, child){
      //       return  value.isSavedScreen_Banner_Loaded?
      //       Padding(
      //         padding: const EdgeInsets.only(bottom: 10.0),
      //         child: Container(
      //             height: value.SavedScreen_Banner.size.height.toDouble(),
      //             width: value.SavedScreen_Banner.size.width.toDouble(),
      //             child: AdWidget(
      //                 ad: value.SavedScreen_Banner
      //             )),
      //       ):
      //       Padding(
      //         padding: const EdgeInsets.only(bottom: 10.0),
      //         child: Container(height: 0,width: 0,
      //           color: Colors.red,
      //         ),
      //       );},
      //   ),
        //======For Admob Ads=========//
      //======For Admob Ads=========//
        body:
        Consumer<SavedVideoProvider>(
        builder: (context, snap,child) {
          if (isFetche==false) {

            snap.getPath('.jpg');
            snap.getPath('.mp4');
            Future.delayed(const Duration(microseconds: 1),(){
              isFetche=true;
            });
          }
          return snap.isWhatsappAvailable==false?Center(child:
          NoWhatsappFound(providersnap: snap,getVideo: true,getimages: true,)):
            snap.getAllVideosImages.isEmpty ? Center(child:
            NoVideosFound(txt: 'Images And Videos',snap: snap,getImages: true,
            getVideos: true )) : RefreshIndicator(
              onRefresh: ()async{
                await   snap.getPath('.mp4');
             await   snap.getPath('.jpg');
              },
              child: Padding(
                padding:  EdgeInsets.only(left: 8.0.w,right:8.0.w ,bottom:8.0.h ,top:8.0.h ),
                child: GridView.builder(
                    itemCount: snap.getAllVideosImages.length,
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 6.h,
          mainAxisSpacing: 6.w,
          ),
          itemBuilder: (context, index) {

          final data=snap.getAllVideosImages[index];
          final String itemPath = snap.getAllVideosImages[index].path;
          if (itemPath.endsWith('.mp4')){
          return
          FutureBuilder<String>(
          future: videoThumbNails(itemPath),
          builder: (context, snapshot) {
          if (!snapshot.hasData) {
          return Center(child: shimmeraffect());
          }
          if (snapshot.connectionState==ConnectionState.waiting) {
          return Center(child: shimmeraffect());
          }
          return Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
          GestureDetector(
          onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailSavedScreen(
          imagePath: data.path,
            image: data,
          isVideo_Or_Image: true,
          )
          )
          );
          },
          child: Container(
          decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.cover,
          image: FileImage(File(snapshot.data!))
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          IconButton(onPressed: (){
          Constant.shareImages(data.path);
          }, icon: Icon(Icons.share_sharp,
          color: Colors.white,
          ),
          ),

          ],
          ),
          ),
            Align(
            child: Icon(Icons.play_circle,
          color: Colors.black,
          size: 30.sp,
          ),
          alignment: Alignment.center,
          ),

          ],
          );
          }
          );
          }
          if(itemPath.endsWith('.jpg')){
          return Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
          GestureDetector(
          onTap: (){
          Navigator.push(
          context, MaterialPageRoute(builder: (_)=>DetailSavedScreen(
          image:data,
          imagePath:data.path,
          isVideo_Or_Image: false,
          )
          )
          );
          },
          child: Container(
          decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.cover,
          image: FileImage(File(data.path))
          ),
          //  color: Colors.blue,
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          IconButton(onPressed: (){
          Constant.shareImages(data.path);
          //  FlutterNativeApi.shareImage(data.path);
          }, icon: Icon(Icons.share_sharp,
          color: Colors.white,
          ),
          ),
          ],
          ),
          )
          ],
          );
          }
          return SizedBox(
          height: 0.0.h,
          width: 0.0.w,
          );
          //  else{
          // return  NoVideosFound(txt: 'No Saved',);
          //
          //  }


          }),
              ),
            );

        }

    )

    );
  }
// RefreshIndicator Col(String txt ,var snap){
//     return
//         RefreshIndicator(
//           onRefresh: () async{
//           await  Future.delayed(Duration(seconds: 1));
//           await snap.getPath('.png');
//            await snap.getPath('.mp4');
//           },
//           child: Center(
//             child: Align(
//               alignment: Alignment.center,
//               child: ListView(
//               shrinkWrap: true,
//                   children: [
//               Center(child: Icon(Icons.info_outline,
//               size: 40.sp,
//               color: Constant.buttonColor
//               )),
//               SizedBox(height: 20.h,),
//               Center(child: Text('No ${txt} Available Now.',style: Constant.alertMessage,)),
//               SizedBox(height: 20.h,),
//               Center(child: Text('Open Whatsapp Status',style: Constant.alertMessageSmall,)),
//               SizedBox(height: 10.h,),
//               Center(child: Text('View Status From WhatsApp',style: Constant.alertMessageSmall)),
//               SizedBox(height: 10.h,),
//               Center(child: Text('Open This App to Download',style: Constant.alertMessageSmall)),
//               SizedBox(height: 20.h,),
//               Padding(
//               padding:  EdgeInsets.symmetric(horizontal:65.0.w),
//               child: ElevatedButton(
//                 child: Container(
//               child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//               Icon(Icons.whatsapp,
//               size: 30.sp,
//               ),
//               SizedBox(width: 10.w,),
//               Text(
//               'Open Whatsapp',
//               style: TextStyle(fontSize: 15.0.sp),
//               ),
//               ],
//               ),
//               ),
//               onPressed: () {
//               Constant.openApp();
//               },
//               style: ElevatedButton.styleFrom(
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0.r))),
//               primary: Constant.buttonColor,
//               padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
//               textStyle: TextStyle(
//               fontSize: 30.sp,
//               fontWeight: FontWeight.bold)
//               ),
//               ),
//               ),
//               ]
//               ),
//             ),
//           ),
//         );
//
//
// }
@override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
