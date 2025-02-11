import 'dart:convert';

List<Shagerd> shagerdFromJson(String str) =>
    List<Shagerd>.from(json.decode(str).map((x) => Shagerd.fromJson(x)));

class Shagerd {
  final String id;
  final String collectionId;
  final String collectionName;
  final DateTime created;
  final DateTime updated;
  String shagerdId;
  String name;
  int jalase;
  bool khosusi;
  String plan;
  String phone;
  String workouttime;
  DateTime registerdate;

  Shagerd({
    required this.id,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.updated,
    required this.shagerdId,
    required this.name,
    required this.jalase,
    required this.khosusi,
    required this.plan,
    required this.phone,
    required this.workouttime,
    required this.registerdate,
  });

// متد `copyWith` برای تغییر مقادیر خاص
  Shagerd copyWith({
    String? shagerdId,
    String? name,
    int? jalase,
    bool? khosusi,
    String? plan,
    String? phone,
    String? workouttime,
    DateTime? registerdate,
  }) {
    return Shagerd(
      id: id,
      collectionId: collectionId,
      collectionName: collectionName,
      created: created,
      updated: updated,
      shagerdId: shagerdId ?? this.shagerdId,
      name: name ?? this.name,
      jalase: jalase ?? this.jalase,
      khosusi: khosusi ?? this.khosusi,
      plan: plan ?? this.plan,
      phone: phone ?? this.phone,
      workouttime: workouttime ?? this.workouttime,
      registerdate: registerdate ?? this.registerdate,
    );
  }

  factory Shagerd.fromJson(Map<String, dynamic> json) => Shagerd(
        id: json["id"],
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        shagerdId: json["shagerdId"],
        name: json["name"],
        jalase: json["jalase"],
        khosusi: json["khosusi"],
        plan: json["plan"],
        phone: json["phone"],
        workouttime: json["workouttime"],
        registerdate: DateTime.parse(json["registerdate"]),
      );

  Map<String, dynamic> toJson() => {
        "shagerdId": shagerdId,
        "name": name,
        "jalase": jalase,
        "khosusi": khosusi,
        "plan": plan,
        "phone": phone,
        "workouttime": workouttime,
        "registerdate": registerdate.toIso8601String(),
      };
}
