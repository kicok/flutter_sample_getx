import 'package:flutter/material.dart';
import 'package:flutter_sample_route_getx/src/controller/dependency_controller.dart';
import 'package:flutter_sample_route_getx/src/pages/dependencies/get_lazy_put.dart';
import 'package:flutter_sample_route_getx/src/pages/dependencies/get_put.dart';
import 'package:flutter_sample_route_getx/src/utils/util.dart';
import 'package:get/get.dart';

class DependencyManagePage extends StatelessWidget {
  const DependencyManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("의존성 주입"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: Utils.textButtonStryle,
              child: const Text("GetPut"),
              onPressed: () {
                Get.to(() => const GetPut(), binding: BindingsBuilder(() {
                  Get.put(DependencyController());
                }));
              },
            ),
            TextButton(
              style: Utils.textButtonStryle,
              child: const Text("Get.lazyPut"),
              onPressed: () {
                Get.to(() => const GetLazyPut(), binding: BindingsBuilder(() {
                  Get.lazyPut<DependencyController>(
                      () => DependencyController());
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
