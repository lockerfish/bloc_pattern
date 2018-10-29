import 'package:flutter/material.dart';
import 'package:bloc_one/widgets/bloc_provider.dart';
import 'package:bloc_one/blocs/counter_bloc.dart';

class BlocCounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// This is how we get this widget business logic component.
    /// Basically, we ask the [BlocProvider] for it.
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('BLoC Pattern Part 0')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            StreamBuilder<int>(
              /// Data flows to this widget via [Stream]
              stream: counterBloc.outCounter,

              /// get [Stream] OUTPUT data
              initialData: 0,

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
          /// Executing the increment method in the BLoC
          /// This feels a bit hacky [null] value pass.
          /// We are only calling on a method being listened to in our BLoC
          counterBloc.incrementCounter.add(null);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
