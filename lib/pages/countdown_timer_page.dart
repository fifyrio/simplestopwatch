import 'dart:async';

import 'package:flutter/material.dart';

import '../utils/button_kit.dart';
import '../utils/slider_kit.dart';
import '../utils/time_utils.dart';

class CountdownTimerPage extends StatefulWidget {
  const CountdownTimerPage({super.key});

  @override
  State<CountdownTimerPage> createState() => _CountdownTimerPageState();
}

class _CountdownTimerPageState extends State<CountdownTimerPage> {
  int _current = 0; // Current countdown value
  Timer? _timer;
  String get timeLabel => TimeUtils.formatSecondsToClock(_current);
  int _hourSliderValue = 0;
  int _minSliderValue = 0;
  int _secSliderValue = 0;
  bool _isTimerRunning = false;
  bool _isClickPause = false;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_current > 0) {
          _current--;
        } else {
          _timer!.cancel();
        }
      });
    });
  }

  void _stopTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
  }

  int formatSeconds(int sec, int min, int hour) {
    return sec + min * 60 + hour * 3600;
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
        child: Text('$timeLabel', style: TextStyle(fontSize: 64.0)),
        ),
        Visibility(
          visible: !_isTimerRunning,
          child: Column(
            children: [
              SliderWidget(name: "Hour", maxValue: 24.0, onChanged: (value) {
                setState(() {
                  _hourSliderValue = value;
                  _current = formatSeconds(_secSliderValue, _minSliderValue, _hourSliderValue);
                });
              }),
              SliderWidget(name: "Minutes", maxValue: 60.0, onChanged: (value) {
                setState(() {
                  _minSliderValue = value;
                  _current = formatSeconds(_secSliderValue, _minSliderValue, _hourSliderValue);
                });
              }),
              SliderWidget(name: "Seconds", maxValue: 60.0, onChanged: (value) {
                setState(() {
                  _secSliderValue = value;
                  _current = formatSeconds(_secSliderValue, _minSliderValue, _hourSliderValue);
                });
              }),
            ],
          )
        ),
        Visibility(
          visible: !_isTimerRunning,
          child: Center(
            child: CircularIconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    _isTimerRunning = true;
                    _startTimer();
                  });
                }),
          ),
        ),
        Padding(
          padding: _isTimerRunning? const EdgeInsets.only(top: 125) : EdgeInsets.zero
        ),
        Visibility(
          visible: _isTimerRunning,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircularIconButton(
                  icon: _isClickPause ? Icon(Icons.play_arrow) : Icon(Icons.pause),
                  onPressed: () {
                    if (_isClickPause == false) {
                      setState(() {
                        _isClickPause = true;
                      });
                      _stopTimer();
                    } else {
                      setState(() {
                        _isClickPause = false;
                      });
                      _startTimer();
                    }
                  }),
              CircularIconButton(
                  icon: Icon(Icons.stop),
                  onPressed: () {
                    setState(() {
                      _isTimerRunning = false;
                      _isClickPause = false;
                      _current = 0;
                      _stopTimer();
                    });
                  }),
            ],
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }
}

