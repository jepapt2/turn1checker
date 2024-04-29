import 'package:realm/realm.dart';

ObjectId getDeckObjectId(String? id) {
  if (id == null) {
    throw Exception('Deck not found');
  }
  return ObjectId.fromHexString(id);
}

ObjectId? getCardObjectId(String? id) {
  if (id == null) {
    return null;
  }
  return ObjectId.fromHexString(id);
}
