import 'package:flutter/material.dart';

class NavigationCircle extends StatelessWidget {
  final IconData icon;

  const NavigationCircle({@required this.icon, Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: const BorderRadius.all(Radius.circular(100))),
      child: Icon(icon,
          color: Theme.of(context).accentColor,),
    );
  }
}
