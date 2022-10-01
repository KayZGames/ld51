import 'dart:math';

import 'package:dartemis/dartemis.dart';
import 'package:gamedev_helpers/gamedev_helpers.dart';

import '../components/components.dart';

part 'logic.g.dart';

@Generate(
  EntityProcessingSystem,
  allOf: [
    Controller,
    Acceleration,
    Orientation,
  ],
)
class ControllerToActionSystem extends _$ControllerToActionSystem {
  final _acc = 50.0;

  @override
  void processEntity(
    int entity,
    Controller controller,
    Acceleration acceleration,
    Orientation orientation,
  ) {
    if (controller.up) {
      acceleration.x += _acc * world.delta;
    } else if (controller.down) {
      acceleration.x -= _acc * world.delta;
    }
    if (controller.left) {
      orientation.angle += 2 * world.delta;
    } else if (controller.right) {
      orientation.angle -= 2 * world.delta;
    }
  }
}

@Generate(
  EntityProcessingSystem,
  allOf: [
    Acceleration,
    Velocity,
    Orientation,
  ],
)
class AccelerationSystem extends _$AccelerationSystem {
  @override
  void processEntity(
    int entity,
    Acceleration acceleration,
    Velocity velocity,
    Orientation orientation,
  ) {
    final accForward = acceleration.x;
    final speed = accForward * world.delta;
    velocity
      ..x += speed * cos(orientation.angle)
      ..y += speed * sin(-orientation.angle);
  }
}
