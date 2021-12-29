import 'package:flutter/material.dart';
import 'package:flutter_sample_route_getx/src/utils/util.dart';

class WithGetX extends StatelessWidget {
  const WithGetX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("GetX", style: TextStyle(fontSize: 50)),
          const Text("0", style: TextStyle(fontSize: 50)),
          TextButton(
            style: Utils.textButtonStryle,
            onPressed: () {},
            child: const Text(
              "+",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
