import 'package:buy_tickets_design/models/event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandedEventItem extends StatelessWidget {
  final double? topMargin;
  final double? leftMargin;
  final double? height;
  final double? borderRadius;
  final bool isVisible;
  final Event event;

  const ExpandedEventItem(
      {Key? key,
      required this.borderRadius,
      required this.event,
      required this.height,
      required this.isVisible,
      required this.leftMargin,
      required this.topMargin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topMargin,
      left: leftMargin,
      right: 0,
      height: height,
      child: AnimatedOpacity(
        opacity: isVisible ? 1 : 0,
        duration: Duration(milliseconds: 200),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius!),
            color: Colors.white,
          ),
          padding: EdgeInsets.only(left: height ?? 0).add(EdgeInsets.all(8)),
          child: _buildContent(event),
        ),
      ),
    );
  }

  Widget _buildContent(Event event) {
    return Column(
      children: <Widget>[
        Text(event.title, style: TextStyle(fontSize: 16)),
        SizedBox(height: 8),
        Row(
          children: <Widget>[
            Text(
              '1 ticket',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(width: 8),
            Text(
              event.date,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Spacer(),
        Row(
          children: <Widget>[
            Icon(
              Icons.place,
              color: Colors.grey.shade600,
              size: 16,
            ),
            Text(
              'Science Park 10 25A',
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
