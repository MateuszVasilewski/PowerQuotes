import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:power_quotes/model/database/database.dart';
import 'package:power_quotes/model/repository.dart';
import 'package:power_quotes/model/util/card_dto.dart';
part 'swipe_card_event.dart';

part 'swipe_card_state.dart';

class SwipeCardBloc extends Bloc<SwipeCardEvent, SwipeCardState> {
  final Repository _repository;

  SwipeCardBloc(this._repository,
      {SwipeCardState initialState = const CardInitial()})
      : super(initialState);

  @override
  Stream<SwipeCardState> mapEventToState(
    SwipeCardEvent event,
  ) async* {
    if (event is RemoveCard) yield* _removeCard();
    if (event is SaveCard) yield* _saveCard();
    if (event is LoadCards) yield* _loadInitialCards();
  }

  Stream<SwipeCardState> _removeCard() async* {
    final Queue<CardDto> queue = (state as CardsAvailable).queue..removeLast();
    yield const CardDeleted();
    try{
      yield const CardsUpdating();
      yield CardsUpdated(await _repository.loadCards(queue));
    }catch(ex){
      yield CardsLoadingFailure(queue);
    }
  }

  Stream<SwipeCardState> _saveCard() async* {
    final Queue<CardDto> queue = (state as CardsAvailable).queue;
    final CardDto cardToSave = queue.removeLast();

    final bool quoteSaved = await _repository.saveQuote(SavedQuoteCompanion.insert(
        quote: cardToSave.quote, color: cardToSave.color.value));
    if(quoteSaved) {
      yield const CardSaveSuccessful();
    } else {
      yield const CardSaveFailure();
    }

    yield const CardsUpdating();
    try{
      yield CardsUpdated(await _repository.loadCards(queue));
    }catch(ex){
      yield CardsLoadingFailure(queue);
    }
  }

  Stream<SwipeCardState> _loadInitialCards() async* {
    try {
      yield const CardsInitiallyLoading();
      yield CardsUpdated(await _repository.loadCards(Queue()));
    } catch (ex) {
      yield const CardsLoadingFailure(null);
    }
  }
}
