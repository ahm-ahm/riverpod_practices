import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_demo/restapi-get-request-riverpod/provider.dart';

import 'detail_screen.dart';

class RestApiGetRequestScreen extends ConsumerWidget {
  const RestApiGetRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(userDataProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Profile'),
        ),
        body: data.when(
          data: (data_) {
            return Column(
              children: [
                ...data_.map((e) => ListView(shrinkWrap: true, children: [
                      InkWell(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              e: e,
                            ),
                          ),
                        ),
                        child: ListTile(
                          title: Text(e.firstname),
                          subtitle: Text(e.lastname),
                          trailing: CircleAvatar(
                            backgroundImage: NetworkImage(e.avatar),
                          ),
                        ),
                      ),
                    ])),
              ],
            );
          },
          error: (err, s) => Center(
              child: Text(err.toString().contains('TimeoutException')
                  ? 'Check internet'
                  : 'unknown error')),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
