import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:theinternet_folks/controller/SearchController.dart';
import 'package:theinternet_folks/pages/widget/WidgetHelper.dart';

import '../models/eventModel.dart';
import '../utils/color.dart';
import 'EventDetails.dart';

class SearchEvent extends StatefulWidget {
  List<EventModel> eventslist;
  SearchEvent({super.key, required this.eventslist});

  @override
  State<SearchEvent> createState() => _SearchEventState();
}

class _SearchEventState extends State<SearchEvent> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
        init: SearchController(widget.eventslist),
        builder: (controller) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              title: appbartittle("Search", textcolor1),
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: textcolor1,
                  size: 25.w,
                ),
              ),
            ),
            body: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 28.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        size: 25.h.w,
                        color: textcolor2,
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Image.asset("assets/images/v4.png"),
                      SizedBox(
                        width: 13.w,
                      ),
                      Flexible(
                          child: TextFormField(
                        autofocus: true,
                        controller: controller.textEditingController,
                        onChanged: (value) {
                          if (value.isEmpty) {
                            controller.getdetails();
                          } else {
                            controller
                                .search(controller.textEditingController.text);
                          }
                        },
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: textcolor1),
                        decoration: InputDecoration(
                          hintText: "Type Event Name",
                          hintStyle: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.3)),
                        ),
                      ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ImageCont(
                                    controller.eventslist[index].bannnerimage),
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
                                            style: TextStyle(
                                                color: textcolor1,
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            )),
          );
        });
  }
}
