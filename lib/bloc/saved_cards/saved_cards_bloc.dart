import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:power_quotes/model/database/database.dart';
import 'package:power_quotes/model/repository.dart';
import 'package:power_quotes/model/util/card_dto.dart';

part 'saved_cards_event.dart';

part 'saved_cards_state.dart';

class SavedCardsBloc extends Bloc<SavedCardsEvent, SavedCardsState> {
  final Repository _repository;

  SavedCardsBloc(this._repository) : super(SavedCardsInitial());

  @override
  Stream<SavedCardsState> mapEventToState(SavedCardsEvent event,) async* {
    if (event is LoadSavedCards) yield* _initializeSavedCardsBloc();
  }

  Stream<SavedCardsState> _initializeSavedCardsBloc() async* {
    try {
      yield SavedCardsLoading();
      final List<SavedQuoteData> databaseQuotes = await _repository.savedQuotes;
      final List<CardDto> savedQuotes = databaseQuotes
          .map((e) => CardDto(quote: e.quote, color: Color(e.color), id: e.id))
          .toList();

      yield SavedCardsLoaded(savedQuotes);
    }catch(ex){
      yield SavedCardsNotLoaded();
    }
  }
}
