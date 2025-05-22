import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutual_fund_assignment/common/app_routes.dart';
import 'package:mutual_fund_assignment/common/app_themes.dart';
import 'package:mutual_fund_assignment/core/utils/connectivity_check.dart';
import 'package:mutual_fund_assignment/features/auth/application/auth_bloc.dart';
import 'package:mutual_fund_assignment/features/loader/presentation/pages/loader_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AuthBloc())],
      child: MaterialApp(
        title: 'Flutter Demo',
        scaffoldMessengerKey: scaffoldMessengerKey,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: AppThemes.applicationDefaultTheme(context),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        onUnknownRoute: AppRoutes.onUnknownRoute,
        initialRoute: LoaderPage.routeName,
      ),
    );
  }
}
