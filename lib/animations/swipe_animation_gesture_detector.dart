import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_quotes/bloc/swipe_cards/swipe_card_bloc.dart';
import 'package:power_quotes/bloc/timer_cubit/timer_cubit.dart';

class SwipeAnimationGestureDetector extends StatefulWidget {
  final Widget child;
  final double cardSnap;

  const SwipeAnimationGestureDetector(
      {@required this.child, this.cardSnap = 100, Key key}): super(key: key);

  @override
  _SwipeAnimationGestureDetectorState createState() =>
      _SwipeAnimationGestureDetectorState();
}

class _SwipeAnimationGestureDetectorState
    extends State<SwipeAnimationGestureDetector> with TickerProviderStateMixin {
  AnimationController _controller;
  Offset startPosition;
  Offset lastPosition;
  int _direction = 1;
  double dxRatio = 0.5;
  double dyRatio = 0.2;
  double dzRatio = 0.3;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        if(_direction == 1) {
          BlocProvider.of<SwipeCardBloc>(context).add(SaveCard());
        } else {
          BlocProvider.of<SwipeCardBloc>(context).add(RemoveCard());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocListener<TimerCubit, int>(
      listener: (context, state) {
        if(state == 0) {
          _direction = -1;
          dxRatio = 1;
          _controller.fling(velocity: 0.01);
          BlocProvider.of<TimerCubit>(context).resetTimer();
        }
      },
      child: GestureDetector(
        onHorizontalDragStart: (details) => _onHorizontalDragStart(details, context),
        onHorizontalDragUpdate: _onHorizontalDragUpdate,
        onHorizontalDragEnd: (details) => _onHorizontalDragEnd(details, context),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            final double slide = size.width * _controller.value;
            return Transform(
              alignment: FractionalOffset.topCenter,
              transform: Matrix4.identity()
                ..translate(_direction * slide * dxRatio, -(_direction * slide * dyRatio).abs())
                ..rotateZ( -1 * _direction * _controller.value * dzRatio),
              child: widget.child
            );
          },
        ),
      ),
    );
  }

  void _onHorizontalDragStart(DragStartDetails details, BuildContext context) {
    BlocProvider.of<TimerCubit>(context).stopTimer();
    dxRatio = 0.5;
    startPosition = details.globalPosition;
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    if (_controller.value == 0) {
      if (details.primaryDelta < 0) {
        _direction = -1;
      } else {
        _direction = 1;
      }
    }

    final double delta =
        _direction * details.primaryDelta / MediaQuery.of(context).size.width;
    _controller.value += delta;
    lastPosition = details.globalPosition;
  }

  void _onHorizontalDragEnd(DragEndDetails details, BuildContext context) {
    final double delta = (startPosition.dx - lastPosition.dx).abs();
    if(delta > widget.cardSnap || details.velocity.pixelsPerSecond.dx.abs() > 1000){
      dxRatio = 1;
      final double visualVelocity = details.velocity.pixelsPerSecond.dx / 10000;
      _controller.fling(velocity: visualVelocity.abs());
    }else{
      _controller.reverse(from: _controller.value);
    }
    BlocProvider.of<TimerCubit>(context).resetTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
