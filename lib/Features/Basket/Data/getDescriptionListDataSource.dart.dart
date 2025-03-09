import 'package:shahabfit/Features/Basket/Utils/descriptiontype.dart';
import 'package:shahabfit/constants/url.dart';

Future<String> getDescriptionList(DescriptionType type) async {
  try {
    final records = await pb.collection('description').getFullList(
          filter: 'type="${getDescriptionTitle(type)}"',
        );
    print(records.toString());
    return records.toString();
  } catch (e) {
    rethrow;
  }
}
