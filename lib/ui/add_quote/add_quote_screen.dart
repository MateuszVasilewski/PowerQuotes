import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_quotes/bloc/generated_quote/generated_quote_cubit.dart';

import 'components/saving_quote_listener.dart';
import 'components/top_part_add_quote.dart';

class AddQuoteScreen extends StatefulWidget {

  const AddQuoteScreen({Key key}): super(key: key);

  @override
  _AddQuoteScreenState createState() => _AddQuoteScreenState();
}

class _AddQuoteScreenState extends State<AddQuoteScreen> {
  GeneratedQuoteCubit _cubit;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cubit = GeneratedQuoteCubit(RepositoryProvider.of(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SavingQuoteListener(
          cubit: _cubit,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(width: double.infinity, child: TopPartAddQuote()),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                    child: Text(
                      "Insert a quote here so that it's added to the random pool",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      cursorColor: Theme.of(context).accentColor,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        fillColor: Theme.of(context).primaryColorLight,
                        filled: true,
                      ),
                      controller: _controller,
                      onSubmitted: (String str) {
                        _cubit.saveQuote(str);
                        _controller.clear();
                      },
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: FlatButton(
                      onPressed: () {
                        _cubit.saveQuote(_controller.text);
                        _controller.clear();
                      },
                      child: Text(
                        "Save",
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _cubit.close();
    _controller.dispose();
  }
}
