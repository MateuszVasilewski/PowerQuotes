import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_quotes/bloc/generated_quote/generated_quote_cubit.dart';

class SavingQuoteListener extends StatelessWidget {
  final Widget child;
  final GeneratedQuoteCubit cubit;

  const SavingQuoteListener({@required this.child, @required this.cubit, Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<GeneratedQuoteCubit, GeneratedQuoteState>(
      cubit: cubit,
      listenWhen: (previous, current) =>
      current is QuoteSaved || current is QuoteNotSaved,
      listener: (BuildContext context, GeneratedQuoteState state) {
        if (state is QuoteSaved) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Quote successfuly added"),
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Something went wrong"),
          ));
        }
      },
      child: child
    );
  }
}
