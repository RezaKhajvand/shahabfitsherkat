import 'package:shahabfit/Features/oldversion/replacefarsiandenglishnumber.dart';
import 'package:shamsi_date/shamsi_date.dart';

String format1(Date d) {
  final f = d.formatter;

  return replaceFarsiNumber('${f.wN} ${f.d} ${f.mN} ${f.yyyy}');
}
