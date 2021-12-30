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
            TextButton(
              style: Utils.textButtonStryle,
              child: const Text("Get.putAsync"), // 비동기 처리
              onPressed: () {
                Get.to(() => const GetPut(), binding: BindingsBuilder(() {
                  // Get.put방식과 거의 비슷하나 인스턴스만들기전 비동기 작업을 먼저하는데 차이가 있음
                  // 그러나 굳이 이렇게 하지 않고 Get.put으로 먼저 인스턴스를 만들고 이후에 비동기 작업을 하는 방식을 더 많이 사용함.
                  Get.putAsync<DependencyController>(() async {
                    await Future.delayed(const Duration(seconds: 5));
                    return DependencyController();
                  });
                }));
              },
            ),
            TextButton(
              style: Utils.textButtonStryle,
              child: const Text("Get.create"),
              onPressed: () {
                Get.to(() => const GetPut(), binding: BindingsBuilder(() {
                  // Get.put, Get.lazyPut, Get.putAsync 는 모두 singleton 방식으로 인스턴스가 하나만 생성하고 다른곳에서 공유하는 방식이다.
                  // Get.create 방식은 여러개의 인스턴스를 생성할수 있다. 이걸 어떤식으로 활용할지는 알수 없음.
                  // 사용방식은 Get.GetLazyPut 방식과 비슷함
                  Get.create<DependencyController>(
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
