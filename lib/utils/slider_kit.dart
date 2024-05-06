import 'package:flutter/material.dart';


class SliderWidget extends StatefulWidget {
  final String name;
  final double maxValue;
  final ValueChanged<int> onChanged;

  SliderWidget({
    required this.name,
    required this.maxValue,
    required this.onChanged,
  });

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${widget.name}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Slider(
                value: _sliderValue,
                min: 0.0,
                max: widget.maxValue,
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                    widget.onChanged(value.round());
                  });
                },
              ),
              Text(
                '${_sliderValue.round().toString()}',
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          )
        ],
      ),
    );
  }
}
