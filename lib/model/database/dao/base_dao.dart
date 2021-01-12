import 'package:moor/moor.dart';

abstract class BaseDao<T extends Table, DC extends DataClass, GDB extends GeneratedDatabase>
    extends DatabaseAccessor<GDB>{

  BaseDao(this.generatedDatabase, this.table): super(generatedDatabase);

  final TableInfo<T, DC> table;
  final GDB generatedDatabase;

  Future<void> insertOne(Insertable<DC> entry) => into(table).insert(entry);

  Future<List<DC>> getAll() => select(table).get();
}