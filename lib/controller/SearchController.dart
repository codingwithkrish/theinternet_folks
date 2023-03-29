import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

import '../models/eventModel.dart';

class SearchController extends GetxController {
  List<EventModel> eventslist = [];
  List<EventModel> eventslistbackup = [];
  TextEditingController textEditingController = TextEditingController();
  SearchController(List<EventModel> eventslistt) {
    eventslist = eventslistt;
    eventslistbackup = eventslistt;
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

  getdetails() {
    eventslist = eventslistbackup;
    update();
  }

  search(String query) {
    if (query.isEmpty) {
      eventslist.clear();
      update();
      getdetails();
    } else {
      final suggestion = eventslist.where((element) {
        final title = element.tittle.toLowerCase();
        final input = query.toLowerCase();
        return title.contains(input);
      }).toList();
      eventslist = suggestion;
      update();
    }
  }
}
