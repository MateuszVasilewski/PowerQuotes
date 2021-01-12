import 'package:flutter/material.dart';
import 'package:power_quotes/ui/shared_components/navigation_circle.dart';

class TopPartAddQuote extends StatelessWidget {

  const TopPartAddQuote({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "/home"),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            child: Hero(
              tag: "backFromAddQuote",
              child: Icon(
                Icons.keyboard_arrow_left,
                size: 40,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          const Hero(
            tag: "quote",
            child: NavigationCircle(
              icon: Icons.format_quote,
            ),
          ),
        ],
      ),
    );
  }
}
