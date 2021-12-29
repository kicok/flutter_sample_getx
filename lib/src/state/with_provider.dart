import 'package:flutter/material.dart';
import 'package:flutter_sample_route_getx/src/controller/count_controller_with_provider.dart';
import 'package:flutter_sample_route_getx/src/utils/util.dart';
import 'package:provider/provider.dart';

class WithProvider extends StatelessWidget {
  const WithProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Provider", style: TextStyle(fontSize: 50)),
          Consumer<CountControllerWithProvider>(builder: (_, snapshot, child) {
            return Text(
              snapshot.count.toString(),
              style: const TextStyle(fontSize: 50),
            );
          }),
          TextButton(
            style: Utils.textButtonStryle,
            onPressed: () {
              Provider.of<CountControllerWithProvider>(context, listen: false)
                  .increase();
            },
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
