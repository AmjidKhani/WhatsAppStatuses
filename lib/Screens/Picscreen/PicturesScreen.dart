import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant/constant.dart';
import '../../provider/adsProvider/adsprovider.dart';
import '../../provider/new pevider/getdirectorypath.dart';
import '../../slider.dart';
import '../noFound/novideosfound.dart';
import '../noFound/nowhatsappfound.dart';
import 'Detail_PicScreen.dart';
class PictureSCreen extends StatefulWidget {
  const PictureSCreen({Key? key}) : super(key: key);
  @override
  State<PictureSCreen> createState() => _PictureSCreenState();
}
class _PictureSCreenState extends State<PictureSCreen> with AutomaticKeepAliveClientMixin {
  bool isFetch=false;
  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) {
      //======For Admob Ads=========//
      Future.delayed(Duration(seconds: 2)).then((value) {
        Provider.of<AdsProvider>(context,listen: false).initializedHomePageBanner();
      });
              //======**************=========//
      setState(() {
        downloadedImages = prefs.getStringList('downloaded_images')?.toSet() ?? { };
      });
    });
      Provider.of<DirPath>(context,listen: false).LoadAllCache(context);

    // TODO: implement initState
    super.initState();
  }
  Set<String> downloadedImages = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //======For Admob Ads=========//
      // bottomNavigationBar: Consumer<AdsProvider>(
      //   builder: (context, value, child){
      //     return  value.isHomePageBanner_Loaded?
      //     Padding(
      //       padding: const EdgeInsets.only(bottom: 10.0),
      //       child: Container(
      //           height: value.HomePageBanner.size.height.toDouble(),
      //           width: value.HomePageBanner.size.width.toDouble(),
      //           child: AdWidget(
      //               ad: value.HomePageBanner
      //           )),
      //     ):
      //     Padding(
      //       padding: const EdgeInsets.only(bottom: 10.0),
      //       child: Container(height: 0,width: 0,
      //         color: Colors.red,
      //       ),
      //     );},
      // ),
      //====== ************=========//
      body: Consumer<DirPath>(
          builder: (context, snapshots,child) {
          if (isFetch==false ||snapshots.Refreshornot==true) {
            snapshots.LoadAllCache(context);
            Future.delayed(const Duration(microseconds: 0),(){
              isFetch=true;
              snapshots.Refreshed();
            }
            );
          }
          List<String> myFileSystemEntities =snapshots.images;
          Future<List<String>>? myFutureFileSystemEntities = Future.value(myFileSystemEntities);
          return FutureBuilder(
           future: myFutureFileSystemEntities,
           builder: (context, snapshot) {
             if(!snapshot.hasData){
               return  Center(
                   child:CircularProgressIndicator(
                     strokeWidth: 4.w,
                     backgroundColor: Constant.homeBackgroundColor,
                     color: Constant.buttonColor,
                   )
               );
             }
             if (snapshot.connectionState==ConnectionState.waiting) {
               return  Center(
                   child:CircularProgressIndicator(
                     strokeWidth: 4.w,
                     backgroundColor: Constant.homeBackgroundColor,
                     color: Constant.buttonColor,
                   )
               );
             }
             if (snapshot.connectionState==ConnectionState.done) {
               if ((snapshot.hasData && snapshot.data!.isNotEmpty )) {
                 return
                   Padding(
                   padding:EdgeInsets.only(left: 8.0.w,right:8.0.w ,top:8.0.h ,bottom:8.0.h ),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Expanded(
                         child: RefreshIndicator(
                           onRefresh: ()async{
                             snapshots.LoadAllCache(context);
                            // await snapshots.images;
                           },
                           child: GridView.builder(
                               itemCount: snapshot.data!.length,
                               gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                                 crossAxisCount: 2,
                                 crossAxisSpacing: 6.h,
                                 mainAxisSpacing: 6.w,
                               ),
                               itemBuilder: (context, index)
                               {
                                 final data=snapshot.data![index];
                                 bool isDownloaded = downloadedImages.contains(data);
                                 return Stack(
                                   alignment: AlignmentDirectional.bottomEnd,
                                   children: [
                                     GestureDetector(
                                       onTap: (){
                                         Navigator.push(
                                             context, MaterialPageRoute(builder: (_)=>DetailPicScreen(
                                           imagePath:data,
                                           image: data,
                                           //  file: data.path,
                                         )
                                         )
                                         );
                                       },
                                       child: Container(
                                         decoration: BoxDecoration(
                                           image: DecorationImage(fit: BoxFit.cover,
                                               image: FileImage(File(data))
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
                                           borderRadius: BorderRadius.only(
                                               bottomLeft:Radius.circular(15.r),bottomRight:Radius.circular(15.r))
                                       ),
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           IconButton(onPressed: (){
                                             Constant.shareImages(data);
                                             //  FlutterNativeApi.shareImage(data.path);
                                           }, icon: Icon(Icons.share_sharp,
                                             color: Colors.white,
                                           ),
                                           ),
                                           IconButton(
                                             onPressed: isDownloaded
                                                 ?  (){
                                               ScaffoldMessenger.of(context).showSnackBar(
                                                 const SnackBar(
                                                   content: Text('Already Saved'),
                                                   duration: Duration(seconds: 2),
                                                 ),
                                               );
                                             }:
                                                 () async {
                                               SharedPreferences prefs = await SharedPreferences.getInstance();
                                             String imagePath = data;
                                             List<String> downloadedImages = prefs.getStringList('downloaded_images') ?? [];


                                 if (downloadedImages.contains(imagePath)) {

                                 ScaffoldMessenger.of(context).showSnackBar(
                                 const SnackBar(
                                 content: Text('Image Already Saved'),
                                 duration: Duration(seconds: 2),
                                 ),
                                 );
                                 }
                                 else
                                 {
                                   per().saveImage(imagePath, context).then((value) {

                                     downloadedImages.add(imagePath);
                                 prefs.setStringList('downloaded_images', downloadedImages);
                                 ScaffoldMessenger.of(context).showSnackBar(
                                 const SnackBar(
                                 content: Text('Save Successfully'),
                                 duration: Duration(seconds: 2),
                                 ),
                                 );
                                 });
                                 }
                                 },
                                             icon:
                                             Icon(
                                               isDownloaded? Icons.done
                                             :  Icons.download,

                                               color: Colors.white,

                                           ),),
                                         ],
                                       ),
                                     )
                                   ],
                                 );
                               }),
                         ),

                       ),

                     ],
                   ),
                 );
               }
               else{
                 return NoVideosFound(txt:'Images ',snap:snapshots ,getImages:true ,getVideos: false,);


               }
             }  
return Container();
           },

         );

        }
      ),
    );
  }


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
