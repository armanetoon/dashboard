import 'package:dashboard/helpers/route_path.dart';
import 'package:dashboard/pages/large_dashboard.dart';
import 'package:flutter/material.dart';

class SiteRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  String _page = "home";

  @override
  // TODO: implement navigatorKey
  GlobalKey<NavigatorState>? get navigatorKey => throw UnimplementedError();

  @override
  // TODO: implement currentConfiguration
  RoutePath? get currentConfiguration {
    if (_page == "home") return RoutePath.home();
    if (_page == "normaluser") return RoutePath.normalUser();
    if (_page == "investors") return RoutePath.investor();
    if (_page == "allplan") return RoutePath.allPlan();
    if (_page == "newplan") return RoutePath.newPlan();
    return RoutePath.unknown();
  }

  void _handleTapped(String str) {
    _page = str;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
      ],
    );
  }

  @override
  Future<void> setNewRoutePath(RoutePath configuration) {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }
}
