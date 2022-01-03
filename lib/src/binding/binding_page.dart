import 'package:flutter_sample_route_getx/src/controller/count_controller_with_getx.dart';
import 'package:get/instance_manager.dart';

class BindingPage implements Bindings {
  @override
  void dependencies() {
    Get.put(CountControllerWithGetX(), permanent: true);
  }
}
