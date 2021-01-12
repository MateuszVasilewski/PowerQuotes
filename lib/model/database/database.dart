import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:power_quotes/model/database/dao/generated_quote.dart';
import 'package:power_quotes/model/database/dao/saved_quote.dart';
import 'package:power_quotes/util/const.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [GeneratedQuote, SavedQuote], daos: [GeneratedQuoteDao, SavedQuoteDao])
class Database extends _$Database {

  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) {
      final migration = m.createAll();
      batch((batch) => batch.insertAll(generatedQuote, prePopulateItems));
      return migration;
    }
  );
}