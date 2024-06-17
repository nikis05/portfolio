import 'package:frontend/widgets.dart';
import 'package:flutter/services.dart';

class AbstractButton extends StatefulWidget {
  const AbstractButton({super.key, required this.onPress, required this.build});

  final VoidCallback onPress;
  final Widget Function(BuildContext context, bool bright) build;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<AbstractButton> {
  final _focusNode = FocusNode();
  bool _focused = false;
  bool _hovered = false;
  bool _tapping = false;

  void _handleFocusChange(bool focused) {
    setState(() {
      _focused = focused;
    });
  }

  void _handleMouseEnter(PointerEnterEvent _) {
    setState(() {
      _hovered = true;
    });
  }

  void _handleMouseExit(PointerExitEvent _) {
    setState(() {
      _hovered = false;
    });
  }

  KeyEventResult _handleKeyEvent(FocusNode _, KeyEvent event) {
    if (event.logicalKey == LogicalKeyboardKey.enter ||
        event.logicalKey == LogicalKeyboardKey.space) {
      if (event is KeyDownEvent) {
        setState(() {
          _tapping = true;
        });
      } else if (event is KeyUpEvent) {
        setState(() {
          _tapping = false;
          widget.onPress();
        });
      }
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  void _handleTapDown(TapDownDetails _) {
    _focusNode.requestFocus();
    setState(() {
      _tapping = true;
    });
  }

  void _handleTapUp(TapUpDetails _) {
    setState(() {
      _tapping = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _tapping = false;
    });
  }

  bool get _active => _hovered || _focused;

  bool get _bright => _active != _tapping;

  @override
  Widget build(BuildContext context) => Focus(
      focusNode: _focusNode,
      onFocusChange: _handleFocusChange,
      onKeyEvent: _handleKeyEvent,
      child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: _handleMouseEnter,
          onExit: _handleMouseExit,
          child: TapRegion(
              onTapOutside: (_) => _focusNode.unfocus(),
              child: GestureDetector(
                  onTapDown: _handleTapDown,
                  onTapUp: _handleTapUp,
                  onTapCancel: _handleTapCancel,
                  onTap: widget.onPress,
                  child: widget.build(context, _bright)))));
}
