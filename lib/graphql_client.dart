import 'dart:io';

import 'package:ferry/ferry.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:hive/hive.dart';

Future<Client> initClient() async {
  Hive.init(Directory.current.path);
  Directory appDir = await getApplicationDocumentsDirectory();
  final box = await Hive.openBox(appDir.path + '/cache');

  final store = HiveStore(box);

  final cache = Cache(store: store);

  final link = HttpLink("https://ispot-bhutan-prod.herokuapp.com/graphql/");

  final client = Client(link: link, cache: cache);

  return client;
}
