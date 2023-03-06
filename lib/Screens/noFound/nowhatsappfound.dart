import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/constant.dart';

class NoWhatsappFound extends StatefulWidget {

  var providersnap;
  bool getVideo;
  bool getimages;
   NoWhatsappFound({Key? key,
required this.providersnap,
     required this.getVideo,
     required this.getimages
   }) : super(key: key);

  @override
  State<NoWhatsappFound> createState() => _NoWhatsappFoundState();
}

class _NoWhatsappFoundState extends State<NoWhatsappFound> {
  @override
  Widget build(BuildContext context) {
    return
      RefreshIndicator(
        onRefresh: () async{
          if (widget.getVideo==true) {
              await widget.providersnap.getPath('.mp4');
          }
          if (widget.getimages==true) {
            await widget.providersnap.getPath('.jpg');
          }


        },
        child: Align(
          alignment: Alignment.center,
          child: ListView(
shrinkWrap: true,
              children: [
                Center(child: Icon(Icons.info_outline,
                    size: 40.sp,
                    color: Constant.buttonColor
                )),
                SizedBox(height: 20.h,),
                Center(child: Text('No WhatsApp Or Permission Found.',style: Constant.alertMessage,)),
                SizedBox(height: 20.h,),
                Center(child: Text('1. Please Check Permissions Allowed Or Not.',style: Constant.alertMessageSmall,)),
                SizedBox(height: 20.h,),
                Center(child: Text('2. Please Check Whatsapp Install Or Not.',style: Constant.alertMessageSmall,)),

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
                            'Check Install or not ',
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
      );
    
  }
}
