import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/app_back_button.dart';
import '../../widgets/app_scaffold.dart';
import '../../widgets/level_item.dart';
import '../gameplay/gameplay_view.dart';
import 'level_selection_bloc.dart';

class LevelSelectionView extends StatefulWidget {
  const LevelSelectionView({super.key});

  @override
  State<LevelSelectionView> createState() => _LevelSelectionViewState();
}

class _LevelSelectionViewState extends State<LevelSelectionView> {
  final LevelSelectionBloc controller = LevelSelectionBloc();

  @override
  void initState() {
    super.initState();
    controller.load();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      providers: [
        BlocProvider<LevelSelectionBloc>(
          create: (BuildContext context) => controller,
        ),
      ],
      body: layout,
    );
  }

  Widget layout(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: BlocBuilder<LevelSelectionBloc, LevelSelectionState>(
                buildWhen: (previous, current) => previous.levels != current.levels,
                builder: (context, state) {
                  return Center(
                    child: Wrap(
                      runAlignment: WrapAlignment.center,
                      alignment: WrapAlignment.start,
                      spacing: 8,
                      children: state.levels.keys
                          .map((e) => levelItem(context, e, controller.levels[e] ?? 0))
                          .toList(),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          const AppBackButton(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget levelItem(context, int level, int score) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: LevelItem(
          level: level,
          score: score,
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GameplayView(
                  arguments: GameplayViewArguments(level: level),
                ),
              ),
            );
            controller.load();
          }),
    );
  }
}
