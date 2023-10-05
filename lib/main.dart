import 'package:flutter/material.dart';
import 'package:list_realm_poc/src/sample_feature/sample_item_model.dart';
import 'package:realm/realm.dart';
import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  final app = App(AppConfiguration('poc-app-ifovg'));
  final user = app.currentUser ?? await app.logIn(Credentials.anonymous());
  final realm =
      Realm(Configuration.flexibleSync(user, [SampleItemModel.schema]));

  realm.subscriptions.update((mutableSubscriptions) {
    mutableSubscriptions.add(realm.all<SampleItemModel>());
  });

  final allItems = realm.all<SampleItemModel>();
  final settingsController = SettingsController(SettingsService());

  await settingsController.loadSettings();

  runApp(MyApp(
    settingsController: settingsController,
    items: allItems,
  ));
}
