import 'package:list_realm_poc/src/sample_feature/sample_item_model.dart';
import 'package:realm/realm.dart';

class DeleteItemBloc {
  final SampleItemModel item;
  final Realm _realm;

  DeleteItemBloc(this.item) : _realm = item.realm;

  void delete() {
    _realm.write(() => _realm.delete(item));
  }
}
