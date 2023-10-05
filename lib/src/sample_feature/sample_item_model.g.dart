// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_item_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class SampleItemModel extends _SampleItemModel
    with RealmEntity, RealmObjectBase, RealmObject {
  SampleItemModel(
    ObjectId id,
    int count,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'count', count);
  }

  SampleItemModel._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  int get count => RealmObjectBase.get<int>(this, 'count') as int;
  @override
  set count(int value) => RealmObjectBase.set(this, 'count', value);

  @override
  Stream<RealmObjectChanges<SampleItemModel>> get changes =>
      RealmObjectBase.getChanges<SampleItemModel>(this);

  @override
  SampleItemModel freeze() =>
      RealmObjectBase.freezeObject<SampleItemModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(SampleItemModel._);
    return const SchemaObject(
        ObjectType.realmObject, SampleItemModel, 'SampleItemModel', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('count', RealmPropertyType.int),
    ]);
  }
}
