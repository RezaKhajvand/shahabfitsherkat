import 'dart:convert';

List<ActivityItem> basketActivityFromJson(String str) =>
    List<ActivityItem>.from(
        json.decode(str).map((x) => ActivityItem.fromJson(x)));

class ActivityItem {
  String activity;
  List<List<int>> activitySet;
  String basket;
  String collectionId;
  String collectionName;
  DateTime created;
  int dayOfWeek;
  Expand expand;
  String id;
  String? system;
  int systemSubId;
  DateTime updated;
  int numberView;

  ActivityItem({
    required this.activity,
    required this.activitySet,
    required this.basket,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.dayOfWeek,
    required this.expand,
    required this.id,
    required this.system,
    required this.systemSubId,
    required this.updated,
    required this.numberView,
  });

  factory ActivityItem.fromJson(Map<String, dynamic> json) => ActivityItem(
      activity: json["activity"],
      activitySet: List<List<int>>.from(
          json["activitySet"].map((x) => List<int>.from(x.map((x) => x)))),
      basket: json["basket"],
      collectionId: json["collectionId"],
      collectionName: json["collectionName"],
      created: DateTime.parse(json["created"]),
      dayOfWeek: json["dayOfWeek"],
      expand: Expand.fromJson(json["expand"]),
      id: json["id"],
      system: json["system"],
      systemSubId: json["systemSubId"],
      updated: DateTime.parse(json["updated"]),
      numberView: json["numberView"]);
}

class Expand {
  Activity? activity;
  Basket? basket;
  System? system;

  Expand({
    this.activity,
    this.basket,
    this.system,
  });

  factory Expand.fromJson(Map<String, dynamic> json) => Expand(
        activity: Activity.fromJson(json["activity"]),
        basket: Basket.fromJson(json["basket"]),
        system: json["system"] == null ? null : System.fromJson(json["system"]),
      );
}

class System {
  String collectionId;
  String collectionName;
  DateTime created;
  String id;
  String title;
  DateTime updated;
  String description;

  System({
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.id,
    required this.title,
    required this.updated,
    required this.description,
  });

  factory System.fromJson(Map<String, dynamic> json) => System(
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created: DateTime.parse(json["created"]),
        id: json["id"],
        title: json["title"],
        updated: DateTime.parse(json["updated"]),
        description: json["description"],
      );
}

class Activity {
  String catId;
  String collectionId;
  String collectionName;
  DateTime created;
  String id;
  bool isInBasket;
  String title;
  DateTime updated;

  Activity({
    required this.catId,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.id,
    required this.isInBasket,
    required this.title,
    required this.updated,
  });

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        catId: json["catId"],
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created: DateTime.parse(json["created"]),
        id: json["id"],
        isInBasket: json["isInBasket"],
        title: json["title"],
        updated: DateTime.parse(json["updated"]),
      );
}

class Basket {
  String collectionId;
  String collectionName;
  DateTime created;
  String id;
  bool isOpen;
  String name;
  DateTime updated;

  Basket({
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.id,
    required this.isOpen,
    required this.name,
    required this.updated,
  });

  factory Basket.fromJson(Map<String, dynamic> json) => Basket(
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created: DateTime.parse(json["created"]),
        id: json["id"],
        isOpen: json["isOpen"],
        name: json["name"],
        updated: DateTime.parse(json["updated"]),
      );
}
