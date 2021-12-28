import 'package:flutter/material.dart';
import 'package:flutter_sample_route_getx/src/pages/normal/second.dart';
import 'package:get/get.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey.withOpacity(0.2),
                primary: Colors.black,
              ),
              child: const Text('다음페이지 이동'),
              onPressed: () {
                Get.to(() => const SecondPage());
              },
            )
          ],
        ),
      ),
    );
  }
}
