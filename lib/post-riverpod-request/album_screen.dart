import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_demo/post-riverpod-request/album_provider.dart';

class APIPostRequestScreen extends ConsumerWidget {
  const APIPostRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(albumProvider('Test'));
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Profile'),
        ),
        body: data.when(
          data: (data_) {
            return Card(
              child: ListTile(
                title: Text('Title: ${data_.title}'),
                subtitle: Text('Id:${data_.id}'),
              ),
            );
          },
          error: (err, s) => Center(child: Text(err.toString())),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
