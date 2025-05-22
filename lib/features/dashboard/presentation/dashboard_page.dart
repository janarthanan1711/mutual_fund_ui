import 'package:flutter/material.dart';
import 'package:mutual_fund_assignment/core/utils/custom_text.dart';

class DashboardPage extends StatelessWidget {
  static const String routeName = '/dashBoard';
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: MyText(text: "Dashboard")));
  }
}
