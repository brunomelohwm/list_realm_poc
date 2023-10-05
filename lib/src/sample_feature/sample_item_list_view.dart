import 'package:flutter/material.dart';
import 'package:list_realm_poc/src/sample_feature/delete_item_bloc.dart';
import 'package:realm/realm.dart';
import '../settings/settings_view.dart';
import 'sample_item_model.dart';
import 'sample_item_details_view.dart';

class ListBloc {
  final RealmResults<SampleItemModel> items;
  final Realm _realm;

  ListBloc(this.items) : _realm = items.realm;

  void addNewItem() {
    _realm.write(() => _realm
        .add(SampleItemModel(ObjectId(), 1 + (items.lastOrNull?.count ?? 0))));
  }
}

class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    super.key,
    required this.bloc,
  });

  final ListBloc bloc;

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: bloc.addNewItem,
        child: const Icon(
          Icons.add,
        ),
      ),
      body: StreamBuilder(
          stream: bloc.items.changes,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              restorationId: 'sampleItemListView',
              itemCount: bloc.items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = bloc.items[index];

                return SampleItemTile(bloc: DeleteItemBloc(item));
              },
            );
          }),
    );
  }
}

class SampleItemTile extends StatelessWidget {
  const SampleItemTile({
    super.key,
    required this.bloc,
  });

  final DeleteItemBloc bloc;

  @override
  Widget build(BuildContext context) {
    final item = bloc.item;
    return Dismissible(
      key: ValueKey(item.id),
      background: Container(color: Colors.red),
      onDismissed: (direction) => bloc.delete(),
      child: ListTile(
          title: Text('SampleItem ${item.count}'),
          leading: const CircleAvatar(
            foregroundImage: AssetImage('assets/images/flutter_logo.png'),
          ),
          onTap: () {
            Navigator.restorablePushNamed(
              context,
              SampleItemDetailsView.routeName,
            );
          }),
    );
  }
}
