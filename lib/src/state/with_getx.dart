import 'package:flutter/material.dart';
import 'package:flutter_sample_route_getx/src/controller/count_controller_with_getx.dart';
import 'package:flutter_sample_route_getx/src/utils/util.dart';
import 'package:get/get.dart';

class WithGetX extends StatelessWidget {
  WithGetX({Key? key}) : super(key: key);
  final CountControllerWithGetX _controllerWithGetX =
      Get.put(CountControllerWithGetX());

  Widget _button(String id) {
    return TextButton(
      style: Utils.textButtonStryle,
      onPressed: () {
        //Get.find<CountControllerWithGetX>().increase();

        _controllerWithGetX.increase(id);
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
          GetBuilder<CountControllerWithGetX>(
              id: "first",
              builder: (controller) {
                return Text(
                  "${controller.count}",
                  style: const TextStyle(fontSize: 30),
                );
              }),
          GetBuilder<CountControllerWithGetX>(
              id: "second",
              builder: (controller) {
                return Text(
                  "${controller.count}",
                  style: const TextStyle(fontSize: 30),
                );
              }),
          _button("first"),
          _button("second"),
          GetBuilder<CountControllerWithGetX>(builder: (controller) {
            print("update!!!"); // 값이 똑같이 5이지만 매번 실행되므로 리소르를 많이 사용한다.
            return Text(
              "${controller.count}",
              style: const TextStyle(fontSize: 30),
            );
          }),
          TextButton(
            style: Utils.textButtonStryle,
            onPressed: () {
              _controllerWithGetX.putNumber(5);
            },
            child: const Text("5로 변경", style: TextStyle(fontSize: 30)),
          ),
        ],
      ),
    );
  }
}
