import 'dart:convert';

Description descriptionFromJson(String str) =>
    Description.fromJson(json.decode(str));

class Description {
  int page;
  int perPage;
  int totalPages;
  int totalItems;
  List<DescriptionModel> items;

  Description({
    required this.page,
    required this.perPage,
    required this.totalPages,
    required this.totalItems,
    required this.items,
  });

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        page: json["page"],
        perPage: json["perPage"],
        totalPages: json["totalPages"],
        totalItems: json["totalItems"],
        items: List<DescriptionModel>.from(
            json["items"].map((x) => DescriptionModel.fromJson(x))),
      );
}

class DescriptionModel {
  String id;
  String collectionId;
  String collectionName;
  DateTime created;
  DateTime updated;
  String text;

  DescriptionModel({
    required this.id,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.updated,
    required this.text,
  });

  factory DescriptionModel.fromJson(Map<String, dynamic> json) =>
      DescriptionModel(
        id: json["id"],
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        text: json["text"],
      );
}
