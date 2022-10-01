import 'package:dartemis/dartemis.dart';
import 'package:gamedev_helpers/gamedev_helpers.dart';

import 'assets.dart';
import 'components/components.dart';
import 'core/logic.dart';
import 'core/managers/game_state_manager.dart';
import 'html/input/controller_system.dart';
import 'html/rendering/position_rendering_system.dart';

class Game extends GameBase {
  final GameStateManager gameStateManager;
  Game(this.gameStateManager)
      : super(
          'ld51',
          depthTest: false,
          blending: false,
          spriteSheetJson: assetJson,
          spriteSheetImg: assetPng,
          bodyDefsName: null,
        );

  @override
  void createEntities() {
    addEntity([
      Controller(),
      Position(0.5, 0),
      Acceleration(0, 0),
      Velocity(0, 0),
      Orientation(0),
      Renderable(spriteSheet!, 'shark'),
    ]);
  }

  @override
  Map<int, List<EntitySystem>> getSystems() => {
        GameBase.rendering: [
          ControllerSystem(),
          ResetAccelerationSystem(),
          ControllerToActionSystem(),
          SimpleGravitySystem(),
          AccelerationSystem(),
          SimpleMovementSystem(),
          CanvasCleaningSystem(canvas),
          PositionRenderingSystem(ctx, spriteSheet!),
          FpsRenderingSystem(hudCtx, 'white'),
        ],
      };

  @override
  List<Manager> getManagers() => [gameStateManager];
}
