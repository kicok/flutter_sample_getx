import 'package:flutter/material.dart';
import 'package:flutter_sample_route_getx/src/pages/dependencies/dependency_manage_page.dart';
import 'package:flutter_sample_route_getx/src/utils/util.dart';
import 'pages/normal/first.dart';
import 'package:get/get.dart';

import 'pages/state_page/reactive_state_manage_page.dart';
import 'pages/state_page/simple_state_manage_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('라우트 관리 홈'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: Utils.textButtonStryle,
              child: const Text('일반적인 라우트'),
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (_) => const FirstPage(),
                // ));

                Get.to(() => const FirstPage());
              },
            ),
            const Divider(),
            TextButton(
              style: Utils.textButtonStryle,
              child: const Text('Named 라우트'),
              onPressed: () {
                // Navigator.of(context).pushNamed('/first');
                Get.toNamed('/first');
              },
            ),
            const Divider(),
            TextButton(
              style: Utils.textButtonStryle,
              child: const Text('Arguments(str)전달'),
              onPressed: () {
                // Navigator.of(context).pushNamed('/first');
                Get.toNamed('/strpage', arguments: '스페셜');
                //Get.to(() => const FirstPage(), arguments: "스페셜"); // 이렇게 arguments전달 가능
              },
            ),
            TextButton(
              style: Utils.textButtonStryle,
              child: const Text('Arguments(map)전달'),
              onPressed: () {
                Get.toNamed('/mappage',
                    arguments: {"name": "스페셜", "age": "22"});
              },
            ),
            TextButton(
              style: Utils.textButtonStryle,
              child: const Text('Arguments(obj)전달'),
              onPressed: () {
                // Navigator.of(context).pushNamed('/first');
                Get.toNamed('/objpage', arguments: ObjSample("스페셜", 22));
                //Get.to(() => const FirstPage(), arguments: "스페셜"); // 이렇게 arguments전달 가능
              },
            ),
            TextButton(
              style: Utils.textButtonStryle,
              child: const Text('동적 url 전달'),
              onPressed: () {
                Get.toNamed('/user/4081?name=스페셜&age=22');
              },
            ),
            const Divider(),
            TextButton(
              style: Utils.textButtonStryle,
              child: const Text('단순상태관리'),
              onPressed: () {
                Get.to(() => const SimpleStateManagePage());
              },
            ),
            TextButton(
              style: Utils.textButtonStryle,
              child: const Text('반응형상태관리(Reactive)'),
              onPressed: () {
                Get.to(() => const ReactiveStateManagePage());
              },
            ),
            const Divider(),
            TextButton(
              style: Utils.textButtonStryle,
              child: const Text('의존성관리'),
              onPressed: () {
                Get.to(() => const DependencyManagePage());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ObjSample {
  late final String name;
  late final int age;

  ObjSample(this.name, this.age);
}
