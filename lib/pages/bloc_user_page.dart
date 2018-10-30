import 'package:flutter/material.dart';
import 'package:bloc_one/blocs/user_bloc.dart';
import 'package:bloc_one/widgets/bloc_provider.dart';
import 'package:bloc_one/models/user.dart';

class BlocUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    String _newName;
=======
    /// This is how we get this widget business logic component.
    /// Basically, we ask the [BlocProvider] for it.
>>>>>>> c184e19cba68e7558f5ed1532f392c19949a8d1b
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('BLoC Pattern Part 1')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<User>(
<<<<<<< HEAD
              stream: userBloc.outUser,
=======
              /// Data flows to this widget via [Stream]
              stream: userBloc.outUser,

              /// initalize [Stream]
>>>>>>> c184e19cba68e7558f5ed1532f392c19949a8d1b
              builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    '${snapshot.data.name}',
<<<<<<< HEAD
=======

                    /// snapshot.data is the int value in the [Stream]
>>>>>>> c184e19cba68e7558f5ed1532f392c19949a8d1b
                    style: Theme.of(context).textTheme.display1,
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
<<<<<<< HEAD
            StreamBuilder<User>(
              stream: userBloc.outUser,
              builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                if (snapshot.hasData) {
                  return TextField(
                    onChanged: (value) {
                      userBloc.updateName.add(value);
                    },
                    decoration: InputDecoration(
                      labelText: snapshot.data.name,
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
=======
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
>>>>>>> c184e19cba68e7558f5ed1532f392c19949a8d1b
    );
  }
}
