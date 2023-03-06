import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constant/SharedePrefrences/SharedPrefrences.dart';
import '../constant/constant.dart';
import '../constant/dialogs/dialog.dart';
import '../constant/dialogs/howtouse.dart';

import '../provider/new pevider/getdirectorypath.dart';
 bool? permissionchecker=false;
class drawer extends StatefulWidget {

  @override
  _drawerState createState() => _drawerState();
}
class _drawerState extends State<drawer>{
  @override
  void initState() {
    permissionchecker=SharedPrefrences.fetchData();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Drawer(
           child: ListView(
               children: [
                 DrawerHeader(
                     padding: EdgeInsets.zero,
                     decoration: BoxDecoration(
                         color: Constant.splashBackgroundColor
                     ),
                     child: Column(
                       children: [
                         Image.asset('images/logo.png',
                           width: 115,
                           height: 100,),
                         Text('Status Save',style: TextStyle(
                             fontSize: 20,
                             fontWeight: FontWeight.bold,
                             color: Colors.white
                         ),)
                       ],
                     )
                 ),
                 SizedBox(height: 20,),
                 transparenttitle('Selection WhatsApp'),
                 SizedBox(height: 15,),
                 whatsappbutton("WhatsApp",Icons.whatsapp,),
                 SizedBox(height: 10,),
                 Consumer<DirPath>(
                   builder: (context, value, child) {
                     return    GestureDetector(
                         onTap: ()async{
                           if(permissionchecker==false){
                             HowToUseApp().PermissionDialog(context);
                           //  Navigator.pop(context);
                           }
                             value.ChangeColorMethode(context);
                             value.Refreshed();

                             },
                         child: whatsappBusinessButton('WhatsApp Business',Icons.whatsapp,value.changeColor,value.Refreshornot));
                   },
                 ),
                 SizedBox(height: 10,),
                 transparenttitle('General'),
                 drawerlistitems(name: 'Share App', icon: Icons.share_sharp, onTap: () {
                   Constant.shareAppLink();
                 }, ),
                 drawerlistitems(name: 'How To Use', icon: Icons.info, onTap: () {
                   HowToUseApp().dialog(context);
                 }, ),
                 drawerlistitems(name: ' Check Updates', icon: Icons.system_security_update, onTap: () {
                  Constant.openapniapp();
                 }, ),
                 drawerlistitems(name: 'Rate Us', icon: Icons.star, onTap: () {
                   Dialogs.showRating(context);
                 }, ),
               ]
           ),
     );
  }
  Padding whatsappbutton(String name,IconData icon,) {
    return

    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          color: Constant.buttonColor,
          borderRadius: BorderRadius.circular(25),

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 30,),
            Icon(icon,
              color: Colors.white,
              size: 35,),
            SizedBox(width: 15,),
            Text(name,style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15
            ),)
          ],
        ),
      ),
    );


  }
  Padding whatsappBusinessButton(String name,IconData icon,bool changeColor, bool refresh) {
    return
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            color:changeColor? Constant.buttonColor:Colors.white,
            borderRadius: BorderRadius.circular(25),

          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 30,),
              Icon(icon,
                color:changeColor? Colors.white:Colors.black,
                size: 35,),
              SizedBox(width: 15,),
              Text(name,style: TextStyle(
                  color: changeColor? Colors.white:Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15
              ),)
            ],
          ),
        ),
      );


  }


  Container transparenttitle(String title) {
    return Container(height: 17,
            width: double.maxFinite,
            color: Constant.drawerTransparent,
              child: Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15
              ),),
            );
  }
}

class drawerlistitems extends StatelessWidget {
  String name;
  IconData icon;
  final VoidCallback onTap ;
   drawerlistitems({
    Key? key,required this.name,
    required this.icon, required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context ) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: Colors.black,),
      title: Text(name,
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.black),),
    );
  }
}