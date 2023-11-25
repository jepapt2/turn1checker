// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Deck extends $Deck with RealmEntity, RealmObjectBase, RealmObject {
  Deck(
    ObjectId id,
    String name,
    DateTime createdAt,
    DateTime updatedAt, {
    CardsOrder? cardsOrder,
    Iterable<CardButtons> cards = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'cardsOrder', cardsOrder);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'updatedAt', updatedAt);
    RealmObjectBase.set<RealmList<CardButtons>>(
        this, 'cards', RealmList<CardButtons>(cards));
  }

  Deck._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  RealmList<CardButtons> get cards =>
      RealmObjectBase.get<CardButtons>(this, 'cards') as RealmList<CardButtons>;
  @override
  set cards(covariant RealmList<CardButtons> value) =>
      throw RealmUnsupportedSetError();

  @override
  CardsOrder? get cardsOrder =>
      RealmObjectBase.get<CardsOrder>(this, 'cardsOrder') as CardsOrder?;
  @override
  set cardsOrder(covariant CardsOrder? value) =>
      RealmObjectBase.set(this, 'cardsOrder', value);

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
  Stream<RealmObjectChanges<Deck>> get changes =>
      RealmObjectBase.getChanges<Deck>(this);

  @override
  Deck freeze() => RealmObjectBase.freezeObject<Deck>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Deck._);
    return const SchemaObject(ObjectType.realmObject, Deck, 'Deck', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('cards', RealmPropertyType.object,
          linkTarget: 'CardButtons', collectionType: RealmCollectionType.list),
      SchemaProperty('cardsOrder', RealmPropertyType.object,
          optional: true, linkTarget: 'CardsOrder'),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
      SchemaProperty('updatedAt', RealmPropertyType.timestamp),
    ]);
  }
}

class CardsOrder extends $CardsOrder
    with RealmEntity, RealmObjectBase, RealmObject {
  CardsOrder(
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

  CardsOrder._();

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
  Stream<RealmObjectChanges<CardsOrder>> get changes =>
      RealmObjectBase.getChanges<CardsOrder>(this);

  @override
  CardsOrder freeze() => RealmObjectBase.freezeObject<CardsOrder>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(CardsOrder._);
    return const SchemaObject(
        ObjectType.realmObject, CardsOrder, 'CardsOrder', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('order', RealmPropertyType.string),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
      SchemaProperty('updatedAt', RealmPropertyType.timestamp),
    ]);
  }
}
