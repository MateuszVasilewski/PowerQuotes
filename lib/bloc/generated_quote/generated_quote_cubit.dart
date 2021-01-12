import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:power_quotes/model/database/database.dart';
import 'package:power_quotes/model/repository.dart';

part 'generated_quote_state.dart';

class GeneratedQuoteCubit extends Cubit<GeneratedQuoteState> {
  final Repository _repository;

  GeneratedQuoteCubit(this._repository) : super(GeneratedQuoteInitial());

  void saveQuote(String quote) {
    try{
      emit(SavingQuote());
      _repository.addGeneratedQuoteToDatabase(
        GeneratedQuoteCompanion.insert(quote: quote));
      emit(QuoteSaved());
    }catch(ex){
      emit(QuoteNotSaved());
    }
  }
}
