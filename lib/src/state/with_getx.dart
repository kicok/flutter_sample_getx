import 'package:flutter/material.dart';
import 'package:flutter_sample_route_getx/src/controller/count_controller_with_getx.dart';
import 'package:flutter_sample_route_getx/src/utils/util.dart';
import 'package:get/get.dart';

class WithGetX extends StatelessWidget {
  WithGetX({Key? key}) : super(key: key);
  final CountControllerWithGetX _controllerWithGetX =
      Get.put(CountControllerWithGetX());

  Widget _button() {
    return TextButton(
      style: Utils.textButtonStryle,
      onPressed: () {
        //Get.find<CountControllerWithGetX>().increase();

        _controllerWithGetX.increase();
        //_controllerWithGetX을 멤버 변수로 인스턴스화 하면 Get.find()를 사용해서 인스턴스를 찾지 않아도 된다.
      },
      child: const Text(
        "+",
        style: TextStyle(fontSize: 30),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //ChangeNotifierProvider 처럼 Getx State 를 인스턴스화 한다.

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("GetX", style: TextStyle(fontSize: 50)),
          GetBuilder<CountControllerWithGetX>(builder: (controller) {
            return Text(
              "${controller.count}",
              style: const TextStyle(fontSize: 50),
            );
          }),
          _button(),
        ],
      ),
    );
  }
}
