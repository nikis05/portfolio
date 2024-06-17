import 'package:frontend/widgets.dart';
import 'package:intersperse/intersperse.dart';

class Pane extends StatelessWidget {
  const Pane({super.key, required this.child})
      : onPress = null,
        _topRadius = true,
        _bottomRadius = true;

  const Pane.button({super.key, required this.onPress, required this.child})
      : _topRadius = true,
        _bottomRadius = true;

  const Pane._optionalRadius({
    super.key,
    required bool topRadius,
    required bool bottomRadius,
    required this.onPress,
    required this.child,
  })  : _topRadius = topRadius,
        _bottomRadius = bottomRadius;

  final Widget child;
  final bool _topRadius;
  final bool _bottomRadius;
  final VoidCallback? onPress;

  static Widget sectioned({required List<PaneSection> sections}) => ListView(
        children: sections.indexed
            .map<Widget>((i) {
              final index = i.$1;
              final section = i.$2;
              return Builder(builder: (context) {
                final child = section.build(context);
                return Pane._optionalRadius(
                  key: child.key,
                  topRadius: index == 0,
                  bottomRadius: index == sections.length - 1,
                  onPress:
                      section is PaneSectionButton ? section.onPress : null,
                  child: child,
                );
              });
            })
            .intersperse(const SizedBox(height: 2))
            .toList(),
      );

  Widget _buildPane(BuildContext context, bool bright) {
    const radius = Radius.circular(8);
    return Container(
      decoration: BoxDecoration(
          color: bright ? Colors.dimmBright : Colors.dimm,
          borderRadius: BorderRadius.only(
              topLeft: _topRadius ? radius : Radius.zero,
              topRight: _topRadius ? radius : Radius.zero,
              bottomLeft: _bottomRadius ? radius : Radius.zero,
              bottomRight: _bottomRadius ? radius : Radius.zero)),
      padding: const EdgeInsets.all(8),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final onPress = this.onPress;
    return (onPress == null)
        ? _buildPane(context, false)
        : AbstractButton(onPress: onPress, build: _buildPane);
  }
}

abstract class PaneSection {
  const PaneSection();

  factory PaneSection.widget({required Widget child}) =>
      PaneSectionWidget(child: child);
  factory PaneSection.button(
          {required Widget child, required VoidCallback onPress}) =>
      PaneSectionButton(child: child, onPress: onPress);

  Widget build(BuildContext context);
}

class PaneSectionWidget extends PaneSection {
  const PaneSectionWidget({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => child;
}

class PaneSectionButton extends PaneSectionWidget {
  const PaneSectionButton({required super.child, required this.onPress});

  final VoidCallback onPress;
}
