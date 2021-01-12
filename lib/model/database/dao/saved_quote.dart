import 'package:moor/moor.dart';
import 'package:power_quotes/model/database/database.dart';
part 'saved_quote.g.dart';

class SavedQuote extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get color => integer()();
  TextColumn get quote => text()();
}

@UseDao(tables: [SavedQuote])
class SavedQuoteDao
    extends DatabaseAccessor<Database>
    with _$SavedQuoteDaoMixin {
  SavedQuoteDao(Database database) : super(database);

  Future<void> insertOne(Insertable<SavedQuoteData> entry) => into(savedQuote).insert(entry);

  Future<List<SavedQuoteData>> getAll() => select(savedQuote).get();
}
