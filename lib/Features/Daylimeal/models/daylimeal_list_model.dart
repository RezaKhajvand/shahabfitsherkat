import 'dart:convert';

List<Item> daylimealListFromJson(String str) =>
    List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

Item daylimelFromJson(String str) => Item.fromJson(json.decode(str));

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
  String goal;
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
    required this.goal,
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
        goal: json["goal"],
        gender: json["gender"],
        height: json["height"],
        id: json["id"],
        name: json["name"],
        protein: json["protein"],
        updated: DateTime.parse(json["updated"]),
        weight: json["weight"],
        wrist: json["wrist"],
      );

  Map<String, dynamic> toJson() => {
        "activity": activity,
        "age": age,
        "carbo": carbo,
        "calories": calories,
        "collectionId": collectionId,
        "collectionName": collectionName,
        "created": created.toIso8601String(),
        "daylimeal": daylimeal.map((x) => x.toJson()).toList(),
        "fat": fat,
        "goal": goal,
        "gender": gender,
        "height": height,
        "id": id,
        "name": name,
        "protein": protein,
        "updated": updated.toIso8601String(),
        "weight": weight,
        "wrist": wrist,
      };
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

  Map<String, dynamic> toJson() => {
        "meal": meal,
        "choices": choices.map((x) => x.toJson()).toList(),
      };
}

class Choice {
  String text;

  Choice({
    required this.text,
  });

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
      };
}
