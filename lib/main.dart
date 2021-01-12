import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_quotes/model/repository.dart';
import 'package:power_quotes/ui/add_quote/add_quote_screen.dart';
import 'package:power_quotes/ui/homepage/homepage.dart';
import 'package:power_quotes/ui/saved_cards/saved_cards_screen.dart';

import 'model/database/database.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => Repository(Database()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
            accentColor: Colors.black,
            backgroundColor: Colors.white,
            primarySwatch: Colors.blue,
            primaryColorLight: const Color(0xfff4a261),
            textTheme: const TextTheme(
                bodyText2: TextStyle(
                    fontFamily: 'Indie',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    ),
                headline5: TextStyle(
                    fontFamily: 'Indie',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                button: TextStyle(
                    fontFamily: 'Indie',
                    fontSize: 16,
                    color: Colors.black
                ))),

        darkTheme: ThemeData(
            backgroundColor: const Color(0xff000000),
            accentColor: const Color(0xffffffff),
            primarySwatch: Colors.blue,
            primaryColorLight: const Color(0xfff4a261),
            textTheme: const TextTheme(
                bodyText2: TextStyle(
                    fontFamily: 'Indie',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
                headline5: TextStyle(
                    fontFamily: 'Indie',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              button: TextStyle(
                  fontFamily: 'Indie',
                  fontSize: 16,
                  color: Colors.white
              )
            ),

        ),
        routes: {
          '/home': (_) => const HomePage(),
          '/saved': (_) => const SavedCardsScreen(),
          '/addQuote': (_) => const AddQuoteScreen()
        },
        home: const HomePage(),
      ),
    );
  }
}
