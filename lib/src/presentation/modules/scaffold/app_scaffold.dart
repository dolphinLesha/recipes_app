import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class AppScaffold extends StatelessWidget {
  final Widget? screen;
  final String? title;
  final Widget? titleWidget;
  final Widget? prefixWidget;
  final Widget? suffixWidget;

  const AppScaffold({
    Key? key,
    this.screen,
    this.title,
    this.titleWidget,
    this.prefixWidget,
    this.suffixWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).padding);
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 0,
            child: SizedBox(
              height: 90,
              child: DecoratedBox(
                decoration: BoxDecoration(),
                child: Row(

                  children: [
                    Flexible(
                      flex: 1,
                      child: prefixWidget ?? const SizedBox.shrink(),
                    ),
                    Flexible(
                      flex: 1,
                      child: titleWidget ?? (title == null || title!.isEmpty ? const SizedBox.shrink() : PlatformText(title!)),
                    ),
                    Flexible(
                      flex: 1,
                      child: suffixWidget ?? const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: screen ?? const SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
