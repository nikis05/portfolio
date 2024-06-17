import 'package:frontend/widgets.dart';

class IsPortfolioOpenProvider extends StatelessWidget {
  const IsPortfolioOpenProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (_) => IsPortfolioOpenNotifier._(),
        child: child,
      );
}

class IsPortfolioOpenNotifier extends ValueNotifier<bool> {
  IsPortfolioOpenNotifier._() : super(false);
}
