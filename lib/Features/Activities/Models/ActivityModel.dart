import 'dart:convert';

import 'package:shahabfit/Features/oldversion/data/shagerdlist_datasource.dart';

List<ActivityRecord> activityListFromJson(String str) =>
    List<ActivityRecord>.from(
        json.decode(str).map((x) => ActivityRecord.fromJson(x)));

class ActivityRecord {
  String catId;
  String collectionId;
  String collectionName;
  int numberView;
  DateTime created;
  String id;
  bool isInBasket;
  String title;
  String description;
  String video;
  DateTime updated;

  ActivityRecord({
    required this.catId,
    required this.collectionId,
    required this.collectionName,
    required this.numberView,
    required this.created,
    required this.id,
    required this.isInBasket,
    required this.title,
    required this.description,
    required this.video,
    required this.updated,
  });

  factory ActivityRecord.fromJson(Map<String, dynamic> json) => ActivityRecord(
        catId: json["catId"],
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        numberView: json["numberView"],
        created: DateTime.parse(json["created"]),
        id: json["id"],
        isInBasket: json["isInBasket"],
        title: json["title"],
        description: json["description"],
        video: json["video"] == ''
            ? ''
            : '${pb.baseURL}/api/files/${json["collectionId"]}/${json["id"]}/${json["video"]}',
        updated: DateTime.parse(json["updated"]),
      );
}
