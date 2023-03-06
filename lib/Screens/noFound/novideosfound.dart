import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/constant.dart';

class NoVideosFound extends StatefulWidget {
  String txt;
  var snap;
  bool getVideos;
  bool getImages;
   NoVideosFound({Key? key,
  required this.txt,
     required this.snap,
     required this.getVideos,
     required this.getImages
   }) : super(key: key);
   @override
  State<NoVideosFound> createState() => _NoVideosFoundState();
}

class _NoVideosFoundState extends State<NoVideosFound> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
          onRefresh: () async{
            await  Future.delayed(Duration(seconds: 1));
            if (widget.getImages==true) {

            await  widget.snap.LoadAllCache(context);
            }
            if (widget.getVideos==true) {
              await  widget.snap.LoadAllCache(context);
             // await widget.snap.getPath('.mp4');
            }
            },
          child: Center(
            child: Align(
              alignment: Alignment.center,
              child: ListView(
                  shrinkWrap: true,
                  children: [
                    Center(
                        child: Icon(Icons.info_outline,
                        size: 40.sp,
                        color: Constant.buttonColor
                    )
                    ),
                    SizedBox(height: 20.h,),
                    Center(child: Text('No ${widget.txt} Available Now.',style: Constant.alertMessage,)),
                    SizedBox(height: 20.h,),
                    Center(child: Text('Open Whatsapp Status',style: Constant.alertMessageSmall,)),
                    SizedBox(height: 10.h,),
                    Center(child: Text('View Status From WhatsApp',style: Constant.alertMessageSmall)),
                    SizedBox(height: 10.h,),
                    Center(child: Text('Open This App to Download',style: Constant.alertMessageSmall)),
                    SizedBox(height: 20.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:65.0.w),
                      child: ElevatedButton(
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.whatsapp,
                                size: 30.sp,
                              ),
                              SizedBox(width: 10.w,),
                              Text(
                                'Open Whatsapp',
                                style: TextStyle(fontSize: 15.0.sp),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          Constant.openApp();
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0.r))),
                            primary: Constant.buttonColor,
                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                            textStyle: TextStyle(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold)
                        ),
                      ),
                    ),
                  ]
              ),
            ),
          ),
        );


    }
  }

