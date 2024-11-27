import 'package:hive/hive.dart';
part 'jalasat.g.dart';

@HiveType(typeId: 2)
class HiveJalase extends HiveObject {
  @HiveField(0)
  final int shagerId;

  @HiveField(1)
  final DateTime jalaseDate;

  HiveJalase({
    required this.shagerId,
    required this.jalaseDate,
  });
}
