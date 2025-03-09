import 'dart:convert';

import 'package:shahabfit/constants/url.dart';

List<Shagerd> shagerdFromJson(String str) =>
    List<Shagerd>.from(json.decode(str).map((x) => Shagerd.fromJson(x)));

class Shagerd {
  final String? id;
  final String? collectionId;
  final String? collectionName;
  final DateTime? created;
  final DateTime? updated;
  final String? profileimage;
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
    this.profileimage,
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
    String? profileimage,
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
        profileimage: profileimage ?? this.profileimage);
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
        profileimage:
            '${pb.baseURL}/api/files/${json["collectionId"]}/${json["id"]}/${json["profileimage"]}',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "jalase": jalase,
        "khosusi": khosusi,
        "plan": plan,
        "phone": phone,
        "workouttime": workouttime,
        "registerdate": registerdate.toIso8601String(),
        "profileimage": profileimage,
      };
}
