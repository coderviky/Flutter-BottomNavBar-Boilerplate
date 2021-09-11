import 'package:flutter/material.dart';
import 'package:flutter_bottomnavbar_boilerplate/notfoundpage.dart';

class ScreenThree extends StatelessWidget {
  final GlobalKey<NavigatorState> navkey;
  const ScreenThree({
    required this.navkey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Screen Three");
    return Navigator(
      key: navkey,
      onGenerateRoute: (RouteSettings settings) {
        Widget page = const SizedBox();
        switch (settings.name) {
          case '/':
            page = const PageThree();
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

class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Page Three"),
    );
  }
}
