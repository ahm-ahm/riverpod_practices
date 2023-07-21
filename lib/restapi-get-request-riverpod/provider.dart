import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'apiservice.dart';
import 'model.dart';

//API SERVICE Provider
final apiProvider = Provider<ApiService>((ref) => ApiService());
final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.read(apiProvider).getUser();
});
