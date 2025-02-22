import 'dart:convert';

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
        updated: DateTime.parse(json["updated"]),
      );
}
