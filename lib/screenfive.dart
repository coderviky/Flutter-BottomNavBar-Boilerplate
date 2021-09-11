import 'package:flutter/material.dart';
import 'package:flutter_bottomnavbar_boilerplate/notfoundpage.dart';

class ScreenFive extends StatelessWidget {
  final GlobalKey<NavigatorState> navkey;
  const ScreenFive({
    required this.navkey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Screen Five");
    return Navigator(
      key: navkey,
      onGenerateRoute: (RouteSettings settings) {
        Widget page = const SizedBox();
        switch (settings.name) {
          case '/':
            page = const PageFive();
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

class PageFive extends StatelessWidget {
  const PageFive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Page Five"),
    );
  }
}
