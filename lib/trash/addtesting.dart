import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import '../constant/Ads/check.dart';
import '../provider/adsProvider/adsprovider.dart';
class adschecker extends StatefulWidget {
  const adschecker({Key? key}) : super(key: key);
  @override
  State<adschecker> createState() => _adscheckerState();
}
class _adscheckerState extends State<adschecker> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              'Ads Check'
          ),
        ),
        body: Consumer<AdsProvider>(
          builder: (context, value, child) {
            return

              Column(
                  children: [

                    Container(
                        height: 120,
                        width: 120,
                        color: Colors.green,
                        child: ElevatedButton(onPressed: () {
                          value.initializedHomePageBanner();
                        }, child: Text('Submit'),
                        )
                    ),


                    SizedBox(height: 20,),

                    SizedBox(
                      height: 360,
                      width: double.maxFinite,
                      child: Column(
                        children: [
                          value.isHomePageBanner_Loaded ?
                          Container(
                              height: value.HomePageBanner.size.height
                                  .toDouble(),
                              width: value.HomePageBanner.size.width.toDouble(),
                              child: AdWidget(
                                  ad: value.HomePageBanner
                              )
                          ) :
                          Container(height: 0, width: 0,
                            color: Colors.red,)
                        ],
                      ),
                    )

                  ]);
          }

          )
    );


  }
}
