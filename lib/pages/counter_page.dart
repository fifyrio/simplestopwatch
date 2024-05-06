import 'package:flutter/material.dart';
import '../utils/button_kit.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _current = 0; // Current countdown value
  int _countBy = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 44, bottom: 44),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('$_current', style: TextStyle(fontSize: 88.0)),
          SizedBox(height: 120.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.keyboard_arrow_left),
                onPressed: () {
                  setState(() {
                    if (_countBy > 1) {
                      _countBy -= 1;
                    }
                  });
                },
              ),
              Text('$_countBy', style: TextStyle(fontSize: 44.0)),
              IconButton(
                icon: Icon(Icons.keyboard_arrow_right),
                onPressed: () {
                  setState(() {
                    _countBy += 1;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 60.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircularIconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _current += _countBy;
                    });
                  }),
              CircularIconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (_current > 0 && _countBy > 0) {
                        _current -= _countBy;
                      }
                    });
                  }),
            ],
          ),
          SizedBox(height: 20.0),
          Center(
            child: CircularIconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  setState(() {
                    _current = 0;
                  });
                }),
          )
        ],
      ),
    );
  }
}
