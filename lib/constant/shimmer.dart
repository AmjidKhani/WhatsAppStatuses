import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class shimmeraffect extends StatelessWidget {
  const shimmeraffect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700.h,
      width: 700.w,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {

            return
              Shimmer.fromColors(
                  child: ListTile(
                    title: Container(
                      height:10.h ,width:89.w ,
                      color: Colors.white,
                    ),
                    subtitle:
                    Container(
                      height:10.h ,width:89.w ,
                      color: Colors.white,
                    ),
                    leading: Container(
                      height:50.h ,width:50.w,
                      color: Colors.white,
                    ),
                  ),
                  baseColor: Colors.grey.shade700,
                  highlightColor: Colors.grey.shade100);
          }),
    );}
}

