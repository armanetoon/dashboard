class RoutePath{
  late String addr;
  late int plan;

  RoutePath.home():addr = "home";
  RoutePath.normalUser():addr = "normaluser";
  RoutePath.investor():addr = "investors";
  RoutePath.allPlan():addr = "allplan";
  RoutePath.newPlan():addr = "newplan";
  RoutePath.unknown():addr = "unknown";

  bool get isHomePage => addr == "home";
  bool get isNormalUserPage => addr == "normaluser";
  bool get isInvestorPage => addr == "investors";
  bool get isAllPlanPage => addr == "allplan";
  bool get isNewPlanPage => addr == "newplan";
  bool get isUnknownPage => addr == "unknown";
}