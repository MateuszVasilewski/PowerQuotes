import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_quotes/animations/swipe_animation_gesture_detector.dart';
import 'package:power_quotes/bloc/swipe_cards/swipe_card_bloc.dart';
import 'package:power_quotes/bloc/timer_cubit/timer_cubit.dart';
import 'package:power_quotes/model/util/card_dto.dart';
import 'package:power_quotes/ui/shared_components/quote_card.dart';

class SwipeCardBlocBuilder extends StatelessWidget {

  const SwipeCardBlocBuilder({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwipeCardBloc, SwipeCardState>(
        buildWhen: (previous, current) =>
            current is CardsLoadingFailure || current is CardsUpdated,
        builder: (context, state) {
          if(state is CardsLoadingFailure) {
            return Container();
          }

          if(state is CardsUpdated){
            final stateQueue = Queue<CardDto>.from(state.queue);
            final lastOnStack = stateQueue.removeLast();

            return Stack(
              alignment: Alignment.center,
              children: [
                for (CardDto cardData in stateQueue)
                  QuoteCard(
                    key: UniqueKey(),
                    quote: cardData.quote,
                    color: cardData.color,
                    counterTime: 5,
                  ),
                SwipeAnimationGestureDetector(
                    key: UniqueKey(),
                    child: BlocBuilder<TimerCubit, int>(
                      builder: (context, state) => QuoteCard(
                        quote: lastOnStack.quote,
                        color: lastOnStack.color,
                        counterTime: state,
                      ),
                    ))
              ],
            );
          }
          return Container();
        });
  }
}
