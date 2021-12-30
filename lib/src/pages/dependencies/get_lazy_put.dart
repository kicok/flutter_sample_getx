import 'package:flutter/material.dart';
import 'package:flutter_sample_route_getx/src/controller/dependency_controller.dart';
import 'package:flutter_sample_route_getx/src/utils/util.dart';
import 'package:get/get.dart';

class GetLazyPut extends StatelessWidget {
  const GetLazyPut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TextButton(
        style: Utils.textButtonStryle,
        child: const Text("data"),
        onPressed: () {
          Get.find<DependencyController>().increase();
        },
      ),
    );
  }
}
