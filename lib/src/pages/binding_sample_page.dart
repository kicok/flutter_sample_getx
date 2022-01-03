import 'package:flutter/material.dart';
import 'package:flutter_sample_route_getx/src/controller/count_controller_with_getx.dart';
import 'package:flutter_sample_route_getx/src/utils/util.dart';
import 'package:get/get.dart';

class BindingSamplePage extends StatelessWidget {
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
                return Text(controller.count.toString());
              }),
          TextButton(
            style: Utils.textButtonStryle,
            onPressed: () {
              Get.find<CountControllerWithGetX>().increase('first');
            },
            child: const Text("+first"),
          ),
        ],
      ),
    );
  }
}
