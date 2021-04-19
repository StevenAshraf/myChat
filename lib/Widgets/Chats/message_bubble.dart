import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(
    this.message,
    this.isME,
    {this.key}
  );

  final Key key;
  final String message;
  final bool isME;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isME? MainAxisAlignment.end: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: isME? Colors.grey[300]: Theme.of(context).accentColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: !isME? Radius.circular(0) : Radius.circular(12),
              bottomRight: isME? Radius.circular(0) : Radius.circular(12),
            ),
          ),
          width: 140,
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          margin: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          child: Text(
            message,
            style:
                TextStyle(color: isME ? Colors.black : Theme.of(context).accentTextTheme.title.color),
          ),
        ),
      ],
    );
  }
}
