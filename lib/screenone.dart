import 'package:flutter/material.dart';
import 'package:flutter_bottomnavbar_boilerplate/notfoundpage.dart';

class ScreenOne extends StatelessWidget {
  final GlobalKey<NavigatorState> navkey;
  const ScreenOne({
    required this.navkey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Screen One");
    return Navigator(
      key: navkey,
      onGenerateRoute: (RouteSettings settings) {
        Widget page = const SizedBox();
        switch (settings.name) {
          case '/':
            page = const PageOne();
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

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Page One"),
    );
  }
}
