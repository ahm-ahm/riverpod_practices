import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  int get increment => state++;
}

final myNotifierProvider = NotifierProvider<MyNotifier, int>(() {
  return MyNotifier();
});

///---------------------------or use
///final counterProvider = NotifierProvider<MyNotifier, int>(Counter.new);

