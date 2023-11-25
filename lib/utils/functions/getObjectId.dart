import 'package:realm/realm.dart';

ObjectId getObjectId(String? id) {
  if (id == null) {
    throw Exception('Deck not found');
  }
  return ObjectId.fromHexString(id);
}
