// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Counter extends $Counter with RealmEntity, RealmObjectBase, RealmObject {
  Counter(
    ObjectId id,
    int initialValue,
    DateTime createdAt,
    DateTime updatedAt, {
    ButtonsOrder? order,
    Iterable<CounterButton> buttons = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'initialValue', initialValue);
    RealmObjectBase.set(this, 'order', order);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'updatedAt', updatedAt);
    RealmObjectBase.set<RealmList<CounterButton>>(
        this, 'buttons', RealmList<CounterButton>(buttons));
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
  RealmList<CounterButton> get buttons =>
      RealmObjectBase.get<CounterButton>(this, 'buttons')
          as RealmList<CounterButton>;
  @override
  set buttons(covariant RealmList<CounterButton> value) =>
      throw RealmUnsupportedSetError();

  @override
  ButtonsOrder? get order =>
      RealmObjectBase.get<ButtonsOrder>(this, 'order') as ButtonsOrder?;
  @override
  set order(covariant ButtonsOrder? value) =>
      RealmObjectBase.set(this, 'order', value);

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
      SchemaProperty('buttons', RealmPropertyType.object,
          linkTarget: 'CounterButton',
          collectionType: RealmCollectionType.list),
      SchemaProperty('order', RealmPropertyType.object,
          optional: true, linkTarget: 'ButtonsOrder'),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
      SchemaProperty('updatedAt', RealmPropertyType.timestamp),
    ]);
  }
}

class CounterButton extends $CounterButton
    with RealmEntity, RealmObjectBase, RealmObject {
  CounterButton(
    ObjectId id,
    int value,
    bool isIncrement,
    DateTime createdAt,
    DateTime updatedAt,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'value', value);
    RealmObjectBase.set(this, 'isIncrement', isIncrement);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'updatedAt', updatedAt);
  }

  CounterButton._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  int get value => RealmObjectBase.get<int>(this, 'value') as int;
  @override
  set value(int value) => RealmObjectBase.set(this, 'value', value);

  @override
  bool get isIncrement =>
      RealmObjectBase.get<bool>(this, 'isIncrement') as bool;
  @override
  set isIncrement(bool value) =>
      RealmObjectBase.set(this, 'isIncrement', value);

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
  Stream<RealmObjectChanges<CounterButton>> get changes =>
      RealmObjectBase.getChanges<CounterButton>(this);

  @override
  CounterButton freeze() => RealmObjectBase.freezeObject<CounterButton>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(CounterButton._);
    return const SchemaObject(
        ObjectType.realmObject, CounterButton, 'CounterButton', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('value', RealmPropertyType.int),
      SchemaProperty('isIncrement', RealmPropertyType.bool),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
      SchemaProperty('updatedAt', RealmPropertyType.timestamp),
    ]);
  }
}
