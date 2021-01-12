import 'dart:collection';
import 'dart:math';

import 'package:power_quotes/model/database/database.dart';
import 'package:power_quotes/model/util/card_dto.dart';
import 'package:power_quotes/util/const.dart';

class Repository {
  final Database database;
  final rand = Random.secure();

  Repository(this.database);

  Future<List<GeneratedQuoteData>> get generatedQuotes =>
      database.generatedQuoteDao.getAll();

  Future<List<SavedQuoteData>> get savedQuotes =>
      database.savedQuoteDao.getAll();

  Future<bool> saveQuote(SavedQuoteCompanion data) => database.savedQuoteDao
      .insertOne(data)
      .then((value) => true)
      .catchError((value) => false);

  Future<void> addGeneratedQuoteToDatabase(GeneratedQuoteCompanion data) =>
      database.generatedQuoteDao.insertOne(data);

  Future<Queue<CardDto>> loadCards(Queue<CardDto> queue) async {
    final Queue<CardDto> resultQueue = Queue.from(queue);
    final quotes = await generatedQuotes;

    while (resultQueue.length != 2) {
      resultQueue.addFirst(CardDto(
          color: cardColors[rand.nextInt(cardColors.length)],
          quote: quotes[rand.nextInt(quotes.length)].quote));
    }
    return resultQueue;
  }
}
