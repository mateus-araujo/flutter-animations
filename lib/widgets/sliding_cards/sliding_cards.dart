import 'package:buy_tickets_design/models/event.dart';
import 'package:buy_tickets_design/widgets/sliding_cards/sliding_card.dart';
import 'package:flutter/material.dart';

class SlidingCardsView extends StatefulWidget {
  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  PageController _pageController = PageController(viewportFraction: 0.8);
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: PageView.builder(
        itemCount: events.length,
        controller: _pageController,
        onPageChanged: (value) => setState(() => currentPage = value),
        itemBuilder: (context, index) =>
            _buildSlidingCard(events[index], index),
      ),
    );
  }

  Widget _buildSlidingCard(Event event, int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double offset = 0;
        if (_pageController.position.haveDimensions)
          offset = _pageController.page! - index;

        return SlidingCard(
          name: event.title,
          date: event.date,
          assetName: event.assetName,
          offset: offset,
        );
      },
    );
  }
}
