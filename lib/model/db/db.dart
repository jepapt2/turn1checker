import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../decks.dart';

part 'db.g.dart';

@DriftDatabase(tables: [Decks])
class Database extends _$Database {
  //4
  Database() : super(_openConnection()); //追加

  //5
  @override //追加
  int get schemaVersion => 1; //追加

  // @override
  // MigrationStrategy get migration {
  //   return MigrationStrategy(
  //     onCreate: (Migrator m) async {
  //       await m.createAll();
  //     },
  //   );
  // }
}

//6
//以下追加
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
    return NativeDatabase(file);
  });
}
