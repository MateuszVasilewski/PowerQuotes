part of 'swipe_card_bloc.dart';

@immutable
abstract class SwipeCardEvent {}

class LoadCards extends SwipeCardEvent{}

class RemoveCard extends SwipeCardEvent{}

class SaveCard extends SwipeCardEvent{}


