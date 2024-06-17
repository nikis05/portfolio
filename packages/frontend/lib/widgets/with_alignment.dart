import 'package:equatable/equatable.dart';
import 'package:frontend/widgets/widgets.dart';

class CoordinateSystem extends StatelessWidget {
  const CoordinateSystem({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey(debugLabel: "coordinateSystem");
    return Provider.value(
      key: key,
      value: _CoordinateSystemKey(key: key),
      child: child,
    );
  }
}

class WithGetAlignment extends StatelessWidget {
  const WithGetAlignment({super.key, required this.builder});

  final Widget Function(BuildContext context, Alignment Function() getAlignment)
      builder;

  @override
  Widget build(BuildContext context) {
    final coordinateSystemKey = context.watch<_CoordinateSystemKey>().key;
    return builder(context, () {
      final parentRenderBox =
          coordinateSystemKey.currentContext!.findRenderObject() as RenderBox;
      final childRenderBox = context.findRenderObject()! as RenderBox;
      final alignment = _relativeAlignment(parentRenderBox, childRenderBox);
      return alignment;
    });
  }
}

@immutable
class _CoordinateSystemKey extends Equatable {
  const _CoordinateSystemKey({required this.key});

  final GlobalKey key;

  @override
  List<Object?> get props => [key];
}

Alignment _relativeAlignment(RenderBox parent, RenderBox child) {
  final childRelativeOffset =
      parent.globalToLocal(child.localToGlobal(Offset.zero));

  double alignmentDimension(
          double childOffsetDimension, double coordinatesSizeDimension) =>
      (childOffsetDimension / coordinatesSizeDimension) * 2 - 1;

  return Alignment(
      alignmentDimension(childRelativeOffset.dx, parent.size.width),
      alignmentDimension(childRelativeOffset.dy, parent.size.height));
}
