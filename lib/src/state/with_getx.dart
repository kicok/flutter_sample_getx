import 'package:flutter/material.dart';
import 'package:flutter_sample_route_getx/src/controller/count_controller_with_getx.dart';
import 'package:flutter_sample_route_getx/src/utils/util.dart';
import 'package:get/get.dart';

class WithGetX extends StatelessWidget {
  const WithGetX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          TextButton(
            style: Utils.textButtonStryle,
            onPressed: () {
              Get.find<CountControllerWithGetX>().increase();
            },
            child: const Text(
              "+",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
