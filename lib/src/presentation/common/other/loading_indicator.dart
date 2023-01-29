import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipes_app/src/data/common/extensions/list_extension.dart';
import 'package:recipes_app/src/presentation/core/styles/app_colors.dart';

class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _scaleAnimationController;
  late Animation<double> _animation;
  late Animation<double> _scaleAnimation;
  bool scale = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _scaleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 200),
      lowerBound: 0.5,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutQuart,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _scaleAnimationController,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeInOutQuart,
    );
    _animationController.forward()
      ..whenComplete(() => _animationController.repeat());
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (!mounted) {
        return;
      }
      if (scale) {
        _scaleAnimationController.forward();
      } else {
        _scaleAnimationController.reverse();
      }
      scale = !scale;
    });
    // _scaleAnimationController.forward()
    //   ..whenComplete(() => _scaleAnimationController.reverse());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
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
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: MainColors.lightGreen,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 16,
                height: 16,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: MainColors.darkGreen,
                      borderRadius: BorderRadius.circular(8),
                    ),
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
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: MainColors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 16,
                height: 16,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: MainColors.semiDarkGreen,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ].separateWithPadding(const EdgeInsets.only(right: 4)),
          ),
        ].separateWithPadding(const EdgeInsets.only(bottom: 4)),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scaleAnimationController.dispose();
    super.dispose();
  }
}
