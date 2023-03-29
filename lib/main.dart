import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:theinternet_folks/utils/routes.dart';
import 'package:theinternet_folks/utils/theames.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ScreenUtilInit(builder: (context, child) {
      return GetMaterialApp(
        title: 'The Internet Folks',
        debugShowCheckedModeBanner: false,
        theme: AppTheame.lighttheme,
        initialRoute: "/home",
        getPages: AppPages.pages,
      );
    });
  }
}
