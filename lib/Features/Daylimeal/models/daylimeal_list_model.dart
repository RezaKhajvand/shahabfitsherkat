import 'dart:convert';

DaylimealList daylimealListFromJson(String str) =>
    DaylimealList.fromJson(json.decode(str));

class DaylimealList {
  int page;
  int perPage;
  int totalItems;
  int totalPages;
  List<Item> items;

  DaylimealList({
    required this.page,
    required this.perPage,
    required this.totalItems,
    required this.totalPages,
    required this.items,
  });

  factory DaylimealList.fromJson(Map<String, dynamic> json) => DaylimealList(
        page: json["page"],
        perPage: json["perPage"],
        totalItems: json["totalItems"],
        totalPages: json["totalPages"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );
}

class Item {
  String activity;
  int age;
  int carbo;
  int calories;
  String collectionId;
  String collectionName;
  DateTime created;
  List<Daylimeal> daylimeal;
  int fat;
  String gender;
  int height;
  String id;
  String name;
  int protein;
  DateTime updated;
  int weight;
  int wrist;

  Item({
    required this.activity,
    required this.age,
    required this.carbo,
    required this.calories,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.daylimeal,
    required this.fat,
    required this.gender,
    required this.height,
    required this.id,
    required this.name,
    required this.protein,
    required this.updated,
    required this.weight,
    required this.wrist,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        activity: json["activity"],
        age: json["age"],
        carbo: json["carbo"],
        calories: json["calories"],
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created: DateTime.parse(json["created"]),
        daylimeal: List<Daylimeal>.from(
            json["daylimeal"].map((x) => Daylimeal.fromJson(x))),
        fat: json["fat"],
        gender: json["gender"],
        height: json["height"],
        id: json["id"],
        name: json["name"],
        protein: json["protein"],
        updated: DateTime.parse(json["updated"]),
        weight: json["weight"],
        wrist: json["wrist"],
      );
}

class Daylimeal {
  String meal;
  List<Choice> choices;

  Daylimeal({
    required this.meal,
    required this.choices,
  });

  factory Daylimeal.fromJson(Map<String, dynamic> json) => Daylimeal(
        meal: json["meal"],
        choices:
            List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
      );
}

class Choice {
  String text;

  Choice({
    required this.text,
  });

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        text: json["text"],
      );
}
