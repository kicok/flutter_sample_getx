import 'package:get/get.dart';

enum NUM { first, second }

class User {
  String? name;
  int? age;
  User({this.name, this.age});
}

class CountControllerWithReactive extends GetxController {
  // extends GetxController 를 하지 않아도 사용가능
  // 하지만 GetX<CountControllerWithReactive>(builder: (_) ... 사용하려면 extends GetxController 해야 한다.
  // 그렇지만 위와 같은 기능을 하는 Obx(()=> ...value)를 사용하는게 더 간단하므로 괜찮다.
  RxInt count = 0.obs;
  RxDouble _double = 0.0.obs;
  RxString value = "".obs;

  Rx<NUM> nums = NUM.first.obs;
  Rx<User> user = User(name: "스페셜", age: 20).obs;
  RxList<String> list = <String>[].obs;

  void increase() {
    count++;
    //_double++;
    _double(424);
    nums(NUM.second);

    user(User());
    user.update((_user) {
      _user?.name = "스페셜리스트";
      _user?.age = 22;
    });

    list.add("item");
    list.addAll(["a", "b"]);
    list.addIf(user.value.name == "스페셜리스트2", "okay");
  }

  void putNumber(int value) {
    //count = value; // 이렇게 사용하지 않음.
    count(value);
  }

  @override
  void onInit() {
    // ever(count, (n) => print("매번 호출 $n"));
    // once(count, (n) => print("한번만 호출 $n"));
    debounce(
        count, (n) => print("마지막 변경에 한번만 호출 $n"), // 빠른시간 동안 여러번 누르고 멈추면 그때 실행됨
        time: const Duration(seconds: 1));
    interval(count, (n) => print("변경되고 있는 동안 일정한 간격마다 호출 $n"),
        time: const Duration(seconds: 1));
    super.onInit();
  }
}
