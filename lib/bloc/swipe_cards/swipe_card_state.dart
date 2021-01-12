part of 'swipe_card_bloc.dart';

@immutable
abstract class SwipeCardState extends Equatable{
  const SwipeCardState();

  @override
  List<Object> get props => <Object>[];
}

class CardInitial extends SwipeCardState {
  const CardInitial(): super();
}

class CardsInitiallyLoading extends SwipeCardState{
  const CardsInitiallyLoading(): super();
}

class CardsAvailable extends SwipeCardState{
  final Queue<CardDto> queue;

  const CardsAvailable(this.queue): super();

  @override
  List<Object> get props => <Object>[queue];
}

class CardsUpdating extends SwipeCardState{
  const CardsUpdating(): super();
}

class CardDeleted extends SwipeCardState{
  const CardDeleted(): super();
}

class CardSaveSuccessful extends SwipeCardState{
  const CardSaveSuccessful(): super();
}

class CardSaveFailure extends SwipeCardState{
  const CardSaveFailure(): super();
}

class CardsUpdated extends CardsAvailable{
  const CardsUpdated(Queue<CardDto> queue): super(queue);
}

class CardsLoadingFailure extends CardsAvailable{
  const CardsLoadingFailure(Queue<CardDto> queue): super(queue);
}

