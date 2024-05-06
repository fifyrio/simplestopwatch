import 'dart:async';

import 'package:flutter/material.dart';

import '../utils/button_kit.dart';
import '../utils/time_utils.dart';

class StopWatchPage extends StatefulWidget {
  const StopWatchPage({super.key});

  @override
  State<StopWatchPage> createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  int _current = 0; // Current countdown value
  Timer? _timer;
  String get timeLabel => TimeUtils.formatSecondsToClock(_current);
  bool _isTimerRunning = false;
  bool _isClickPause = false;
  List <String> _lapList = [];

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _current++;
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
        SizedBox(height: 44),
        Center(
          child: Text('$timeLabel', style: TextStyle(fontSize: 64.0)),
        ),
        SizedBox(height: _isTimerRunning ? 20 : 120.0),
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
        Visibility(
          visible: _isTimerRunning,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircularIconButton(
                  icon: Icon(Icons.stop),
                  onPressed: () {
                    setState(() {
                      _isTimerRunning = false;
                      _isClickPause = false;
                      _current = 0;
                      _lapList = [];
                      _stopTimer();
                    });
                  }),
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
                  icon: Icon(Icons.flag),
                  onPressed: () {
                    setState(() {
                      _lapList.add(TimeUtils.formatSecondsToClock(_current));
                    });
                  }),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _lapList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.timer),
                title: Text('${index+1}.Lap - ${_lapList[index]}'),
              );
            },
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
