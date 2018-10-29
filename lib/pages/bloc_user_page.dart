import 'package:flutter/material.dart';
import 'package:bloc_one/blocs/user_bloc.dart';
import 'package:bloc_one/widgets/bloc_provider.dart';
import 'package:bloc_one/models/user.dart';

class BlocUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _newName;
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('BLoC Pattern Part 1')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<User>(
              stream: userBloc.outUser,
              builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    '${snapshot.data.name}',
                    style: Theme.of(context).textTheme.display1,
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
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
    );
  }
}
