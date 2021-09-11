import 'package:flutter/material.dart';
import 'package:flutter_bottomnavbar_boilerplate/notfoundpage.dart';

class ScreenTwo extends StatelessWidget {
  final GlobalKey<NavigatorState> navkey;
  const ScreenTwo({
    required this.navkey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Screen Two");
    return Navigator(
      key: navkey,
      onGenerateRoute: (RouteSettings settings) {
        Widget page = const SizedBox();
        switch (settings.name) {
          case '/':
            page = const PageTwo();
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

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Page Two"),
    );
  }
}
