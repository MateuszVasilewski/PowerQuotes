// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class GeneratedQuoteData extends DataClass
    implements Insertable<GeneratedQuoteData> {
  final int id;
  final String quote;
  GeneratedQuoteData({@required this.id, @required this.quote});
  factory GeneratedQuoteData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return GeneratedQuoteData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      quote:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}quote']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || quote != null) {
      map['quote'] = Variable<String>(quote);
    }
    return map;
  }

  GeneratedQuoteCompanion toCompanion(bool nullToAbsent) {
    return GeneratedQuoteCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      quote:
          quote == null && nullToAbsent ? const Value.absent() : Value(quote),
    );
  }

  factory GeneratedQuoteData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return GeneratedQuoteData(
      id: serializer.fromJson<int>(json['id']),
      quote: serializer.fromJson<String>(json['quote']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'quote': serializer.toJson<String>(quote),
    };
  }

  GeneratedQuoteData copyWith({int id, String quote}) => GeneratedQuoteData(
        id: id ?? this.id,
        quote: quote ?? this.quote,
      );
  @override
  String toString() {
    return (StringBuffer('GeneratedQuoteData(')
          ..write('id: $id, ')
          ..write('quote: $quote')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, quote.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is GeneratedQuoteData &&
          other.id == this.id &&
          other.quote == this.quote);
}

class GeneratedQuoteCompanion extends UpdateCompanion<GeneratedQuoteData> {
  final Value<int> id;
  final Value<String> quote;
  const GeneratedQuoteCompanion({
    this.id = const Value.absent(),
    this.quote = const Value.absent(),
  });
  GeneratedQuoteCompanion.insert({
    this.id = const Value.absent(),
    @required String quote,
  }) : quote = Value(quote);
  static Insertable<GeneratedQuoteData> custom({
    Expression<int> id,
    Expression<String> quote,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (quote != null) 'quote': quote,
    });
  }

  GeneratedQuoteCompanion copyWith({Value<int> id, Value<String> quote}) {
    return GeneratedQuoteCompanion(
      id: id ?? this.id,
      quote: quote ?? this.quote,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (quote.present) {
      map['quote'] = Variable<String>(quote.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GeneratedQuoteCompanion(')
          ..write('id: $id, ')
          ..write('quote: $quote')
          ..write(')'))
        .toString();
  }
}

class $GeneratedQuoteTable extends GeneratedQuote
    with TableInfo<$GeneratedQuoteTable, GeneratedQuoteData> {
  final GeneratedDatabase _db;
  final String _alias;
  $GeneratedQuoteTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _quoteMeta = const VerificationMeta('quote');
  GeneratedTextColumn _quote;
  @override
  GeneratedTextColumn get quote => _quote ??= _constructQuote();
  GeneratedTextColumn _constructQuote() {
    return GeneratedTextColumn(
      'quote',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, quote];
  @override
  $GeneratedQuoteTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'generated_quote';
  @override
  final String actualTableName = 'generated_quote';
  @override
  VerificationContext validateIntegrity(Insertable<GeneratedQuoteData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('quote')) {
      context.handle(
          _quoteMeta, quote.isAcceptableOrUnknown(data['quote'], _quoteMeta));
    } else if (isInserting) {
      context.missing(_quoteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GeneratedQuoteData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return GeneratedQuoteData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $GeneratedQuoteTable createAlias(String alias) {
    return $GeneratedQuoteTable(_db, alias);
  }
}

class SavedQuoteData extends DataClass implements Insertable<SavedQuoteData> {
  final int id;
  final int color;
  final String quote;
  SavedQuoteData(
      {@required this.id, @required this.color, @required this.quote});
  factory SavedQuoteData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return SavedQuoteData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      color: intType.mapFromDatabaseResponse(data['${effectivePrefix}color']),
      quote:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}quote']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<int>(color);
    }
    if (!nullToAbsent || quote != null) {
      map['quote'] = Variable<String>(quote);
    }
    return map;
  }

  SavedQuoteCompanion toCompanion(bool nullToAbsent) {
    return SavedQuoteCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      quote:
          quote == null && nullToAbsent ? const Value.absent() : Value(quote),
    );
  }

  factory SavedQuoteData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return SavedQuoteData(
      id: serializer.fromJson<int>(json['id']),
      color: serializer.fromJson<int>(json['color']),
      quote: serializer.fromJson<String>(json['quote']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'color': serializer.toJson<int>(color),
      'quote': serializer.toJson<String>(quote),
    };
  }

  SavedQuoteData copyWith({int id, int color, String quote}) => SavedQuoteData(
        id: id ?? this.id,
        color: color ?? this.color,
        quote: quote ?? this.quote,
      );
  @override
  String toString() {
    return (StringBuffer('SavedQuoteData(')
          ..write('id: $id, ')
          ..write('color: $color, ')
          ..write('quote: $quote')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(color.hashCode, quote.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is SavedQuoteData &&
          other.id == this.id &&
          other.color == this.color &&
          other.quote == this.quote);
}

class SavedQuoteCompanion extends UpdateCompanion<SavedQuoteData> {
  final Value<int> id;
  final Value<int> color;
  final Value<String> quote;
  const SavedQuoteCompanion({
    this.id = const Value.absent(),
    this.color = const Value.absent(),
    this.quote = const Value.absent(),
  });
  SavedQuoteCompanion.insert({
    this.id = const Value.absent(),
    @required int color,
    @required String quote,
  })  : color = Value(color),
        quote = Value(quote);
  static Insertable<SavedQuoteData> custom({
    Expression<int> id,
    Expression<int> color,
    Expression<String> quote,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (color != null) 'color': color,
      if (quote != null) 'quote': quote,
    });
  }

  SavedQuoteCompanion copyWith(
      {Value<int> id, Value<int> color, Value<String> quote}) {
    return SavedQuoteCompanion(
      id: id ?? this.id,
      color: color ?? this.color,
      quote: quote ?? this.quote,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (quote.present) {
      map['quote'] = Variable<String>(quote.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SavedQuoteCompanion(')
          ..write('id: $id, ')
          ..write('color: $color, ')
          ..write('quote: $quote')
          ..write(')'))
        .toString();
  }
}

class $SavedQuoteTable extends SavedQuote
    with TableInfo<$SavedQuoteTable, SavedQuoteData> {
  final GeneratedDatabase _db;
  final String _alias;
  $SavedQuoteTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _colorMeta = const VerificationMeta('color');
  GeneratedIntColumn _color;
  @override
  GeneratedIntColumn get color => _color ??= _constructColor();
  GeneratedIntColumn _constructColor() {
    return GeneratedIntColumn(
      'color',
      $tableName,
      false,
    );
  }

  final VerificationMeta _quoteMeta = const VerificationMeta('quote');
  GeneratedTextColumn _quote;
  @override
  GeneratedTextColumn get quote => _quote ??= _constructQuote();
  GeneratedTextColumn _constructQuote() {
    return GeneratedTextColumn(
      'quote',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, color, quote];
  @override
  $SavedQuoteTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'saved_quote';
  @override
  final String actualTableName = 'saved_quote';
  @override
  VerificationContext validateIntegrity(Insertable<SavedQuoteData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color'], _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('quote')) {
      context.handle(
          _quoteMeta, quote.isAcceptableOrUnknown(data['quote'], _quoteMeta));
    } else if (isInserting) {
      context.missing(_quoteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SavedQuoteData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return SavedQuoteData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $SavedQuoteTable createAlias(String alias) {
    return $SavedQuoteTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $GeneratedQuoteTable _generatedQuote;
  $GeneratedQuoteTable get generatedQuote =>
      _generatedQuote ??= $GeneratedQuoteTable(this);
  $SavedQuoteTable _savedQuote;
  $SavedQuoteTable get savedQuote => _savedQuote ??= $SavedQuoteTable(this);
  GeneratedQuoteDao _generatedQuoteDao;
  GeneratedQuoteDao get generatedQuoteDao =>
      _generatedQuoteDao ??= GeneratedQuoteDao(this as Database);
  SavedQuoteDao _savedQuoteDao;
  SavedQuoteDao get savedQuoteDao =>
      _savedQuoteDao ??= SavedQuoteDao(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [generatedQuote, savedQuote];
}
