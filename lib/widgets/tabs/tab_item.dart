import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final String text;
  final bool isSelected;

  const TabItem({
    Key? key,
    required this.isSelected,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontSize: isSelected ? 16 : 14,
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
          Container(
            height: 6,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: isSelected ? Color(0xFFFF5A1D) : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
