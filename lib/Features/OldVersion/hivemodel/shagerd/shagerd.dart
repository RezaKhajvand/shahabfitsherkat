import 'package:hive/hive.dart';
part 'shagerd.g.dart';

@HiveType(typeId: 1)
class HiveShagerd extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(2)
  int jalase;
  @HiveField(3)
  bool khosusi;
  @HiveField(4)
  final int id;
  @HiveField(5)
  int plan;
  @HiveField(6)
  DateTime registerdate;
  @HiveField(7)
  String phone;
  @HiveField(8)
  String workouttime;

  HiveShagerd(
      {required this.name,
      required this.jalase,
      required this.khosusi,
      required this.id,
      required this.plan,
      required this.registerdate,
      required this.phone,
      required this.workouttime});
  factory HiveShagerd.fromJson(Map<String, dynamic> json) => HiveShagerd(
        id: json["id"],
        name: json["name"],
        jalase: json["jalase"],
        khosusi: json["khosusi"],
        plan: json["plan"],
        registerdate: DateTime.parse(json["registerdate"]),
        phone: json["phone"],
        workouttime: json["workouttime"],
      );
}
