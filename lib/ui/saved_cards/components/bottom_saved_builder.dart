import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_quotes/bloc/saved_cards/saved_cards_bloc.dart';
import 'package:power_quotes/model/util/card_dto.dart';
import 'package:power_quotes/ui/shared_components/quote_card.dart';
class BottomSavedBuilder extends StatefulWidget {

  const BottomSavedBuilder({Key key}): super(key: key);

  @override
  _BottomSavedBuilderState createState() => _BottomSavedBuilderState();
}

class _BottomSavedBuilderState extends State<BottomSavedBuilder> {
  SavedCardsBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = SavedCardsBloc(RepositoryProvider.of(context))..add(LoadSavedCards());
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedCardsBloc, SavedCardsState>(
        cubit: _bloc,
        builder: (context, state) {
          if (state is SavedCardsInitial || state is SavedCardsLoading) {
            return Container();
          }

          if(state is SavedCardsNotLoaded){
            return Center(
              child: Column(
                children: [
                  Text("Something went wrong, wanna try again?", style: Theme.of(context).textTheme.bodyText2,),
                  GestureDetector(
                    onTap: () => _bloc.add(LoadSavedCards()),
                    child: Icon(
                      Icons.refresh,
                      size: 50,
                      color: Theme.of(context).accentColor,
                    ),
                  )
                ],
              ),
            );
          }

          final List<CardDto> quotes = (state as SavedCardsLoaded).savedQuotes;

          if (quotes.isEmpty) {
            return Center(
              child: Text("Your list is empty :c", style: Theme.of(context).textTheme.bodyText2,),
            );
          } else {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: PageView.builder(
                controller: PageController(
                  viewportFraction: 0.78
                ),
                itemCount: quotes.length,
                itemBuilder: (BuildContext context, int index) =>
                    Align(
                        child: QuoteCard(quote: quotes[index].quote, color: quotes[index].color,)),
              ),
            );
          }
        }
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}
