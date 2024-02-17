import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppScaffold<STATE> extends StatelessWidget {
  const AppScaffold({super.key, this.controller, required this.body});

  final Cubit<STATE>? controller;
  final Widget Function(BuildContext) body;

  @override
  Widget build(BuildContext context) {
    return controller != null
        ? BlocProvider(
            create: (context) => controller!,
            child: BlocBuilder<Cubit<STATE>, STATE>(
                bloc: controller,
                builder: (context, state) {
                  return _layout(context);
                }),
          )
        : _layout(context);
  }

  _layout(context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          constraints: const BoxConstraints(
            maxHeight: 500,
            maxWidth: 500,
          ),
          child: body(context),
        ),
      ),
    );
  }
}
