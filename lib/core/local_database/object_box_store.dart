import 'package:objectbox/objectbox.dart';
import 'package:path/path.dart' as p show join;
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;
import 'package:sottie_flutter/core/local_database/objectbox.g.dart'
    show openStore;

final class ObjectBoxStore {
  static final ObjectBoxStore _instance = ObjectBoxStore._();

  factory ObjectBoxStore() => _instance;

  ObjectBoxStore._();

  late final Store _store;

  Future<void> initObjectBox() async {
    final docsDir = await getApplicationDocumentsDirectory();
    _store = await openStore(directory: p.join(docsDir.path, "in_chat_db"));
  }

  Box<T> getBox<T>() {
    return _store.box<T>();
  }
}
