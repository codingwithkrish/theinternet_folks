import 'package:get/get.dart';
import 'package:theinternet_folks/pages/HomePage.dart';

abstract class AppPages {
  static var transitionDuration = const Duration(
    milliseconds: 300,
  );
  static final pages = <GetPage>[
    GetPage(
        name: "/home",
        page: () => HomePage(),
        transitionDuration: transitionDuration,
        transition: Transition.native)
  ];
}
