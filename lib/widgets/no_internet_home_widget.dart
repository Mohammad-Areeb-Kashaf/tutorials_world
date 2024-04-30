import 'package:flutter/material.dart';

class NoInternetHomeWidget extends StatelessWidget {
  const NoInternetHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('No Internet'),
            Text('Please check your internet connection and try again.')
          ],
        ),
      ),
    );
  }
}
