import 'package:realm/realm.dart';
import 'sample_item_model.dart';

class SampleItemController {
  final Realm _realm;

  SampleItemController(this._realm);

  RealmResults<SampleItemModel> getAllItems() {
    return _realm.all<SampleItemModel>();
  }

  void addNewItem(int count) {
    _realm.write(() => _realm.add(SampleItemModel(ObjectId(), count)));
  }

  void deleteItem(SampleItemModel item) {
    _realm.write(() => _realm.delete(item));
  }
}
