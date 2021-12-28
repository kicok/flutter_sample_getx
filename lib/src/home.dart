import 'package:flutter/material.dart';
import 'package:flutter_sample_route_getx/src/pages/normal/first.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ButtonStyle _makeStryle = TextButton.styleFrom(
      backgroundColor: Colors.grey.withOpacity(0.2),
      primary: Colors.black,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('라우트 관리 홈'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: _makeStryle,
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
              style: _makeStryle,
              child: const Text('Named 라우트'),
              onPressed: () {
                // Navigator.of(context).pushNamed('/first');
                Get.toNamed('/first');
              },
            ),
            const Divider(),
            TextButton(
              style: _makeStryle,
              child: const Text('Arguments(str)전달'),
              onPressed: () {
                // Navigator.of(context).pushNamed('/first');
                Get.toNamed('/strpage', arguments: '스페셜');
                //Get.to(() => const FirstPage(), arguments: "스페셜"); // 이렇게 arguments전달 가능
              },
            ),
            TextButton(
              style: _makeStryle,
              child: const Text('Arguments(map)전달'),
              onPressed: () {
                Get.toNamed('/mappage',
                    arguments: {"name": "스페셜", "age": "22"});
              },
            ),
            TextButton(
              style: _makeStryle,
              child: const Text('Arguments(obj)전달'),
              onPressed: () {
                // Navigator.of(context).pushNamed('/first');
                Get.toNamed('/objpage', arguments: ObjSample("스페셜", 22));
                //Get.to(() => const FirstPage(), arguments: "스페셜"); // 이렇게 arguments전달 가능
              },
            ),
            TextButton(
              style: _makeStryle,
              child: const Text('동적 url 전달'),
              onPressed: () {
                Get.toNamed('/user/4081?name=스페셜&age=22');
              },
            ),
            const Divider(),
            TextButton(
              style: _makeStryle,
              child: const Text('단순상태관리'),
              onPressed: () {
                Get.toNamed('/user/4081?name=스페셜&age=22');
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
