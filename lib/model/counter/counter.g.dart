// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Counter extends $Counter with RealmEntity, RealmObjectBase, RealmObject {
  Counter(
    ObjectId id,
    int initialValue,
    int order, {
    Iterable<int> buttonsValue = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'initialValue', initialValue);
    RealmObjectBase.set(this, 'order', order);
    RealmObjectBase.set<RealmList<int>>(
        this, 'buttonsValue', RealmList<int>(buttonsValue));
  }

  Counter._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  int get initialValue => RealmObjectBase.get<int>(this, 'initialValue') as int;
  @override
  set initialValue(int value) =>
      RealmObjectBase.set(this, 'initialValue', value);

  @override
  RealmList<int> get buttonsValue =>
      RealmObjectBase.get<int>(this, 'buttonsValue') as RealmList<int>;
  @override
  set buttonsValue(covariant RealmList<int> value) =>
      throw RealmUnsupportedSetError();

  @override
  int get order => RealmObjectBase.get<int>(this, 'order') as int;
  @override
  set order(int value) => RealmObjectBase.set(this, 'order', value);

  @override
  Stream<RealmObjectChanges<Counter>> get changes =>
      RealmObjectBase.getChanges<Counter>(this);

  @override
  Counter freeze() => RealmObjectBase.freezeObject<Counter>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Counter._);
    return const SchemaObject(ObjectType.realmObject, Counter, 'Counter', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('initialValue', RealmPropertyType.int),
      SchemaProperty('buttonsValue', RealmPropertyType.int,
          collectionType: RealmCollectionType.list),
      SchemaProperty('order', RealmPropertyType.int),
    ]);
  }
}
