import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shahabfit/Features/OldVersion/data/shagerdlist_datasource.dart';
import 'package:shahabfit/Features/OldVersion/models/shagerd.dart';

final shagerdProvider = FutureProvider<List<HiveShagerd>>((ref) async {
  List<HiveShagerd> students = HiveShagerd.fromJsonList(await getShagerdList());
  return students;
});
