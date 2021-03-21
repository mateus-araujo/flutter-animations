import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  final String name;
  final String date;
  final double offset;

  const CardContent({
    Key? key,
    required this.name,
    required this.date,
    required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Transform.translate(
            offset: Offset(8 * offset, 0),
            child: Text(name, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 8),
          Transform.translate(
            offset: Offset(32 * offset, 0),
            child: Text(date, style: TextStyle(color: Colors.grey)),
          ),
          Spacer(),
          Row(
            children: <Widget>[
              Transform.translate(
                offset: Offset(48 * offset, 0),
                child: ElevatedButton(
                  child: Text('Reserve'),
                  onPressed: () {},
                ),
              ),
              Spacer(),
              Transform.translate(
                offset: Offset(32 * offset, 0),
                child: Text(
                  '0.00 \$',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(width: 16)
            ],
          ),
        ],
      ),
    );
  }
}
