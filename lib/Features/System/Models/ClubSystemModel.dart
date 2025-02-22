import 'dart:convert';
import 'package:shahabfit/Features/Activities/Models/BasketActivityModel.dart';

class PickedSystem {
  final System system;
  final int systemSubId;

  PickedSystem({required this.system, required this.systemSubId});
}

List<System> clubSystemFromJson(String str) =>
List<System>.from(
            json.decode(str).map((x) => System.fromJson(x)))
   ;


