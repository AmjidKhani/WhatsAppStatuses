import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:saf/saf.dart';
import 'package:statussaver/Screens/Home.dart';

import '../../Screens/drawer.dart';
import '../../Screens/splashscreen/splashScreen.dart';
import '../../constant/SharedePrefrences/SharedPrefrences.dart';

class PermissionProvider extends ChangeNotifier{
  PermissionStatus permissionStatus = PermissionStatus.denied;
  Saf safw4b=Saf('Android/media/com.whatsapp.w4b/WhatsApp Business/Media/.Statuses');
  Saf saf=Saf('Android/media/com.whatsapp/WhatsApp/Media/.Statuses');

  checkPermission() async {
    permissionStatus = await Permission.storage.status;
    notifyListeners();
  }
  getw4bPermissions(BuildContext context) async {
    if (permissionStatus.isDenied) {
      await Permission.storage.request();
      permissionStatus = await Permission.storage.status;
    }
    if (permissionStatus.isGranted) {
      permissionchecker= (await safw4b.getDirectoryPermission(isDynamic: true))!;
      SharedPrefrences.saveBool(permissionchecker!);
     notifyListeners();
    }
    notifyListeners();
  }


  getPermissions(BuildContext context) async {
    if (permissionStatus.isDenied) {
      await Permission.storage.request();
      permissionStatus = await Permission.storage.status;
      print(permissionStatus);
    }
    if (permissionStatus.isGranted) {
      MainStatusChecker= (await saf.getDirectoryPermission(isDynamic: true))!;
     // ==========*******===============//
      //change this After
      SharedPrefrences.saveWhatsappPermission(MainStatusChecker);
      if (MainStatusChecker==true) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AppBarr()));
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Permission Required'),
            duration: Duration(seconds: 2),
          ),
        );
      }
      // ==========******=============//

      notifyListeners();
    }
  }
}