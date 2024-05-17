import 'package:flutter/material.dart';
import 'package:tutorials_world/widgets/network_aware_widget.dart';
import 'package:tutorials_world/widgets/no_internet_home_widget.dart';

class InternetChecker extends StatelessWidget {
  final Widget child;

  const InternetChecker({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return NetworkAwareWidget(
      onlineChild: child,
      offlineChild: const NoInternetHomeWidget(),
    );
  }
}
