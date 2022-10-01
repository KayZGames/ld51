import 'dart:html';

import 'package:dartemis/dartemis.dart';
import 'package:gamedev_helpers/gamedev_helpers.dart';

part 'position_rendering_system.g.dart';

@Generate(
  EntityProcessingSystem,
  allOf: [
    Position,
    Orientation,
    Renderable,
  ],
  manager: [
    CameraManager,
  ],
)
class PositionRenderingSystem extends _$PositionRenderingSystem {
  CanvasRenderingContext2D ctx;
  SpriteSheet sheet;
  PositionRenderingSystem(this.ctx, this.sheet);

  @override
  void processEntity(
    int entity,
    Position position,
    Orientation orientation,
    Renderable renderable,
  ) {
    final image = sheet.image;
    final sprite = renderable.sprite;
    final src = sprite.src;
    final dst = sprite.dst;
    ctx
      ..save()
      ..scale(0.5, 0.5)
      ..translate(
        position.x * cameraManager.width + dst.width / 2,
        position.y * cameraManager.height + dst.width / 2,
      )
      ..rotate(-orientation.angle)
      ..translate(-dst.width / 2, -dst.height / 2)
      ..drawImageScaledFromSource(
        image,
        src.left,
        src.top,
        src.width,
        src.height,
        0,
        0,
        dst.width,
        dst.height,
      )
      ..restore();
  }
}
