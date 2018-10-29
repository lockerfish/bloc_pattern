import 'package:flutter/material.dart';

/// [BlocBase] is the basic glue of this pattern
/// dispose() help use close [Stream]
abstract class BlocBase {
  void dispose();
}

/// [BlocProvider] connects a widget with its business logic
/// BLoC use [Stream] and [Sink] to flow data to widget
class BlocProvider<T extends BlocBase> extends StatefulWidget {
  final T bloc;
  final Widget child;

  BlocProvider({Key key, @required this.child, @required this.bloc})
      : super(key: key);

  @override
  _BlocProviderState createState() => _BlocProviderState();

  static Type _typeOf<T>() => T;

  static T of<T extends BlocBase>(BuildContext context) {
    final type = _typeOf<BlocProvider<T>>();
    BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }
}

class _BlocProviderState extends State<BlocProvider> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
