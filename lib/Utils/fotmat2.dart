import 'package:shahabfit/Features/oldversion/utils/replacefarsiandenglishnumber.dart';
import 'package:shamsi_date/shamsi_date.dart';

String format2(Date d) {
  final f = d.formatter;
  return replaceFarsiNumber('${f.d} / ${f.m} / ${f.yyyy}');
}
