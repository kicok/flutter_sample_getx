import 'package:flutter/material.dart';
import 'package:flutter_sample_route_getx/src/controller/count_controller_with_getx.dart';
import 'package:flutter_sample_route_getx/src/utils/util.dart';
import 'package:get/get.dart';

class BindingSamplePage extends GetView<CountControllerWithGetX> {
  const BindingSamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          GetBuilder<CountControllerWithGetX>(
              id: "first",
              builder: (controller) {
                return Text(
                  controller.count.toString(),
                  style: const TextStyle(fontSize: 40),
                );
              }),
          TextButton(
            style: Utils.textButtonStryle,
            onPressed: () {
              Get.find<CountControllerWithGetX>().increase('first');
            },
            child: const Text(
                "Get.find<CountControllerWithGetX>().increase('first')"),
          ),
          const Text("⬇︎ 변경"),
          TextButton(
            style: Utils.textButtonStryle,
            onPressed: () {
              CountControllerWithGetX.to.increase('first');
            },
            child: const Text("CountControllerWithGetX.to.increase('first')"),
          ),
          const Divider(),
          const Text(
            'extend GetView<CountControllerWithGetX> 를\n통하여 Rx 정보 가져오기',
            style: TextStyle(color: Colors.blue),
          ),
          TextButton(
            style: Utils.textButtonStryle,
            onPressed: () {
              // controller는 위의 extend GetView<CountControllerWithGetX> 에서 가져온다.
              controller.increase('first');
            },
            child: const Text("controller.increase('first')"),
          ),
          Obx(
            () => Text(
              controller.count2.toString(),
              style: const TextStyle(fontSize: 40),
            ), // 변경된 데이터는 Rx형태만 가져올수 있음.
          ),
          TextButton(
            style: Utils.textButtonStryle,
            onPressed: () {
              controller.increase2();
            },
            child: const Text("controller.increase2()"),
          ),
        ],
      ),
    );
  }
}
