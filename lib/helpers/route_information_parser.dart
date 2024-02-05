import 'package:dashboard/helpers/route_path.dart';
import 'package:flutter/material.dart';

class SiteRouteInformationParser extends RouteInformationParser<RoutePath> {
  @override
  Future<RoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = routeInformation.uri;
    if (uri.pathSegments.isEmpty) {
      return RoutePath.home();
    }
    if (uri.pathSegments.length == 1) {
      if (uri.pathSegments.first.toLowerCase() == "allplan") {
        return RoutePath.allPlan();
      }
      if (uri.pathSegments.first.toLowerCase() == "newplan") {
        return RoutePath.newPlan();
      }
      if (uri.pathSegments.first.toLowerCase() == "investors") {
        return RoutePath.investor();
      }
      if (uri.pathSegments.first.toLowerCase() == "normaluser") {
        return RoutePath.normalUser();
      }
      if (uri.pathSegments.first.toLowerCase() == "home") {
        return RoutePath.home();
      }
      return RoutePath.unknown();
    }
    if (uri.pathSegments.length == 2) {
      return RoutePath.unknown();
    }
    return RoutePath.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(RoutePath configuration) {
    if (configuration.isHomePage) {
      return RouteInformation(uri: Uri(path: "/home"));
    }
    if (configuration.isAllPlanPage) {
      return RouteInformation(uri: Uri(path: "/allplan"));
    }
    if (configuration.isNewPlanPage) {
      return RouteInformation(uri: Uri(path: "/newplan"));
    }
    if (configuration.isInvestorPage) {
      return RouteInformation(uri: Uri(path: "/investors"));
    }
    if (configuration.isNormalUserPage) {
      return RouteInformation(uri: Uri(path: "/normaluser"));
    }
    if (configuration.isUnknownPage) {
      return RouteInformation(uri: Uri(path: "/unknown"));
    }
    return null;
  }
}
