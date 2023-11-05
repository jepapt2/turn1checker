// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Card extends $Card with RealmEntity, RealmObjectBase, RealmObject {
  Card(
    ObjectId id,
    String name,
    String image,
    DateTime createdAt,
    DateTime updatedAt,
    int order,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'image', image);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'updatedAt', updatedAt);
    RealmObjectBase.set(this, 'order', order);
  }

  Card._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get image => RealmObjectBase.get<String>(this, 'image') as String;
  @override
  set image(String value) => RealmObjectBase.set(this, 'image', value);

  @override
  DateTime get createdAt =>
      RealmObjectBase.get<DateTime>(this, 'createdAt') as DateTime;
  @override
  set createdAt(DateTime value) =>
      RealmObjectBase.set(this, 'createdAt', value);

  @override
  DateTime get updatedAt =>
      RealmObjectBase.get<DateTime>(this, 'updatedAt') as DateTime;
  @override
  set updatedAt(DateTime value) =>
      RealmObjectBase.set(this, 'updatedAt', value);

  @override
  int get order => RealmObjectBase.get<int>(this, 'order') as int;
  @override
  set order(int value) => RealmObjectBase.set(this, 'order', value);

  @override
  Stream<RealmObjectChanges<Card>> get changes =>
      RealmObjectBase.getChanges<Card>(this);

  @override
  Card freeze() => RealmObjectBase.freezeObject<Card>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Card._);
    return const SchemaObject(ObjectType.realmObject, Card, 'Card', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('image', RealmPropertyType.string),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
      SchemaProperty('updatedAt', RealmPropertyType.timestamp),
      SchemaProperty('order', RealmPropertyType.int),
    ]);
  }
}

class ButtonsOrder extends $ButtonsOrder
    with RealmEntity, RealmObjectBase, RealmObject {
  ButtonsOrder(
    ObjectId id,
    String order,
    DateTime createdAt,
    DateTime updatedAt,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'order', order);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'updatedAt', updatedAt);
  }

  ButtonsOrder._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get order => RealmObjectBase.get<String>(this, 'order') as String;
  @override
  set order(String value) => RealmObjectBase.set(this, 'order', value);

  @override
  DateTime get createdAt =>
      RealmObjectBase.get<DateTime>(this, 'createdAt') as DateTime;
  @override
  set createdAt(DateTime value) =>
      RealmObjectBase.set(this, 'createdAt', value);

  @override
  DateTime get updatedAt =>
      RealmObjectBase.get<DateTime>(this, 'updatedAt') as DateTime;
  @override
  set updatedAt(DateTime value) =>
      RealmObjectBase.set(this, 'updatedAt', value);

  @override
  Stream<RealmObjectChanges<ButtonsOrder>> get changes =>
      RealmObjectBase.getChanges<ButtonsOrder>(this);

  @override
  ButtonsOrder freeze() => RealmObjectBase.freezeObject<ButtonsOrder>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ButtonsOrder._);
    return const SchemaObject(
        ObjectType.realmObject, ButtonsOrder, 'ButtonsOrder', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('order', RealmPropertyType.string),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
      SchemaProperty('updatedAt', RealmPropertyType.timestamp),
    ]);
  }
}

class CardType extends $CardType
    with RealmEntity, RealmObjectBase, RealmObject {
  CardType(
    ObjectId id,
    String name,
    String color,
    DateTime createdAt,
    DateTime updatedAt,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'color', color);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'updatedAt', updatedAt);
  }

  CardType._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get color => RealmObjectBase.get<String>(this, 'color') as String;
  @override
  set color(String value) => RealmObjectBase.set(this, 'color', value);

  @override
  DateTime get createdAt =>
      RealmObjectBase.get<DateTime>(this, 'createdAt') as DateTime;
  @override
  set createdAt(DateTime value) =>
      RealmObjectBase.set(this, 'createdAt', value);

  @override
  DateTime get updatedAt =>
      RealmObjectBase.get<DateTime>(this, 'updatedAt') as DateTime;
  @override
  set updatedAt(DateTime value) =>
      RealmObjectBase.set(this, 'updatedAt', value);

  @override
  Stream<RealmObjectChanges<CardType>> get changes =>
      RealmObjectBase.getChanges<CardType>(this);

  @override
  CardType freeze() => RealmObjectBase.freezeObject<CardType>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(CardType._);
    return const SchemaObject(ObjectType.realmObject, CardType, 'CardType', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('color', RealmPropertyType.string),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
      SchemaProperty('updatedAt', RealmPropertyType.timestamp),
    ]);
  }
}
