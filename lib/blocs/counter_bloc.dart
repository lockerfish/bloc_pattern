import 'package:bloc_one/widgets/bloc_provider.dart';
import 'dart:async';

class CounterBloc implements BlocBase {
  int _counter;

  /// This Controller, Sink and Stream manage the counter
  StreamController<int> _counterController = StreamController<int>();
  Sink<int> get _inAdd => _counterController.sink;
  Stream<int> get outCounter => _counterController.stream;

  /// This controller and Sink manage the increment method
  /// Feels a bit hacky
  StreamController<int> _incrementController = StreamController<int>();
  Sink<int> get incrementCounter => _incrementController.sink;

  CounterBloc() {
    _counter = 0;

    /// whenever an event happens call _increment method
    _incrementController.stream.listen(_increment);
  }
  @override
  void dispose() {
    /// [BlocBase] makes sure with call close()
    _counterController.close();
    _incrementController.close();
  }

  void _increment(data) {
    _counter = _counter + 1;
    _inAdd.add(_counter);
  }
}
