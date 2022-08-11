import 'package:flutter/material.dart';

class ClickableWidget extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onTap;

  const ClickableWidget({
    Key? key,
    this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: child,
    );
  }
}
