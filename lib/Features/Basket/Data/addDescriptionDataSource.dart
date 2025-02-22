import 'package:shahabfit/Features/Basket/Utils/descriptiontype.dart';
import 'package:shahabfit/Features/oldversion/data/shagerdlist_datasource.dart';

Future<String> addDescription(String text, DescriptionType type) async {
  var body = {"text": text, "type": getDescriptionTitle(type)};
  try {
    final record = await pb.collection('description').create(body: body);
    print(record.toString());
    return record.toString();
  } catch (e) {
    ;
    rethrow;
  }
}
