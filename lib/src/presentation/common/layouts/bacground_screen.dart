import 'package:flutter/material.dart';
import 'package:recipes_app/src/presentation/core/styles/app_colors.dart';

class BackgroundScreen extends StatelessWidget {
  final Widget child;

  const BackgroundScreen({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(gradient: LinearGradient(
                  begin: Alignment(0.2,-1),
                  end: Alignment(0.8, 1),
                  colors: <Color>[
                    Color(0xff2290ea),
                    Color(0xff3f71d8),
                    Color(0xff525fcc),
                    Color(0xff644bbf),
                    Color(0xff7734ac),
                    Color(0xff89229f),
                    Color(0xff9f0f8e),
                    Color(0xffbb0776),
                  ], // Gradient from https://learnui.design/tools/gradient-generator.html
                  tileMode: TileMode.mirror,
                ),),
              ),
            ),
          ],
        ),
        child,
      ],
    );
  }
}
