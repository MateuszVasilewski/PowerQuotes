part of 'saved_cards_bloc.dart';

@immutable
abstract class SavedCardsState extends Equatable{

  @override
  List<Object> get props => <Object>[];
}

class SavedCardsInitial extends SavedCardsState {}

class SavedCardsLoading extends SavedCardsState {}

class SavedCardsLoaded extends SavedCardsState {
  final List<CardDto> savedQuotes;

  SavedCardsLoaded(this.savedQuotes);
}

class SavedCardsNotLoaded extends SavedCardsState {

}
