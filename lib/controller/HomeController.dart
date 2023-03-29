import 'dart:convert';
import 'dart:developer';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:theinternet_folks/models/eventModel.dart';
import 'package:http/http.dart' as http;
import '../network/request.dart';

class HomeController extends GetxController {
  HomeController() {
    getdata();
  }
  List<EventModel> eventslist = [];
  bool isloading = false;

  void getdata() async {
    isloading = true;
    update();
    try {
      var response = await Request().getdata();
      var data = jsonDecode(response.toString())["content"];
      List list = data["data"];
      print(list.length);
      for (var i = 0; i < list.length; i++) {
        eventslist.add(EventModel.fromjson(list[i]));
        update();
      }
      print(eventslist.first.dateTime);
    } catch (e) {
      log(e.toString());
    }
    isloading = false;
    update();
  }

  String getdate(String datee) {
    DateTime date = DateTime.parse(datee);
    String day = DateFormat('EEE').format(date);
    String month = DateFormat('MMM').format(date);
    String maindate = DateFormat('dd').format(date);
    String time = DateFormat.jm().format(date);
    return "${day}, $month $maindate • $time";
  }

  String getmonth(String datee) {
    DateTime date = DateTime.parse(datee);
    String dateFormat = DateFormat('MMM').format(date);
    print(dateFormat);
    return dateFormat;
  }
}
