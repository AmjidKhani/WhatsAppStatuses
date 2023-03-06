import 'dart:developer';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:saf/saf.dart';
import 'package:statussaver/trash/permissionhelper.dart';
import 'package:statussaver/trash/permissionscreen.dart';
import 'package:statussaver/provider/adsProvider/adsprovider.dart';
import 'package:statussaver/provider/new%20pevider/getdirectorypath.dart';
import 'package:statussaver/provider/new%20pevider/permissionProvider.dart';
import 'package:statussaver/provider/savedvideoprovider/savevideoprovider.dart';
import 'package:statussaver/trash/addtesting.dart';

import 'Screens/Picscreen/PicturesScreen.dart';
import 'Screens/Home.dart';
import 'Screens/splashscreen/splashScreen.dart';
import 'constant/SharedePrefrences/SharedPrefrences.dart';
import 'constant/constant.dart';
import 'constant/dialogs/howtouse.dart';
//late final  check;
bool permis=false;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  var testdevices=['E30DAFF4836D658AA3C95A797588D4D3',
    '0380A50E657541B02610456DEBB5855E'];
  RequestConfiguration requestConfiguration=RequestConfiguration(
      testDeviceIds: testdevices
  );
  MobileAds.instance.updateRequestConfiguration(requestConfiguration);
  await SharedPrefrences.init();
  runApp( MyApp());
}
class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  late Saf saf;
  String whatsapp_path='Android/media/com.whatsapp/WhatsApp/Media/.Statuses';
  PermissionStatus permissionStatus = PermissionStatus.denied;
  @override
  void initState() {
    permis =SharedPrefrences.fetchWhatsAppPermission()??false;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      //  ChangeNotifierProvider(create: (context) => BottomNavProvider()),
        ChangeNotifierProvider(create: (context) => DirPath()),
        ChangeNotifierProvider(create: (context) => SavedVideoProvider()),
        ChangeNotifierProvider(create: (context) => PermissionProvider())
       , ChangeNotifierProvider(create: (context) => AdsProvider())

      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 752),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
                home:


               permis? AppBarr():SplashScreen(),
                //PermissionScreen()
               //AppBarr(),
            );
          }
      ),
    );
  }
}

