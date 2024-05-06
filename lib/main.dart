import 'package:flutter/material.dart';
import 'package:simplestopwatch/pages/countdown_timer_page.dart';
import 'package:simplestopwatch/pages/counter_page.dart';
import 'package:simplestopwatch/pages/stop_watch_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Stop Watch',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TabBarController(),
    );
  }
}

class TabBarController extends StatelessWidget {
  const TabBarController({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: "Stopwatch"),
                Tab(text: "Countdown Timer"),
                Tab(text: "Counter"),
              ],
            ),
            title: const Text('Timer'),
          ),
          body: const TabBarView(
            children: [
              StopWatchPage(),
              CountdownTimerPage(),
              CounterPage(),
            ],
          ),
        ),
      ),
    );
  }
}