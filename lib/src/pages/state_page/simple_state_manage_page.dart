import 'package:flutter/material.dart';
import 'package:flutter_sample_route_getx/src/controller/count_controller_with_provider.dart';
import 'package:flutter_sample_route_getx/src/state/with_getx.dart';
import 'package:flutter_sample_route_getx/src/state/with_provider.dart';
import 'package:provider/provider.dart';

class SimpleStateManagePage extends StatelessWidget {
  const SimpleStateManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('단순상태관리'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: WithGetX(),
            ),
            Expanded(
              child: ChangeNotifierProvider<CountControllerWithProvider>(
                create: (_) => CountControllerWithProvider(),
                child: const WithProvider(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
