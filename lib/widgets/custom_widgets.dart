import 'package:flutter/material.dart';


class RatingSelector extends StatefulWidget {
  final ValueChanged<double> onChanged;

  RatingSelector({required this.onChanged});

  @override
  _RatingSelectorState createState() => _RatingSelectorState();
}

class _RatingSelectorState extends State<RatingSelector> {
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Select Rating: ',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
        const SizedBox(width: 8),
        Slider(
          value: _rating,
          onChanged: (value) {
            setState(() {
              _rating = value;
              widget.onChanged(_rating);
            });
          },
          min: 0,
          max: 5,
          divisions: 5,
          label: _rating.toString(),
        ),
      ],
    );
  }
}