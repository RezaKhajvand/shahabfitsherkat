import 'dart:convert';

InsertBasketActivity insertBasketActivityFromJson(String str) =>
    InsertBasketActivity.fromJson(json.decode(str));

class InsertBasketActivity {
  String activity;
  List<List<int>> activitySet;
  String basket;
  String collectionId;
  String collectionName;
  DateTime created;
  int dayOfWeek;
  String id;
  String system;
  int systemSubId;
  DateTime updated;
  String user;

  InsertBasketActivity({
    required this.activity,
    required this.activitySet,
    required this.basket,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.dayOfWeek,
    required this.id,
    required this.system,
    required this.systemSubId,
    required this.updated,
    required this.user,
  });

  factory InsertBasketActivity.fromJson(Map<String, dynamic> json) =>
      InsertBasketActivity(
        activity: json["activity"],
        activitySet: List<List<int>>.from(
            json["activitySet"].map((x) => List<int>.from(x.map((x) => x)))),
        basket: json["basket"],
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created: DateTime.parse(json["created"]),
        dayOfWeek: json["dayOfWeek"],
        id: json["id"],
        system: json["system"],
        systemSubId: json["systemSubId"],
        updated: DateTime.parse(json["updated"]),
        user: json["user"],
      );
}
