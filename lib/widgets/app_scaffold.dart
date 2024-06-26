import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_s/generated/assets.gen.dart';

import '../constants/color_name.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, this.providers, required this.body});

  final List<BlocProvider>? providers;
  final Widget Function(BuildContext) body;

  @override
  Widget build(BuildContext context) {
    return providers?.isNotEmpty == true
        ? MultiBlocProvider(
            providers: providers ?? [],
            child: Builder(builder: (context) {
              return _layout(context);
            }))
        : _layout(context);
  }

  _layout(context) {
    return Scaffold(
      backgroundColor: ColorNames.pastelgreen,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.bgAnimation.path),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              constraints: const BoxConstraints(
                maxWidth: 500,
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: body(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
