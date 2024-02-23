import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_s/helpers/asset_path_helper.dart';
import 'package:project_s/resources/resources.dart';

import '../constants/color_name.dart';

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
      backgroundColor: ColorNames.pastelgreen,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.bgAnimation.platformAsset),
            fit: BoxFit.cover,
          ),
        ),
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
    );
  }
}
