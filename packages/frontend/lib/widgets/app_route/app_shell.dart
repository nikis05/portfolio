import 'package:frontend/routes/home/home.dart';
import 'package:frontend/widgets.dart';

class AppShell extends StatelessWidget {
  const AppShell({
    super.key,
    required this.routeLabel,
    required this.isPortfolioOpen,
    this.buttonProps,
    required this.child,
  });

  final String routeLabel;
  final bool isPortfolioOpen;
  final AppShellButtonProps? buttonProps;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final buttonProps = this.buttonProps;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      color: Colors.black,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                  height: 16,
                  alignment: Alignment.centerLeft,
                  child: InlineButton(
                      label: isPortfolioOpen ? "Portfolio" : "Main screen",
                      icon: "arrow_left",
                      onPress: () => HomeRoute().go(context))),
              Container(
                  height: 16,
                  alignment: Alignment.center,
                  child: Text(routeLabel, style: Fonts.semiBold)),
              if (buttonProps != null)
                Container(
                  height: 16,
                  alignment: Alignment.centerRight,
                  child: InlineButton(
                      label: buttonProps.label, onPress: buttonProps.onPress),
                )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(child: child)
        ],
      ),
    );
  }
}

@immutable
class AppShellButtonProps {
  const AppShellButtonProps({required this.label, required this.onPress});

  final String label;
  final VoidCallback onPress;
}
