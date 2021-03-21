import 'package:buy_tickets_design/widgets/tabs/tab_item.dart';
import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 24),
        TabItem(text: 'Nearby', isSelected: false),
        TabItem(text: 'Recent', isSelected: true),
        TabItem(text: 'Notice', isSelected: false),
      ],
    );
  }
}
