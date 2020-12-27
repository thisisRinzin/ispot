import 'dart:io';

import 'package:ferry/ferry.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:hive/hive.dart';

Future<Client> initClient() async {
  Hive.init(Directory.current.path);
  // final box = await Hive.openBox('ISpot');

  // final store = HiveStore(box);

  // final cache = Cache(store: store);

  final link = HttpLink("https://demo.saleor.io/graphql/");

  final client = Client(link: link);

  return client;
}
