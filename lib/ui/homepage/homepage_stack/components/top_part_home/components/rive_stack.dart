import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_quotes/bloc/swipe_cards/swipe_card_bloc.dart';

class RiveStack extends StatefulWidget {

  const RiveStack({Key key}): super(key: key);

  @override
  _RiveStackState createState() => _RiveStackState();
}

class _RiveStackState extends State<RiveStack> {
  String _removeName = "";
  String _saveName = "";

  @override
  Widget build(BuildContext context) {
    return BlocListener<SwipeCardBloc, SwipeCardState>(
      listenWhen: (previous, current) =>
          current is CardSaveSuccessful || current is CardDeleted,
      listener: (context, state) => manageNotification(state),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Visibility(
            visible: _removeName == "Error",
            child: FlareActor("assets/animations/delete.flr",
                animation: _removeName,
                callback: (animation) => setState(() {
                      _removeName = "";
                    })),
          ),
          Visibility(
            visible: _saveName == "Like heart",
            child: FlareActor("assets/animations/save.flr",
                animation: _saveName,
                callback: (animation) => setState(() {
                      _saveName = "";
                    })),
          )
        ],
      ),
    );
  }

  void manageNotification(SwipeCardState state) {
    setState(() {
      _saveName = "";
      _removeName = "";
    });
    Future.delayed(const Duration(milliseconds: 1), (){
      if (state is CardSaveSuccessful) {
        setState(() {
          _saveName = "Like heart";
        });
      }
      if (state is CardDeleted) {
        setState(() {
          _removeName = "Error";
        });
      }
    });
  }
}
