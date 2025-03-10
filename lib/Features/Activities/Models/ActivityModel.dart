import 'dart:convert';

import 'package:shahabfit/Features/Activities/Models/BasketActivityModel.dart';
import 'package:shahabfit/constants/pb.dart';

List<ActivityRecord> activityListFromJson(String str) =>
    List<ActivityRecord>.from(
        json.decode(str).map((x) => ActivityRecord.fromJson(x)));

class ActivityRecord {
  String catId;
  String collectionId;
  String collectionName;
  DateTime created;
  String description;
  Category? expand;
  String id;
  bool isInBasket;
  int numberView;
  String title;
  DateTime updated;
  String user;
  String video;

  ActivityRecord({
    required this.catId,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.description,
    this.expand,
    required this.id,
    required this.isInBasket,
    required this.numberView,
    required this.title,
    required this.updated,
    required this.user,
    required this.video,
  });

  factory ActivityRecord.fromJson(Map<String, dynamic> json) => ActivityRecord(
        catId: json["catId"],
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created: DateTime.parse(json["created"]),
        description: json["description"],
        expand: json["expand"] != null && json["expand"]["catId"] != null
            ? Category.fromJson(json["expand"]["catId"])
            : null, // مقداردهی به‌صورت null-safe
        id: json["id"],
        isInBasket: json["isInBasket"],
        numberView: json["numberView"],
        title: json["title"],
        updated: DateTime.parse(json["updated"]),
        user: json["user"],
        video: json["video"] == ''
            ? ''
            : '${pb.baseURL}/api/files/${json["collectionId"]}/${json["id"]}/${json["video"]}',
      );
}
