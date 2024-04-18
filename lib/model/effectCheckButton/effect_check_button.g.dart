// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'effect_check_button.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class EffectCheckButton extends $EffectCheckButton
    with RealmEntity, RealmObjectBase, RealmObject {
  EffectCheckButton(
    ObjectId id,
    String description,
    int limit,
    String period,
    int order,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'limit', limit);
    RealmObjectBase.set(this, 'period', period);
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
  String get period => RealmObjectBase.get<String>(this, 'period') as String;
  @override
  set period(String value) => RealmObjectBase.set(this, 'period', value);

  @override
  int get order => RealmObjectBase.get<int>(this, 'order') as int;
  @override
  set order(int value) => RealmObjectBase.set(this, 'order', value);

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
      SchemaProperty('period', RealmPropertyType.string),
      SchemaProperty('order', RealmPropertyType.int),
    ]);
  }
}
