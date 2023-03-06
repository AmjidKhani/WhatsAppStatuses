import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:statussaver/constant/constant.dart';

import '../../trash/permissionhelper.dart';
import '../../provider/new pevider/permissionProvider.dart';

class HowToUseApp{

  void dialog(BuildContext context){
    showDialog(context: context, builder: (context) {
      return  Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
          Container(
            decoration: BoxDecoration(
                color: Constant.howtoUse,
              borderRadius: BorderRadius.circular(12)
            ),
            height: 266.h,
          width: 350.w,
            child: Column(
            children: [
              SizedBox(height: 20.h,),
              Text('How To Use ?',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                fontSize: 20.sp,
                ),
              ),
              SizedBox(height: 20.h,),
              Text('1. Open WhatsApp Status',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(height: 20.h,),
              Text('2. View Status From Whatsapp',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(height: 20.h,),
              Text('3. Open This App To Download',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(height: 20.h,),
              Text('4. Pull To Refresh ',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(height: 20.h,),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('Ok!',
              textAlign: TextAlign.end,
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.green,
                fontSize: 22.sp,
              ),
            ))
            ],
          ),
      )
          ],
      ),
        );


    });
  }
  PermissionDialog(BuildContext context)async {
    showDialog(context: context, builder: (context) {
      return  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,

              ),
              height: 220.h,
              width: 350.w,
              child: Column(
                children: [
                  SizedBox(height: 20.h,),
                  Text('Enable Storage',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Text('Dear User, You need to Allow the storage ',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Text(' Permission in order to save Statuses',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 30.h,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal:65.0.w),
                    child: Consumer<PermissionProvider>(
                      builder: (context, value, child) {
                        return ElevatedButton(
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
                                  'Allow Permission',
                                  style: TextStyle(fontSize: 15.0.sp),
                                ),
                              ],
                            ),
                          ),
                          onPressed: () async{
value.checkPermission();
value.getw4bPermissions(context);
Navigator.pop(context);

                          },
                          style: ElevatedButton.styleFrom(
                              primary: Constant.buttonColor,
                              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                              textStyle: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.bold)
                          ),
                        );
                      },

                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
    );
  }
  PermissionFirstDialog(BuildContext context)async {
    showDialog(context: context, builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,

              ),
              height: 244.h,
              width: 350.w,
              child: Column(
                children: [
                  SizedBox(height: 20.h,),
                  Text('Enable Storage',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Text('Dear User, You need to Allow the storage ',
                    style: TextStyle(
                      decoration: TextDecoration.none,

                      color: Colors.black,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Text(' Permission in order to save Statuses',textAlign:TextAlign.start ,
                    style: TextStyle(

                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 30.h,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal:65.0.w),
                    child: Consumer<PermissionProvider>(
                      builder: (context, value, child) {
                        return ElevatedButton(
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
                                  'Allow Permission',
                                  style: TextStyle(fontSize: 15.0.sp),
                                ),
                              ],
                            ),
                          ),
                          onPressed: () async{
                            value.checkPermission();
                            value.getw4bPermissions(context);
                            Navigator.pop(context);

                          },
                          style: ElevatedButton.styleFrom(
                              primary: Constant.buttonColor,
                              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                              textStyle: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.bold)
                          ),
                        );
                      },

                    ),
                  ),
                ],
              ),
            )
          ],
        ),
          );
    }
    );
  }
}
