import 'package:flutter/material.dart';

import 'package:bloc_one/widgets/bloc_provider.dart';
import 'package:bloc_one/blocs/user_bloc.dart';
import 'package:bloc_one/pages/bloc_user_page.dart';

///
/// Learning BLoC pattern
///
/// [BlocBase] and [BlocProvider] are core glue for this pattern
///
/// This program recreates the Flutter Counter template app using a custom [BlocProvider]
///
/// Note:
/// 	- Not need for setState()
/// 	- Data flows via [StreamController] using a [Sink] or INPUT and [Stream] or OUTPUT
/// 	- [BlocProvider] needs a BLoC (widget's business logic) and a widget to display
/// 	- Widget's business logic class implements [BlocBase] to dispose() can be called
/// 	- widget gets business logic using [BlocProvider] BlocProvider.of<T>(context)

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC Pattern Part 0',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        bloc: UserBloc(),
        child: BlocUserPage(),
      ),
    );
  }
}
