import 'package:flutter/material.dart';
import 'package:flutter_bottomnavbar_boilerplate/notfoundpage.dart';

class ScreenFour extends StatelessWidget {
  final GlobalKey<NavigatorState> navkey;
  const ScreenFour({
    required this.navkey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Screen Four");
    return Navigator(
      key: navkey,
      onGenerateRoute: (RouteSettings settings) {
        Widget page = const SizedBox();
        switch (settings.name) {
          case '/':
            page = const PageFour();
            break;
          default:
            page = const NotFoundPage();
            break;
        }
        return MaterialPageRoute(builder: (_) => page);
      },
    );
  }
}

class PageFour extends StatelessWidget {
  const PageFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Page Four"),
    );
  }
}
