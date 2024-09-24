import 'package:brick_breaker/src/brick_breaker.dart';
import 'package:brick_breaker/src/components/components.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_test/flame_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PlayArea test', () {
    testWithGame<BrickBreaker>('Render test', BrickBreaker.new, (game) async {
      final playArea = PlayArea();
      game.add(playArea);
      await game.ready();

      expect(playArea.size, equals(Vector2(game.size.x, game.size.y)));
    });

    testWithFlameGame('Hitbox test', (game) async {
      final playArea = PlayArea();
      game.add(playArea);
      await game.ready();


      final hasHitbox = playArea.children.any((child) => child is RectangleHitbox);
      expect(hasHitbox, isTrue);
    });
  });
}