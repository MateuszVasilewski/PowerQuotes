import 'package:flutter/material.dart';
import 'package:power_quotes/ui/homepage/homepage_stack/components/swipe_card_bloc_builder.dart';
import 'package:power_quotes/ui/homepage/homepage_stack/components/top_part_home/top_part_home.dart';

class HomepageStack extends StatelessWidget {

  const HomepageStack({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        children: const [
          TopPartHome(),
          Spacer(),
          SwipeCardBlocBuilder(),
          Spacer(flex: 2,)
        ],
      ),
    );
  }
}
