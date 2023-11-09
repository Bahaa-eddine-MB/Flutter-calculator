import 'package:get/get.dart';
import 'package:personal_project/homeController.dart';

class myBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(),permanent: true);
  //  Get.lazyPut(() => HomeController(),fenix: true);
  }
}