import 'package:get/get.dart';

class CountControllerWithGetX extends GetxController {
  static CountControllerWithGetX get to => Get.find();
  int count = 0;
  RxInt count2 = 0.obs;

  void increase(String id) {
    count++;
    update([id]);
  }

  void putNumber(int value) {
    count = value;
    update();
  }

  void increase2() {
    count2++;
  }

  void putNumber2(int value) {
    count2(value);
  }
}
