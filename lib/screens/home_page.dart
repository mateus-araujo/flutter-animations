import 'package:buy_tickets_design/widgets/header.dart';
import 'package:buy_tickets_design/widgets/sliding_cards/sliding_cards.dart';
import 'package:buy_tickets_design/widgets/tabs/tabs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 8),
                Header(),
                SizedBox(height: 40),
                Tabs(),
                SizedBox(height: 8),
                SlidingCardsView(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
