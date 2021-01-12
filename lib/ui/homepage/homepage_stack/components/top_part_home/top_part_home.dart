import 'package:flutter/material.dart';
import 'package:power_quotes/ui/homepage/homepage_stack/components/top_part_home/components/rive_stack.dart';

import 'components/top_navigation_component.dart';

class TopPartHome extends StatelessWidget {
  const TopPartHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        TopNavigationComponent(
            arrowTag: "backFromFavorite",
            arrowIcon: Icons.keyboard_arrow_left,
            circleTag: 'favorite',
            circleIcon: Icons.favorite_border,
            routeString: '/saved'),
        SizedBox(width: 70, height: 70, child: RiveStack()),
        TopNavigationComponent(
            arrowTag: "backFromAddQuote",
            arrowIcon: Icons.keyboard_arrow_left,
            circleTag: 'quote',
            circleIcon: Icons.format_quote_outlined,
            routeString: '/addQuote')
      ],
    );
  }
}
