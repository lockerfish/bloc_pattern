import 'package:flutter/material.dart';
import 'package:bloc_one/blocs/user_bloc.dart';
import 'package:bloc_one/widgets/bloc_provider.dart';
import 'package:bloc_one/models/user.dart';

class BlocUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// This is how we get this widget business logic component.
    /// Basically, we ask the [BlocProvider] for it.
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('BLoC Pattern Part 1')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<User>(
              /// Data flows to this widget via [Stream]
              stream: userBloc.outUser,

              /// initalize [Stream]
              builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    '${snapshot.data.name}',

                    /// snapshot.data is the int value in the [Stream]
                    style: Theme.of(context).textTheme.display1,
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
