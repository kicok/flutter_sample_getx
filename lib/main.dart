import 'package:flutter/material.dart';
import 'package:flutter_sample_route_getx/src/controller/count_controller_with_getx.dart';
import 'package:flutter_sample_route_getx/src/pages/binding_sample_page.dart';
import 'package:get/get.dart';

import 'src/binding/binding_page.dart';
import 'src/home.dart';
import 'src/pages/argu/map_page.dart';
import 'src/pages/argu/obj_page.dart';
import 'src/pages/argu/str_page.dart';
import 'src/pages/named/first_named.dart';
import 'src/pages/named/second_named.dart';
import 'src/pages/argu/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const Home(),
      initialRoute: "/",
      // routes: {
      //   // 기존 Route 방식
      //   "/": (context) => const Home(), // home: const Home()은 중복이므로 더이상 필요가 없다.
      //   "/first": (context) => const FirstNamedPage(),
      //   "/second": (context) => const SecondNamedPage(),
      // },
      getPages: [
        GetPage(
            name: "/", page: () => const Home(), transition: Transition.zoom),
        GetPage(
            name: "/first",
            page: () => const FirstNamedPage(),
            transition: Transition.zoom),
        GetPage(
            name: "/second",
            page: () => const SecondNamedPage(),
            transition: Transition.zoom),
        GetPage(
            name: "/strpage",
            page: () => const StrPage(),
            transition: Transition.zoom),
        GetPage(
            name: "/mappage",
            page: () => const MapPage(),
            transition: Transition.zoom),
        GetPage(
            name: "/objpage",
            page: () => const ObjPage(),
            transition: Transition.zoom),
        GetPage(
            name: "/user/:uid",
            page: () => const UserPage(),
            transition: Transition.zoom),
        GetPage(
          name: "/binding",
          page: () => const BindingSamplePage(),
          binding: BindingPage(),
          // binding: BindingsBuilder(() {
          //   Get.put(CountControllerWithGetX());
          // }),
        )
      ],
    );
  }
}
