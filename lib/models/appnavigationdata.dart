import 'package:flutter/material.dart';

class APPNavigationData with ChangeNotifier {
  final _globalAppNavKey = GlobalKey<NavigatorState>(debugLabel: "HomePage");
  GlobalKey<NavigatorState> get globalAppNavKey => _globalAppNavKey;

  final _screenOneKey = GlobalKey<NavigatorState>(debugLabel: "ScreenOne");
  GlobalKey<NavigatorState> get screenOneKey => _screenOneKey;

  final _screenTwoKey = GlobalKey<NavigatorState>(debugLabel: "ScreenTwo");
  GlobalKey<NavigatorState> get screenTwoKey => _screenTwoKey;

  final _screenThreeKey = GlobalKey<NavigatorState>(debugLabel: "ScreenThree");
  GlobalKey<NavigatorState> get screenThreeKey => _screenThreeKey;

  final _screenFourKey = GlobalKey<NavigatorState>(debugLabel: "ScreenFour");
  GlobalKey<NavigatorState> get screenFourKey => _screenFourKey;

  final _screenFiveKey = GlobalKey<NavigatorState>(debugLabel: "ScreenFive");
  GlobalKey<NavigatorState> get screenFiveKey => _screenFiveKey;

  List<GlobalKey<NavigatorState>> getNavKeys() {
    return <GlobalKey<NavigatorState>>[
      _screenOneKey,
      _screenTwoKey,
      _screenThreeKey,
      _screenFourKey,
      _screenFiveKey
    ];
  }

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
