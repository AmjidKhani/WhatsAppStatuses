import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../constant/constant.dart';
import '../constant/dialogs/dialog.dart';
import '../constant/dialogs/howtouse.dart';
import '../provider/new pevider/getdirectorypath.dart';
import '../trash/refrehtest.dart';
import 'drawer.dart';
import 'savedscreen/savedScreen.dart';
import 'videoscreen/VideoScreen.dart';
import 'Picscreen/PicturesScreen.dart';
class AppBarr extends StatefulWidget {
  const AppBarr({Key? key}) : super(key: key);
  @override
  State<AppBarr> createState() => _AppBarrState();
}

TabController? controller;
class _AppBarrState extends State<AppBarr> with SingleTickerProviderStateMixin {
  DateTime? lastPop;
  Future<bool> _onWillPop() async{
    DateTime now = DateTime.now();
    if (lastPop==null || now.difference(lastPop!) > const Duration(seconds: 2)) {
      lastPop = now;
      print('tapped');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              elevation: 0,
              padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
              duration: const Duration(milliseconds: 500),
              behavior:SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r)
              ),
              margin:  EdgeInsets.only(
                  bottom: 50.h,
                  right: 110.w,
                  left: 110.w
              ),
              backgroundColor: const Color(0xff626161),
              content: const Text('press Again to Exit',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white
                ),
              )
          )
      );
      return  false;
    } else {
      return true;
    }
  }
  void initState() {

    // TODO: implement initState
    super.initState();
    controller = TabController(length: 3, vsync: this, initialIndex: 0);
  }
  @override
  Widget build(BuildContext context) {
    Provider.of<DirPath>(context);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff11887A),
          elevation: 2,
          title: Text(
            "Status Saver",
            style: TextStyle(
                fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  HowToUseApp().dialog(context);
                  },
                icon: Icon(Icons.help)
            ),
            IconButton(onPressed: ()async {
              Constant.openApp();
              },
                icon: Icon(Icons.whatsapp)),
            IconButton(onPressed: () {
              Constant.shareAppLink();
            }, icon: Icon(Icons.share)),
          ],
          bottom: TabBar(
            physics: const BouncingScrollPhysics(),
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            isScrollable: true,
            labelPadding: EdgeInsets.symmetric(horizontal:30.w,vertical: 10.h),
            controller: controller,
            tabs:  [
              Text("Images", style: TextStyle(color: Colors.white, fontSize: 18.sp)),
              Text("Videos", style: TextStyle(color: Colors.white, fontSize: 18.sp)),
                Text("Saved", style: TextStyle(color: Colors.white, fontSize: 18.sp)),
            ],
          ),
        ),
        drawer: drawer(),
        body: Container(
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBarView(
                physics: BouncingScrollPhysics(),
                controller: controller,
                children: [
                  PictureSCreen(),
                  VideoScreen(),

               SavedScreen(),
                ]
            ),
          ),
        ),

      ),
    );

  }


 }
