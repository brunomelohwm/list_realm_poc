import 'package:realm/realm.dart';

part 'sample_item_model.g.dart';

@RealmModel()
class _SampleItemModel {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late int count;
}
