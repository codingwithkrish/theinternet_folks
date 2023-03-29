import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

class EventsDetailsController extends GetxController {
  String getdate(String datee) {
    DateTime date = DateTime.parse(datee);
    String day = DateFormat('EEE').format(date);
    String month = DateFormat('MMMM').format(date);
    String maindate = DateFormat('dd').format(date);
    String year = DateFormat("yyyy").format(date);
    print(year);
    String time = DateFormat.jm().format(date);
    return "$maindate $month, $year";
  }

  String getvenue(String datee) {
    DateTime date = DateTime.parse(datee);
    String day = DateFormat('EEEE').format(date);
    String time = DateFormat.jm().format(date);
    return "$day, $time - 9:00PM";
  }
}
