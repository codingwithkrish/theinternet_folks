import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:readmore/readmore.dart';
import 'package:theinternet_folks/pages/widget/WidgetHelper.dart';
import 'package:theinternet_folks/utils/color.dart';

import '../controller/EventsDetailsController.dart';
import '../models/eventModel.dart';
import '../utils/textstyle.dart';

class EventDetails extends StatefulWidget {
  EventModel eventModel;
  EventDetails({super.key, required this.eventModel});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventsDetailsController>(
        init: EventsDetailsController(),
        builder: (controller) {
          return Scaffold(
            floatingActionButton: Container(
              height: 58.h,
              width: 271.w,
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(bottom: 23.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  color: textcolor2),
              child: ListTile(
                title: Center(
                    child: Text(
                  "BOOK NOW",
                  style: textstyle5,
                )),
                trailing: Transform.translate(
                    offset: Offset(0, -5.h),
                    child: Container(
                      padding: EdgeInsets.all(8.w.h),
                      decoration: BoxDecoration(
                          color: color1,
                          borderRadius: BorderRadius.circular(20.w.h)),
                      child: Icon(
                        Icons.arrow_forward,
                        color: whitecolor,
                      ),
                    )),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      expandedHeight: 244.h,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 30.h, left: 15.w),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Icon(
                                    Icons.keyboard_backspace,
                                    color: whitecolor,
                                  ),
                                ),
                                SizedBox(
                                  width: 24.w,
                                ),
                                appbartittle("Events Details", whitecolor),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 70.h),
                                    padding: EdgeInsets.all(12.w.h),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.h.w),
                                        color: whitecolor.withOpacity(0.3)),
                                    child: Image.asset(
                                      "assets/images/save.png",
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    widget.eventModel.bannnerimage,
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      floating: true,
                      snap: true,
                      pinned: true,
                    )
                  ];
                },
                body: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Text(
                        widget.eventModel.tittle,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 22.w,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 54.w,
                            height: 51.h,
                            decoration: BoxDecoration(
                              color: textcolor2.withOpacity(0.1),
                              //   backgroundBlendMode: ,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      widget.eventModel.organiserIcon)),
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
                                  widget.eventModel.organisername,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: textcolor1),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text("Organizer",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: textcolor3))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    eventslap(
                        controller.getdate(widget.eventModel.dateTime),
                        controller.getvenue(widget.eventModel.dateTime),
                        "assets/images/v2.png",
                        context),
                    eventslap(
                        widget.eventModel.venuename,
                        "${widget.eventModel.venuecity}, ${widget.eventModel.venuecountry}",
                        "assets/images/v3.png",
                        context),
                    SizedBox(
                      height: 30.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, bottom: 26.h),
                      child: Text(
                        "About Event",
                        style: textStyle2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: ReadMoreText(
                        widget.eventModel.description,
                        trimLines: 4,
                        style: textstyle4,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Read More...',
                        trimExpandedText: 'Read Less',
                        moreStyle: textstyle3,
                        lessStyle: textstyle3,
                      ),
                    )
                  ],
                )),
          );
        });
  }
}
