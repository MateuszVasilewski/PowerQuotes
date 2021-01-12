import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  final String quote;
  final Color color;
  final int counterTime;

  const QuoteCard(
      {@required this.quote, @required this.color, this.counterTime, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.6,
      width: size.width * 0.7,
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(50))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (counterTime != null)
              Positioned(
                top: 20,
                child: Text(
                    counterTime.toString(),
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            Center(
              child: Text(
                quote,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
