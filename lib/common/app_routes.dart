import 'package:flutter/material.dart';
import 'package:mutual_fund_assignment/core/error/error_page.dart';
import 'package:mutual_fund_assignment/features/auth/presentation/pages/signin_page.dart';
import 'package:mutual_fund_assignment/features/auth/presentation/pages/signup_page.dart';
import 'package:mutual_fund_assignment/features/dashboard/presentation/dashboard_page.dart';
import 'package:mutual_fund_assignment/features/loader/presentation/pages/loader_page.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoutes(RouteSettings routeSettings) {
    late Route<dynamic> pageRoute;
    Object? arg = routeSettings.arguments;

    switch (routeSettings.name) {
      case SigninPage.routeName:
        pageRoute = MaterialPageRoute(builder: (context) => const SigninPage());
        break;
      case SignupPage.routeName:
        pageRoute = MaterialPageRoute(builder: (context) => const SignupPage());
        break;
      case LoaderPage.routeName:
        pageRoute = MaterialPageRoute(builder: (context) => LoaderPage());
        break;
      case DashboardPage.routeName:
        pageRoute = MaterialPageRoute(builder: (context) => DashboardPage());
        break;
    }
    return pageRoute;
  }

  static Route<dynamic> onUnknownRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(builder: (context) => const ErrorPage());
  }
}
