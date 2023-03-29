import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:theinternet_folks/controller/HomeController.dart';
import 'package:theinternet_folks/pages/EventDetails.dart';
import 'package:theinternet_folks/pages/SearchEvents.dart';
import 'package:theinternet_folks/pages/widget/WidgetHelper.dart';
import 'package:theinternet_folks/utils/color.dart';
import 'package:theinternet_folks/utils/theames.dart';

import '../utils/textstyle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: appbartittle("Events", textcolor1),
              actions: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => SearchEvent(
                          eventslist: controller.eventslist,
                        ));
                  },
                  child: Icon(
                    Icons.search,
                    size: 25.h.w,
                    color: textcolor1,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Icon(
                  Icons.more_vert,
                  size: 25.h.w,
                  color: textcolor1,
                )
              ],
            ),
            body: SafeArea(
                child: controller.isloading
                    ? Center(
                        child: CircularProgressIndicator(
                        color: textcolor1,
                      ))
                    : ListView.builder(
                        itemCount: controller.eventslist.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => EventDetails(
                                    eventModel: controller.eventslist[index],
                                  ));
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 24.w, vertical: 10.h),
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              decoration: BoxDecoration(
                                  color: whitecolor,
                                  boxShadow: [],
                                  borderRadius: BorderRadius.circular(16.w.h)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ImageCont(controller
                                      .eventslist[index].bannnerimage),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Flexible(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${controller.getdate(controller.eventslist[index].dateTime)}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Container(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            overflow: TextOverflow.ellipsis,
                                            controller.eventslist[index].tittle,
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        getaddres(
                                            "${controller.eventslist[index].venuename} • ${controller.eventslist[index].venuecity},${controller.eventslist[index].venuecountry}")
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        })),
          );
        });
  }
}
