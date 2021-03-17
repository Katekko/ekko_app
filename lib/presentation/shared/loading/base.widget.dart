import 'package:flutter/material.dart';

import 'loading.widget.dart';

class BaseWidget extends StatelessWidget {
  final Widget child;
  const BaseWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        LoadingWidget(),
      ],
    );
  }
}
