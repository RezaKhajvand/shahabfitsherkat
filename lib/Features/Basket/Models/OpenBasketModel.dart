import 'dart:convert';

import 'package:shahabfit/Features/Activities/Models/BasketActivityModel.dart';

List<Basket> openBasketFromJson(String str) => List<Basket>.from(
    json.decode(str).map((x) => Basket.fromJson(x)));

