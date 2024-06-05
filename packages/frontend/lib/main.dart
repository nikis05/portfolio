import 'package:frontend/widgets.dart';
import 'package:frontend/routes/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: DefaultTextStyle(
          style: Fonts.regular,
          child: WidgetsApp.router(
            color: Colors.black,
            routerConfig: router,
          )));
}
