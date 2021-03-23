import 'dart:math' as math;
import 'dart:ui';

import 'package:buy_tickets_design/models/event.dart';
import 'package:buy_tickets_design/widgets/exhibition_bottom_sheet/menu_button.dart';
import 'package:buy_tickets_design/widgets/exhibition_bottom_sheet/sheet_header.dart';
import 'package:flutter/material.dart';

const double minHeight = 120;

const double iconStartSize = 44;
const double iconEndSize = 120;

const double iconStartMarginTop = 36;
const double iconEndMarginTop = 80;

const double iconsVerticalSpacing = 24;
const double iconsHorizontalSpacing = 16;

class ExhibitionBottomSheet extends StatefulWidget {
  @override
  _ExhibitionBottomSheetState createState() => _ExhibitionBottomSheetState();
}

class _ExhibitionBottomSheetState extends State<ExhibitionBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  double get maxHeight => MediaQuery.of(context).size.height;

  double? get headerTopMargin =>
      lerp(20, 20 + MediaQuery.of(context).padding.top);

  double? get headerFontSize => lerp(14, 24);

  double? get itemBorderRadius => lerp(8, 24);

  double? get iconSize => lerp(iconStartSize, iconEndSize);

  double? iconTopMargin(int index) =>
      lerp(iconStartMarginTop,
          iconEndMarginTop + index * (iconsVerticalSpacing + iconEndSize))! +
      headerTopMargin!;

  double? iconLeftMargin(int index) =>
      lerp(index * (iconsHorizontalSpacing + iconStartSize), 0);

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double? lerp(double min, double max) =>
      lerpDouble(min, max, _controller.value);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          height: lerp(minHeight, maxHeight),
          left: 0,
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: _toggle,
            onVerticalDragUpdate: _handleDragUpdate,
            onVerticalDragEnd: _handleDragEnd,
            //child: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              decoration: const BoxDecoration(
                color: Color(0xFF162A49),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(32),
                ),
              ),
              child: Stack(
                children: [
                  MenuButton(),
                  SheetHeader(
                    fontSize: headerFontSize,
                    topMargin: headerTopMargin,
                  ),
                  ...events.map((event) => _buildIcon(event)),
                ],
              ),
            ),
            //),
          ),
        );
      },
    );
  }

  Widget _buildIcon(Event event) {
    int index = events.indexOf(event);

    return Positioned(
      height: iconSize,
      width: iconSize,
      top: iconTopMargin(index),
      left: iconLeftMargin(index),
      child: ClipRRect(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(itemBorderRadius!),
          right: Radius.circular(itemBorderRadius!),
        ),
        child: Image.asset(
          'assets/${event.assetName}',
          fit: BoxFit.cover,
          alignment: Alignment(lerp(1, 0)!, 0),
        ),
      ),
    );
  }

  void _toggle() {
    final bool isOpen = _controller.status == AnimationStatus.completed;
    _controller.fling(velocity: isOpen ? -2 : 2);
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    _controller.value -= details.primaryDelta! / maxHeight;
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_controller.isAnimating ||
        _controller.status == AnimationStatus.completed) return;

    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / maxHeight;

    if (flingVelocity < 0.0)
      _controller.fling(velocity: math.max(2.0, -flingVelocity));
    else if (flingVelocity > 0.0)
      _controller.fling(velocity: math.min(-2.0, -flingVelocity));
    else
      _controller.fling(velocity: _controller.value < 0.5 ? -2.0 : 2.0);
  }
}
