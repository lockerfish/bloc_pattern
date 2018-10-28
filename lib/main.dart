import 'package:flutter/material.dart';

import 'dart:async';

///
/// Learning BLoC pattern
///
/// We must first understand how [Stream] works.
/// This program recreates the Flutter Counter template app using [Stream]
///
/// Note:
/// 	- Not need for setState()
/// 	- Data flows via [StreamController] using a [Sink] or INPUT and [Stream] or OUTPUT

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC Pattern Part 0',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamCounterPage(),
    );
  }
}

class StreamCounterPage extends StatefulWidget {
  @override
  _StreamCounterPageState createState() => _StreamCounterPageState();
}

class _StreamCounterPageState extends State<StreamCounterPage> {
  /// [StreamController] manage a [Stream] with a single [Subscriber]
  final StreamController<int> _streamController = StreamController<int>();
  int _counter = 0;

  @override
  void dispose() {
    /// Always close() your [Stream] when done
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BLoC Pattern Part 0')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),

            /// We get the counter value out of the [StreamController] [Stream]
            StreamBuilder<int>(
              stream: _streamController.stream,

              /// get [Stream] OUTPUT data
              initialData: _counter,

              /// initalize [Stream]
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Text(
                  '${snapshot.data}',

                  /// snapshot.data is the int value in the [Stream]
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// INPUT data
          _streamController.sink.add(++_counter);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
