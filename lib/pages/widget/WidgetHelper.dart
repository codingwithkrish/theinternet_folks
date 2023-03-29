import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/color.dart';
import '../../utils/textstyle.dart';

Widget appbartittle(String text, Color color) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: 24.sp),
  );
}

Widget ImageCont(String path) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 5.h),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15.w.h),
      child: Image.network(
        path,
        fit: BoxFit.cover,
        width: 85.w,
        height: 100.h,
      ),
    ),
  );
}

Widget getaddres(String address) {
  return Row(
    children: [
      Icon(
        Icons.location_on,
        color: textcolor3,
        size: 17.sp,
      ),
      Expanded(
        child: Text(
          address,
          style: textStyle1,
        ),
      )
    ],
  );
}

Widget eventslap(
    String text1, String text2, String path, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(left: 22.w, right: 22.w, top: 24.h),
    child: Row(
      children: [
        Container(
          width: 54.w,
          height: 51.h,
          decoration: BoxDecoration(
            color: textcolor2.withOpacity(0.1),
            //   backgroundBlendMode: ,
            image: DecorationImage(image: AssetImage(path)),
            borderRadius: BorderRadius.circular(12.h.w),
          ),
        ),
        SizedBox(
          width: 14.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: textcolor1),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(text2,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: textcolor3))
            ],
          ),
        )
      ],
    ),
  );
}
