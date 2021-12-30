import 'package:flutter/material.dart';
import 'package:flutter_sample_route_getx/src/controller/dependency_controller.dart';
import 'package:flutter_sample_route_getx/src/utils/util.dart';
import 'package:get/get.dart';

class GetPut extends StatelessWidget {
  const GetPut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: Utils.textButtonStryle,
              child: const Text("Get.create 방식에서는 \n클릭할때마다 인스턴스가 생성된다"),
              onPressed: () {
                Get.find<DependencyController>().increase();
                print(Get.find<DependencyController>().hashCode.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
