import 'package:flutter/material.dart';

class RegularVerticalMargin extends StatelessWidget {
  const RegularVerticalMargin({
    super.key,
    this.height = 20.0,
  });

  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
