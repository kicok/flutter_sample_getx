import 'package:flutter/material.dart';
import 'package:flutter_sample_route_getx/src/home.dart';
import 'package:get/get.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
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
                //Navigator.of(context).pop();
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
                // Navigator.of(context).pushAndRemoveUntil(
                //     MaterialPageRoute(builder: (_) => const Home()),
                //     (route) => false);
                // Get.to(() => const Home()); // 뒤로가기 버튼을 만들면서 이동
                Get.offAll(() => const Home()); // 모든 히스토리를 지우고 이동
              },
            ),
          ],
        ),
      ),
    );
  }
}
