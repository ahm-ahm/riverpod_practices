import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_demo/post-riverpod-request/album.dart';
import 'package:riverpod_demo/post-riverpod-request/post_request.dart';

//API SERVICE Provider
final apiProvider = Provider<ApiService>((ref) => ApiService());

final albumProvider = FutureProvider.family<Album, String>((ref, title) async {
  return ref.read(apiProvider).createAlbum(title);
});
