import 'package:dartemis/dartemis.dart';

class Controller extends Component {
  bool up;
  bool down;
  bool left;
  bool right;

  Controller({
    this.up = false,
    this.down = false,
    this.left = false,
    this.right = false,
  });

  void reset() {
    up = false;
    down = false;
    left = false;
    right = false;
  }
}
