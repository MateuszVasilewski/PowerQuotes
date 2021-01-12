import 'package:moor/moor.dart';
import 'package:power_quotes/model/database/database.dart';

part 'generated_quote.g.dart';

class GeneratedQuote extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get quote => text()();
}

@UseDao(tables: [GeneratedQuote])
class GeneratedQuoteDao
    extends DatabaseAccessor<Database>
    with _$GeneratedQuoteDaoMixin {
  GeneratedQuoteDao(Database database) : super(database);

  Future<void> insertOne(Insertable<GeneratedQuoteData> entry) => into(generatedQuote).insert(entry);

  Future<List<GeneratedQuoteData>> getAll() => select(generatedQuote).get();
}
