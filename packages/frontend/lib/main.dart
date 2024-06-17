import 'package:frontend/widgets.dart';
import 'package:frontend/routes/routes.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: DefaultTextStyle(
          style: Fonts.regular,
          child: DefaultSvgTheme(
              theme: const SvgTheme(currentColor: Colors.white),
              child: WidgetsApp.router(
                color: Colors.black,
                routerConfig: router,
              ))));
}
