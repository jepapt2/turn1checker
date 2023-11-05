// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'effectCheckButton.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class EffectCheckButton extends $EffectCheckButton
    with RealmEntity, RealmObjectBase, RealmObject {
  EffectCheckButton(
    ObjectId id,
    String description,
    int limit,
    DateTime createdAt,
    DateTime updatedAt, {
    ButtonsOrder? order,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'limit', limit);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'updatedAt', updatedAt);
    RealmObjectBase.set(this, 'order', order);
  }

  EffectCheckButton._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get description =>
      RealmObjectBase.get<String>(this, 'description') as String;
  @override
  set description(String value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  int get limit => RealmObjectBase.get<int>(this, 'limit') as int;
  @override
  set limit(int value) => RealmObjectBase.set(this, 'limit', value);

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
  ButtonsOrder? get order =>
      RealmObjectBase.get<ButtonsOrder>(this, 'order') as ButtonsOrder?;
  @override
  set order(covariant ButtonsOrder? value) =>
      RealmObjectBase.set(this, 'order', value);

  @override
  Stream<RealmObjectChanges<EffectCheckButton>> get changes =>
      RealmObjectBase.getChanges<EffectCheckButton>(this);

  @override
  EffectCheckButton freeze() =>
      RealmObjectBase.freezeObject<EffectCheckButton>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(EffectCheckButton._);
    return const SchemaObject(
        ObjectType.realmObject, EffectCheckButton, 'EffectCheckButton', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('description', RealmPropertyType.string),
      SchemaProperty('limit', RealmPropertyType.int),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
      SchemaProperty('updatedAt', RealmPropertyType.timestamp),
      SchemaProperty('order', RealmPropertyType.object,
          optional: true, linkTarget: 'ButtonsOrder'),
    ]);
  }
}
