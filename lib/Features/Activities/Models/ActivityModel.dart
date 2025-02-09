import 'dart:convert';

ActivityList activityListFromJson(String str) =>
    ActivityList.fromJson(json.decode(str));

class ActivityList {
  int page;
  int perPage;
  int totalItems;
  int totalPages;
  List<ActivityRecord> items;

  ActivityList({
    required this.page,
    required this.perPage,
    required this.totalItems,
    required this.totalPages,
    required this.items,
  });

  factory ActivityList.fromJson(Map<String, dynamic> json) => ActivityList(
        page: json["page"],
        perPage: json["perPage"],
        totalItems: json["totalItems"],
        totalPages: json["totalPages"],
        items: List<ActivityRecord>.from(
            json["items"].map((x) => ActivityRecord.fromJson(x))),
      );
}

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
