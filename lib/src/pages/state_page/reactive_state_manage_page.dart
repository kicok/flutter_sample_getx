import 'package:flutter/material.dart';
import 'package:flutter_sample_route_getx/src/controller/count_controller_with_reactive_getx.dart';
import 'package:flutter_sample_route_getx/src/utils/util.dart';
import 'package:get/get.dart';

class ReactiveStateManagePage extends StatelessWidget {
  const ReactiveStateManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Getx state를 인스턴스화 한다. (일반 단순상태관리와 같음)
    Get.put(CountControllerWithReactive());
    return Scaffold(
      appBar: AppBar(
        title: const Text('반응형(Reactive) 상태관리'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("GetX", style: TextStyle(fontSize: 50)),

            // 아래코드를 사용하려면 Controller에서 GetxController를 extends 해야한다.
            // GetX<CountControllerWithReactive>(builder: (_) {
            //   return Text(
            //       "${Get.find<CountControllerWithReactive>().count.value}",
            //       style: const TextStyle(fontSize: 50));
            // }),
            Obx(() {
              print("update!!!!");
              return Text(
                  "${Get.find<CountControllerWithReactive>().count.value}",
                  style: const TextStyle(fontSize: 50));
            }),
            TextButton(
              style: Utils.textButtonStryle,
              onPressed: () {
                Get.find<CountControllerWithReactive>().increase();
              },
              child: const Text("+", style: TextStyle(fontSize: 30)),
            ),
            TextButton(
              style: Utils.textButtonStryle,
              onPressed: () {
                Get.find<CountControllerWithReactive>().putNumber(5);
              },
              child: const Text("5로 변경", style: TextStyle(fontSize: 30)),
            ),
          ],
        ),
      ),
    );
  }
}
