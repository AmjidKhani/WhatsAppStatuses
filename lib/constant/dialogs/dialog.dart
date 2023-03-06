import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rating_dialog/rating_dialog.dart';

class Dialogs{
 static void showRating(BuildContext context){
    showDialog(context: context, builder: (context) {
      return RatingDialog(
        starSize: 35.sp,
        initialRating: 1,
          message: Text('Tap on Star',
            textAlign: TextAlign.center,
          ),
          image:Container(
height: 100.h,
            decoration: BoxDecoration(
            image: DecorationImage(
              image:AssetImage('images/smalllogo.png',
              ),
              fit: BoxFit.fitHeight,

            ),
            ),
          ),
          title: Text('Rating Dialog',
          textAlign: TextAlign.center,
          ),
          submitButtonText: 'Submit',
          onSubmitted: (rating){
print('Rating = ${rating.rating}');
          });
    });
  }
}