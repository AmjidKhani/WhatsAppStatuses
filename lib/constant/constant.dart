import 'dart:io';
import 'package:device_apps/device_apps.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';


class Constant{
  //whatsapp Business status Path
  static String whatsapp_Business_path='/storage/emulated/0/Android/media/com.whatsapp.w4b/WhatsApp Business/Media/.Statuses';
  //Whatsapp status Path
  static String whatsapp_path='/storage/emulated/0/Android/media/com.whatsapp/WhatsApp/Media/.Statuses';

  // App Specific Folder Path
  static String whatsapp_Status_Saved_Path='/storage/emulated/0/Status Saver';




  static  Color homeBackgroundColor = const Color(0xFFE5F8F2);
static  Color splashBackgroundColor = const Color(0xFF004D4B);
static  Color appbarColor = const Color(0xFF075E55);
static  Color buttonColor = const Color(0xFF075E55);
static  Color transparentColor = const Color(0xff6b111010);
static  Color drawerTransparent = const Color(0xFFD9D9D9);
static  Color howtoUse = const Color(0xFF5C5B61);
static TextStyle loading=TextStyle(
  fontSize: 16.sp,
  fontWeight: FontWeight.bold,
  color: Colors.white

);

static shareAppLink(){
  String appurl='com.example.whatsappstatussaver';
  Share.share(appurl);
}
static openapniapp()async{
  await LaunchApp.openApp(
      androidPackageName: 'com.facebook.katana',

      openStore: false
  );
}
  static openApp()async{
    try {
      ///checks if the app is installed on your mobile device
      bool isInstalled = await DeviceApps.isAppInstalled('com.whatsapp');
      if (isInstalled) {
        DeviceApps.openApp("com.whatsapp");
      } else {
        print('no found');
        await LaunchApp.openApp(
            androidPackageName: 'com.whatsapp',
            openStore: false
        );

      }
    } catch (e) {
      print(e);
    }
  }
  static shareImages(var pathig)async{
  Share.shareFiles([pathig]);
  }
  static TextStyle alertMessage=TextStyle(
      fontSize: 19.sp,
      fontWeight: FontWeight.bold,
      color: buttonColor

  );
  static TextStyle alertMessageSmall=TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: buttonColor

  );


}

class Button extends StatefulWidget {
  const Button({Key? key}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(


    );
  }
}
