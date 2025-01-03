import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T value, Widget child) builder;
  final T model;
  final Widget child;

  final Function(T) onModelReady;

  BaseWidget({this.builder, this.model, this.child, this.onModelReady});

  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  // We want to store the instance of the model in the state
  // that way it stays constant through rebuilds
  T model;

  @override
  void initState() {
    // assign the model once when state is initialised
    model = widget.model;

    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );

//    return ChangeNotifierProvider<T>.value(
//      value: model,
//      child: Consumer<T>(
//        builder: widget.builder,
//        child: widget.child,
//      ),
//    );
  }

  @override
  void dispose() {
    print('I have been disposed!!');
    super.dispose();
  }
}
