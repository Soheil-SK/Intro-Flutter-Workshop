import 'package:flame/components.dart';
import 'package:flame/game.dart';

class Enemy extends SpriteComponent with HasGameRef {
  Vector2 velocity;

  Enemy({
    required Vector2 position,
    required Vector2 size,
    required this.velocity,
  }) : super(position: position, size: size);

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('2.png');
    size = size;
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;

    if (position.y > gameRef.size.y) {
      removeFromParent();
    }
  }
}