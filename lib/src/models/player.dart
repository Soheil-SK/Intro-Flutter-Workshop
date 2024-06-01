import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

class Player extends SpriteComponent with HasGameRef, DragCallbacks  {
  Vector2 moveDirection = Vector2.zero();
  final double speed = 200.0;

  Player({
    required Vector2 position,
    required Vector2 size,
  }) : super(position: position, size: size);

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('1.png');
    this.size = size;
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += moveDirection * speed * dt;
    position.clamp(Vector2.zero(), gameRef.size - size);
  }



  void onDragUpdate(DragUpdateEvent event) {
    final touchPosition = event.localPosition;
    moveDirection = (touchPosition - position).normalized();

  }

  void onDragEnd(DragEndEvent event) {
  }

  @override
  bool onTapUp(TapUpEvent event) {
    moveDirection = Vector2.zero();
    return true;
  }
}