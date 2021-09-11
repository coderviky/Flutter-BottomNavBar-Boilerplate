import 'package:flutter/material.dart';
import 'package:flutter_bottomnavbar_boilerplate/screenfive.dart';
import 'package:flutter_bottomnavbar_boilerplate/screenfour.dart';
import 'package:flutter_bottomnavbar_boilerplate/screenone.dart';
import 'package:flutter_bottomnavbar_boilerplate/screenthree.dart';
import 'package:flutter_bottomnavbar_boilerplate/screentwo.dart';
import 'package:provider/provider.dart';
import 'models/appnavigationdata.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => APPNavigationData()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: context.read<APPNavigationData>().globalAppNavKey,
      title: 'Spare99 User APP',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const APPscreen(),
    );
  }
}

//
class APPscreen extends StatefulWidget {
  const APPscreen({Key? key}) : super(key: key);

  @override
  _APPscreenState createState() => _APPscreenState();
}

class _APPscreenState extends State<APPscreen> {
  late List<GlobalKey<NavigatorState>> navKeysList;
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    navKeysList = context.read<APPNavigationData>().getNavKeys();
    _screens = [
      ScreenOne(navkey: navKeysList[0]),
      const SizedBox(),
      const SizedBox(),
      const SizedBox(),
      const SizedBox(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<APPNavigationData>(context);
    return WillPopScope(
      child: Scaffold(
        body: IndexedStack(
          children: _screens,
          index: provider.currentIndex,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: provider.currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded), label: 'One'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_rounded), label: 'Two'),
            BottomNavigationBarItem(
                icon: Icon(Icons.widgets_rounded), label: 'Three'),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_rounded), label: 'Four'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded), label: 'Five'),
          ],
          onTap: (index) {
            provider.currentIndex = index;
            setState(() {
              if (_screens[index] is SizedBox) {
                switch (index) {
                  case 1:
                    _screens[index] = ScreenTwo(navkey: navKeysList[1]);
                    break;
                  case 2:
                    _screens[index] = ScreenThree(navkey: navKeysList[2]);
                    break;
                  case 3:
                    _screens[index] = ScreenFour(navkey: navKeysList[3]);
                    break;
                  case 4:
                    _screens[index] = ScreenFive(navkey: navKeysList[4]);
                    break;
                  default:
                    break;
                }
              }
            });
          },
        ),
      ),
      onWillPop: () async {
        print("back pressed");
        final NavigatorState? navigator =
            navKeysList[provider.currentIndex].currentState;
        if (navigator != null) {
          //check nested navigator canpop
          if (navigator.canPop()) {
            await navigator.maybePop();
            return Future.value(false);
          }
          // show dialogue to exit app
          else {
            return (await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: const Text('Do you want to exit an App'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('Yes'),
                      ),
                    ],
                  ),
                )) ??
                false;
          }
        }
        return Future.value(false);
      },
    );
    // );
  }
}
