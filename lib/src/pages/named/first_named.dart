import 'package:flutter/material.dart';
import 'package:flutter_sample_route_getx/src/utils/util.dart';
import 'package:get/get.dart';

class FirstNamedPage extends StatelessWidget {
  const FirstNamedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Named Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: Utils.textButtonStryle,
              child: const Text('다음페이지 이동'),
              onPressed: () {
                // 현재페이지를 없애고 페이지 이동,
                // second 페이지에서 뒤로가기를 하면 현재페이지(/first)가 아닌 그 이전페이지 즉 (/)이 나온다.
                Get.offNamed('/second');
              },
            )
          ],
        ),
      ),
    );
  }
}
