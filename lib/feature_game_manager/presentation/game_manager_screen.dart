import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/feature_game_manager/domain/model/game.dart';
import 'package:toplife/feature_game_manager/presentation/game_states.dart';

class GameScreen extends ConsumerWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentGame = ref.watch(currentGameProvider);

    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              ref.read(gameManagerViewModel.notifier).createGame(const Game(
                    currentPlayerID: 6,
                    isActive: true,
                    lastPlayedTime: 110,
                  ));
            },
            child: const Text("Create")),
        ElevatedButton(
            onPressed: () {
              ref.read(gameManagerViewModel.notifier).updateGame(const Game(
                    id: 1,
                    currentPlayerID: 3,
                    isActive: true,
                    lastPlayedTime: 10,
                  ));
            },
            child: const Text("Update")),
        ElevatedButton(
            onPressed: () async {
              await ref.read(gameManagerViewModel.notifier).getGame(1);
            },
            child: const Text("get")),
        ElevatedButton(
            onPressed: () async {
              await ref.read(gameManagerViewModel.notifier).getAllActiveGames();
            },
            child: const Text("getAllActive")),
        ElevatedButton(
            onPressed: () {
              ref.read(gameManagerViewModel.notifier).deleteGame(2);
            },
            child: const Text("Delete")),
        Text(
          "$currentGame",
          style: const TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}
