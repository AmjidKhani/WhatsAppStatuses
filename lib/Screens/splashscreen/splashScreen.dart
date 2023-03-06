import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../constant/SharedePrefrences/SharedPrefrences.dart';
import '../../constant/constant.dart';
import '../../constant/dialogs/howtouse.dart';
import '../../provider/new pevider/getdirectorypath.dart';

import '../../provider/new pevider/permissionProvider.dart';
import '../Home.dart';
bool MainStatusChecker=false;
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
@override
  void initState() {
  // Future.delayed(Duration(seconds: 1)).then((value) {
  //   HowToUseApp().PermissionFirstDialog(context);
  // });

 // MainStatusChecker=SharedPrefrences.fetchWhatsAppPermission();
//Provider.of<PermissionProvider>(context, listen: false).checkPermission();
// if(MainStatusChecker==false) {
//   HowToUseApp().PermissionFirstDialog(context);
// }


    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if(MainStatusChecker==false) {
    //   HowToUseApp().PermissionFirstDialog(context);
    // }
    return Scaffold(
      backgroundColor: Constant.splashBackgroundColor,
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: 50.0.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          SizedBox(height: 35.h,),
Column(
  children: [
    Container(
        height: 110.h,
        width: 110.w,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/logo.png')
            )
        ),
    ),
    Text('Status Saver',style: TextStyle(color: Colors.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold
    ),),
  ],
),
            Column(
              children: [
                Text('To Save Status, Allow Status Saver Access\n To your Device Storage',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                ),
                ),
                SizedBox(height: 15,),
                // Center(child: CircularProgressIndicator()),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Center(
                    child: Consumer<PermissionProvider>(
                      builder: (context, value, child) {
                        return ElevatedButton(
                          child: Text(
                            "Let's Go",
                            style: TextStyle(fontSize: 15.0.sp),
                          ),
                          onPressed: () {
value.checkPermission();
value.getPermissions(context);
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0.r))),
                              primary: Constant.buttonColor,
                              padding: EdgeInsets.symmetric(horizontal: 90.w, vertical: 20.h),
                              textStyle: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                        );
                      },

                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),


    );
  }
}
