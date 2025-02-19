import 'dart:convert';

List<Shagerd> shagerdFromJson(String str) =>
    List<Shagerd>.from(json.decode(str).map((x) => Shagerd.fromJson(x)));

class Shagerd {
  final String? id;
  final String? collectionId;
  final String? collectionName;
  final DateTime? created;
  final DateTime? updated;
  final String? profileImage;
  String name;
  int jalase;
  bool khosusi;
  String plan;
  String phone;
  String workouttime;
  DateTime registerdate;

  Shagerd({
    this.id,
    this.collectionId,
    this.collectionName,
    this.created,
    this.updated,
    this.profileImage,
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
    String? profileImage,
  }) {
    return Shagerd(
        id: id,
        collectionId: collectionId,
        collectionName: collectionName,
        created: created,
        updated: updated,
        name: name ?? this.name,
        jalase: jalase ?? this.jalase,
        khosusi: khosusi ?? this.khosusi,
        plan: plan ?? this.plan,
        phone: phone ?? this.phone,
        workouttime: workouttime ?? this.workouttime,
        registerdate: registerdate ?? this.registerdate,
        profileImage: profileImage ?? this.profileImage);
  }

  factory Shagerd.fromJson(Map<String, dynamic> json) => Shagerd(
        id: json["id"],
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        name: json["name"],
        jalase: json["jalase"],
        khosusi: json["khosusi"],
        plan: json["plan"],
        phone: json["phone"],
        workouttime: json["workouttime"],
        registerdate: DateTime.parse(json["registerdate"]),
        profileImage:
            'https://club.liara.run/api/files/${json["collectionId"]}/${json["id"]}/${json["profileImage"]}',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "jalase": jalase,
        "khosusi": khosusi,
        "plan": plan,
        "phone": phone,
        "workouttime": workouttime,
        "registerdate": registerdate.toIso8601String(),
        "profileImage": profileImage,
      };
}
