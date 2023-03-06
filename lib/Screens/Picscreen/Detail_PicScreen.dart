import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant/constant.dart';
import '../../provider/new pevider/getdirectorypath.dart';
import '../../slider.dart';

class DetailPicScreen extends StatefulWidget {
  String? imagePath;
 String image;

   DetailPicScreen({Key? key,required this.imagePath,required this.image
 //    required this.file
   }) : super(key: key);

  @override
  State<DetailPicScreen> createState() => _DetailPicScreenState();
}
class _DetailPicScreenState extends State<DetailPicScreen> {
  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        downloadedImages = prefs.getStringList('downloaded_images')?.toSet() ?? { };
      });
    });

    // TODO: implement initState
    super.initState();
  }
  Set<String> downloadedImages = {};

  @override
  Widget build(BuildContext context) {
   final ListenToFalse= Provider.of<DirPath>(context,listen: false);
    print(widget.imagePath);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Image',
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: Column(

        children: [
      //final data=snapshot.data![index];

     // bool isDownloaded = downloadedImages.contains(widget.imagePath!);
          Padding(
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
          bottombuttons(widget.imagePath!,widget.image,downloadedImages ,context, )
        ],
      ),
    );
  }
}





  Container bottombuttons(String imagePath,String image ,var downloadedImages,BuildContext context) {
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
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<DirPath>(
              builder: (context, snap, child) {
                bool isDownloaded = downloadedImages.contains(imagePath);
                return IconButton(
                    onPressed: isDownloaded? (){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Already Saved'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }:

                        () async {

                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      String imagePathData = imagePath;
                      List<String> downloadedImages = prefs.getStringList('downloaded_images') ?? [];
                      if (downloadedImages.contains(imagePath)) {

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Image already downloaded'),
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
                    icon: Icon(
                      isDownloaded?Icons.done
                          : Icons.download
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

