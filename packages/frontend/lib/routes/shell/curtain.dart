import 'package:frontend/routes/shell/lock_screen.dart';
import 'package:frontend/widgets.dart';

class Curtain extends StatefulWidget {
  const Curtain(
      {super.key,
      required this.renderTitle,
      required this.fillBackground,
      required this.child});

  final bool renderTitle;
  final bool fillBackground;
  final Widget child;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<Curtain> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  _DragAcceptStatus _dragAcceptStatus = _DragAcceptStatus.declined;
  double? _gestureZoneHeight;
  static const int _baseAnimationDuration = 300;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _open() {
    _controller.animateTo(1,
        duration: const Duration(milliseconds: _baseAnimationDuration),
        curve: Curves.easeInSine);
  }

  void _handleDragStart(DragStartDetails details) {
    _dragAcceptStatus = _controller.value == 0 &&
            details.localPosition.dy >= _gestureZoneHeight! * 0.8
        ? _DragAcceptStatus.acceptedUp
        : _controller.value == 1 &&
                details.localPosition.dy <= _gestureZoneHeight! * 0.2
            ? _DragAcceptStatus.acceptedDown
            : _DragAcceptStatus.declined;
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (!_dragAcceptStatus.accepted) return;
    _controller.value -= details.primaryDelta! / _gestureZoneHeight!;
  }

  void _handleDragEnd(DragEndDetails _) {
    if (_dragAcceptStatus == _DragAcceptStatus.acceptedUp &&
            _controller.value > 0.2 ||
        _dragAcceptStatus == _DragAcceptStatus.acceptedDown &&
            _controller.value > 0.8) {
      _controller.animateTo(1,
          duration: Duration(
              milliseconds:
                  (_baseAnimationDuration * (1 - _controller.value)).toInt()),
          curve: Curves.easeInSine);
    } else {
      _controller.animateTo(0,
          duration: Duration(
              milliseconds:
                  (_baseAnimationDuration * _controller.value).toInt()),
          curve: Curves.easeInSine);
    }
  }

  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, constraints) {
        _gestureZoneHeight = constraints.maxHeight;
        return GestureDetector(
            onVerticalDragStart: _handleDragStart,
            onVerticalDragUpdate: _handleDragUpdate,
            onVerticalDragEnd: _handleDragEnd,
            child: Stack(
              children: [
                widget.child,
                PositionedTransition(
                    rect: RelativeRectTween(
                            begin: const RelativeRect.fromLTRB(0, 0, 0, 0),
                            end: RelativeRect.fromLTRB(0, -_gestureZoneHeight!,
                                0, _gestureZoneHeight!))
                        .animate(_controller),
                    child: LockScreen(
                      onOpen: _open,
                      renderTitle: widget.renderTitle,
                      fillBackground: widget.fillBackground,
                    )),
              ],
            ));
      });
}

enum _DragAcceptStatus {
  declined,
  acceptedUp,
  acceptedDown;

  bool get accepted {
    return this != _DragAcceptStatus.declined;
  }
}
