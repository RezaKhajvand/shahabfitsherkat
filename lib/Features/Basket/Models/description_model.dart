import 'dart:convert';

List<DescriptionModel> descriptionFromJson(String str) =>
    List<DescriptionModel>.from(
        json.decode(str).map((x) => DescriptionModel.fromJson(x)));

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
