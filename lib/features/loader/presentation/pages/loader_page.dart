import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutual_fund_assignment/common/app_images.dart';
import 'package:mutual_fund_assignment/features/auth/presentation/pages/signin_page.dart';
import 'package:mutual_fund_assignment/features/dashboard/presentation/dashboard_page.dart';
import 'package:mutual_fund_assignment/features/loader/application/loader_bloc.dart';

class LoaderPage extends StatelessWidget {
  static const String routeName = '/loaderPage';
  const LoaderPage({super.key});

  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => LoaderBloc()..add(LoaderGetLocalDataEvent()),
      child: BlocListener<LoaderBloc, LoaderState>(
        listener: (context, state) {
          if (state is LoaderSuccessState) {
            if (!state.loginStatus) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                SigninPage.routeName,
                (route) => false,
              );
            } else {
              Navigator.pushNamedAndRemoveUntil(
                context,
                DashboardPage.routeName,
                (route) => false,
              );
            }
          }
        },
        child: BlocBuilder<LoaderBloc, LoaderState>(
          builder: (context, state) {
            return PopScope(
            canPop: false,
            child :Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              resizeToAvoidBottomInset: false,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.logo,
                      width: size.width * 0.51,
                      height: size.height * 0.51,
                    )
                  ],
                ),
              ),
            ));
          },
        ),
      ),
    );
  }
}
