import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondNamedPage extends StatelessWidget {
  const SecondNamedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Named Page'),
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
              child: const Text('뒤로 이동'),
              onPressed: () {
                Get.back(); // context 필요 없이 아무곳에서나 이동할수 있다.
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey.withOpacity(0.2),
                primary: Colors.black,
              ),
              child: const Text('홈으로 이동'),
              onPressed: () {
                Get.offAllNamed("/");
              },
            ),
          ],
        ),
      ),
    );
  }
}
