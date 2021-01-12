import 'package:flutter/material.dart';
import 'package:power_quotes/ui/shared_components/navigation_circle.dart';

class TopNavigationComponent extends StatelessWidget {
  final String arrowTag;
  final IconData arrowIcon;
  final String circleTag;
  final IconData circleIcon;
  final String routeString;

  const TopNavigationComponent(
      {@required this.arrowTag,
      @required this.arrowIcon,
      @required this.circleTag,
      @required this.circleIcon,
      @required this.routeString,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: Hero(
            tag: arrowTag,
            child: Icon(
              arrowIcon,
              size: 40,
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
        Hero(
            tag: circleTag,
            child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, routeString),
                child: NavigationCircle(
                  icon: circleIcon,
                )))
      ],
    );
  }
}
