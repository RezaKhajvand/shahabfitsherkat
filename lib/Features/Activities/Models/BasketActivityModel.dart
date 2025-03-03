import 'package:chewie/chewie.dart';
import 'package:shahabfit/Features/Activities/Models/ActivityModel.dart';
import 'package:shahabfit/Features/oldversion/data/shagerdlist_datasource.dart';

import 'dart:convert';

import 'package:video_player/video_player.dart';

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
  int numberView;
  String? system;
  int systemSubId;
  DateTime updated;
  VideoPlayerController? videoController;
  ChewieController? chewieController;

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
    required this.numberView,
    required this.system,
    required this.systemSubId,
    required this.updated,
    this.videoController,
    this.chewieController,
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
        numberView: json["numberView"],
        system: json["system"],
        systemSubId: json["systemSubId"],
        updated: DateTime.parse(json["updated"]),
      );
}

class Expand {
  ActivityRecord? activity;
  Basket? basket;
  System? system;

  Expand({
    this.activity,
    this.basket,
    this.system,
  });

  factory Expand.fromJson(Map<String, dynamic> json) => Expand(
        activity: ActivityRecord.fromJson(json["activity"]),
        basket: Basket.fromJson(json["basket"]),
        system: json["system"] == null ? null : System.fromJson(json["system"]),
      );
}

class Category {
  final String collectionId;
  final String collectionName;
  final DateTime created;
  final String id;
  final String image;
  final String title;
  final DateTime updated;

  Category({
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.id,
    required this.image,
    required this.title,
    required this.updated,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created: DateTime.parse(json["created"]),
        id: json["id"],
        image:
            '${pb.baseURL}/api/files/${json["collectionId"]}/${json["id"]}/${json["image"]}',
        title: json["title"],
        updated: DateTime.parse(json["updated"]),
      );
}

class System {
  String collectionId;
  String collectionName;
  DateTime created;
  String id;
  String image;
  String title;
  DateTime updated;
  String description;
  String user;

  System({
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.id,
    required this.image,
    required this.title,
    required this.updated,
    required this.description,
    required this.user,
  });

  factory System.fromJson(Map<String, dynamic> json) => System(
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created: DateTime.parse(json["created"]),
        id: json["id"],
        image:
            '${pb.baseURL}/api/files/${json["collectionId"]}/${json["id"]}/${json["image"]}',
        title: json["title"],
        updated: DateTime.parse(json["updated"]),
        description: json["description"],
        user: json["user"],
      );
}

class Basket {
  String collectionId;
  String collectionName;
  DateTime created;
  int dayCount;
  String id;
  bool isOpen;
  String level;
  String name;
  DateTime updated;
  String user;

  Basket({
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.dayCount,
    required this.id,
    required this.isOpen,
    required this.level,
    required this.name,
    required this.updated,
    required this.user,
  });

  factory Basket.fromJson(Map<String, dynamic> json) => Basket(
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created: DateTime.parse(json["created"]),
        dayCount: json["dayCount"],
        id: json["id"],
        isOpen: json["isOpen"],
        level: json["level"],
        name: json["name"],
        updated: DateTime.parse(json["updated"]),
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "collectionId": collectionId,
        "collectionName": collectionName,
        "created": created.toIso8601String(),
        "dayCount": dayCount,
        "id": id,
        "isOpen": isOpen,
        "level": level,
        "name": name,
        "updated": updated.toIso8601String(),
        "user": user,
      };
}
