import 'package:flutter/material.dart';
import 'package:mutual_fund_assignment/core/utils/custom_text.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          // Image.asset(AppImages.noInternet),
          const Center(
            child:
                MyText(text: 'Please try again after sometimes', maxLines: 3),
          ),
        ],
      ),
    );
  }
}