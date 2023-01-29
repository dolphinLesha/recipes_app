import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:recipes_app/src/data/common/extensions/list_extension.dart';
import 'package:recipes_app/src/presentation/core/styles/app_colors.dart';

class AppLogo extends StatelessWidget {
  final double size;

  const AppLogo({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      // width: size.width,
      // height: size.height,
      scale: size/16,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 16,
                height: 16,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: MainColors.lightGreen,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              SizedBox(
                width: 16,
                height: 16,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: MainColors.darkGreen,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ].separateWithPadding(const EdgeInsets.only(right: 4)),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 16,
                height: 16,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: MainColors.green,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              SizedBox(
                width: 16,
                height: 16,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: MainColors.semiDarkGreen,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ].separateWithPadding(const EdgeInsets.only(right: 4)),
          ),
          PlatformText(
            'RecipeApp',
            style: const TextStyle(color: MainColors.semiDarkGreen, fontSize: 8),
          )
        ].separateWithPadding(const EdgeInsets.only(bottom: 4)),
      ),
    );
  }
}
