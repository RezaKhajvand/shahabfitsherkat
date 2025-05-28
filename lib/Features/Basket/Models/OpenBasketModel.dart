import 'dart:convert';

import 'package:shahabfit/Features/Activities/Models/BasketActivityModel.dart';

List<Basket> basketListFromJson(String str) =>
    List<Basket>.from(json.decode(str).map((x) => Basket.fromJson(x)));

Basket basketFromJson(String str) => Basket.fromJson(json.decode(str));
