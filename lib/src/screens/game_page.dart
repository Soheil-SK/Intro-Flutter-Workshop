import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

import '../models/enemy.dart';
import '../models/player.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late _GalacticDefenderGame _game;

  @override
  void initState() {
    super.initState();
    _game = _GalacticDefenderGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(game: _game),
    );
  }
}

class _GalacticDefenderGame extends FlameGame with DragCallbacks  {
  late Player player;
  double wavePauseTimer = 0.0;
  int currentWave = 1;
  int enemiesToSpawn = 2;
  bool spawningWave = false;


  @override
  bool onDragUpdate(DragUpdateEvent details) {
    print('ONGA');
    player.onDragUpdate(details);
    return true;
  }

  @override
  bool onDragEnd(DragEndEvent event) {
    print('ONGA');
    player.onDragEnd(event);
    return true;
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    if (size == null || size.x == 0 || size.y == 0) {
      await Future.delayed(Duration(milliseconds: 100));
    }

    assert(size != null && size.x > 0 && size.y > 0, 'Size must be initialized properly.');

    player = Player(
      position: Vector2(size.x / 2, size.y - 100),
      size: Vector2(64, 64),
    );
    add(player);

    startNewWave();
  }

  @override
  void update(double dt) {
    super.update(dt);


    // if (spawningWave) return;

    // // Update the wave pause timer
    // wavePauseTimer += dt;

    // // new wave
    // if (wavePauseTimer > 5.0) {
    //   startNewWave();
    //   wavePauseTimer = 0.0;
    // }
  }

  void startNewWave() {
    spawningWave = true;
    for (int i = 0; i < enemiesToSpawn; i++) {
      spawnEnemy();
    }
    currentWave++;
    enemiesToSpawn *= 2;
    spawningWave = false;
    print('Wave $currentWave started with $enemiesToSpawn enemies for the next wave.');
  }

  void spawnEnemy() {
    final enemy = Enemy(
      // position: Vector2(size.x * (0.1 + 0.8 * (i / enemiesToSpawn)), 0), // Spread out enemies across the top
      position: Vector2(size.x / 2, 0),
      size: Vector2(64, 64),
      velocity: Vector2(0, 20),
    );
    add(enemy);
    print('Enemy spawned at: ${enemy.position}');
  }
}