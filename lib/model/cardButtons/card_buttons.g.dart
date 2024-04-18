// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_buttons.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class CardButtons extends $CardButtons
    with RealmEntity, RealmObjectBase, RealmObject {
  CardButtons(
    ObjectId id,
    String type,
    String name,
    DateTime createdAt,
    DateTime updatedAt, {
    String? image,
    Iterable<Counter> counters = const [],
    Iterable<EffectCheckButton> effectCheckButtons = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'image', image);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'updatedAt', updatedAt);
    RealmObjectBase.set<RealmList<Counter>>(
        this, 'counters', RealmList<Counter>(counters));
    RealmObjectBase.set<RealmList<EffectCheckButton>>(this,
        'effectCheckButtons', RealmList<EffectCheckButton>(effectCheckButtons));
  }

  CardButtons._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get type => RealmObjectBase.get<String>(this, 'type') as String;
  @override
  set type(String value) => RealmObjectBase.set(this, 'type', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String? get image => RealmObjectBase.get<String>(this, 'image') as String?;
  @override
  set image(String? value) => RealmObjectBase.set(this, 'image', value);

  @override
  RealmList<Counter> get counters =>
      RealmObjectBase.get<Counter>(this, 'counters') as RealmList<Counter>;
  @override
  set counters(covariant RealmList<Counter> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<EffectCheckButton> get effectCheckButtons =>
      RealmObjectBase.get<EffectCheckButton>(this, 'effectCheckButtons')
          as RealmList<EffectCheckButton>;
  @override
  set effectCheckButtons(covariant RealmList<EffectCheckButton> value) =>
      throw RealmUnsupportedSetError();

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
  Stream<RealmObjectChanges<CardButtons>> get changes =>
      RealmObjectBase.getChanges<CardButtons>(this);

  @override
  CardButtons freeze() => RealmObjectBase.freezeObject<CardButtons>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(CardButtons._);
    return const SchemaObject(
        ObjectType.realmObject, CardButtons, 'CardButtons', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('type', RealmPropertyType.string),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('image', RealmPropertyType.string, optional: true),
      SchemaProperty('counters', RealmPropertyType.object,
          linkTarget: 'Counter', collectionType: RealmCollectionType.list),
      SchemaProperty('effectCheckButtons', RealmPropertyType.object,
          linkTarget: 'EffectCheckButton',
          collectionType: RealmCollectionType.list),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
      SchemaProperty('updatedAt', RealmPropertyType.timestamp),
    ]);
  }
}
