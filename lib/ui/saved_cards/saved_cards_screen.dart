import 'package:flutter/material.dart';
import 'package:power_quotes/ui/saved_cards/components/bottom_saved_builder.dart';
import 'package:power_quotes/ui/saved_cards/components/top_part_saved.dart';
class SavedCardsScreen extends StatelessWidget {

  const SavedCardsScreen({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: const TopPartSaved()),
            const Spacer(),
            const BottomSavedBuilder(),
            const Spacer(flex: 3)
          ],
        ),
      ),
    );
  }
}
