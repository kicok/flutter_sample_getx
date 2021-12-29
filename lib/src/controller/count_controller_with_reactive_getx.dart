import 'package:get/get.dart';

class CountControllerWithReactive //extends GetxController
{
  // extends GetxController 를 하지 않아도 사용가능
  // 하지만 GetX<CountControllerWithReactive>(builder: (_) ... 사용하려면 extends GetxController 해야 한다.
  // 그렇지만 위와 같은 기능을 하는 Obx(()=> ...value)를 사용하는게 더 간단하므로 괜찮다.
  RxInt count = 0.obs;

  void increase() {
    count++;
  }
}
