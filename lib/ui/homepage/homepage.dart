import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_quotes/bloc/swipe_cards/swipe_card_bloc.dart';
import 'package:power_quotes/bloc/timer_cubit/timer_cubit.dart';

import 'homepage_stack/homepage_column.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key key}): super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return BlocProvider(
      lazy: false,
      create: (context) => SwipeCardBloc(RepositoryProvider.of(context))..add(LoadCards()),
      child: BlocProvider(
        lazy: false,
        create: (context) => TimerCubit(5)..startTimer(),
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: SafeArea(
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: const HomepageStack()
            ),
          ),
        ),
      ),
    );
  }
}
