import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../core/styles/app_colors.dart';

enum CursorTooltipDirection {
  leftBottom,
  leftTop,
  rightBottom,
  rightTop,
  free,
}

extension CursorTooltipDirectionX on CursorTooltipDirection {
  bool get isLeftBottom => this == CursorTooltipDirection.leftBottom;

  bool get isLeftTop => this == CursorTooltipDirection.leftTop;

  bool get isRightBottom => this == CursorTooltipDirection.rightBottom;

  bool get isRightTop => this == CursorTooltipDirection.rightTop;

  bool get isFree => this == CursorTooltipDirection.free;
}

enum AppearanceStyle {
  cursor,
  side,
}

extension AppearanceStyleX on AppearanceStyle {
  bool get isCursor => this == AppearanceStyle.cursor;

  bool get isSide => this == AppearanceStyle.side;
}

enum SideTooltipDirection {
  top,
  right,
  bottom,
  left,
  free,
}

extension SideTooltipDirectionX on SideTooltipDirection {
  bool get isTop => this == SideTooltipDirection.top;

  bool get isRight => this == SideTooltipDirection.right;

  bool get isBottom => this == SideTooltipDirection.bottom;

  bool get isLeft => this == SideTooltipDirection.left;

  bool get isFree => this == SideTooltipDirection.free;
}

class CustomTooltip extends StatefulWidget {
  final Widget child;
  final Widget? contentWidget;
  final double? maxWidth;
  final double? maxHeight;
  final CursorTooltipDirection cursorDirection;
  final AppearanceStyle appearanceStyle;
  final SideTooltipDirection sideDirection;
  final bool withShadows;
  final EdgeInsets padding;
  final Color? backgroundColor;

  const CustomTooltip({
    Key? key,
    required this.child,
    this.contentWidget,
    this.maxWidth,
    this.maxHeight,
    this.cursorDirection = CursorTooltipDirection.free,
    this.appearanceStyle = AppearanceStyle.cursor,
    this.sideDirection = SideTooltipDirection.free,
    this.withShadows = true,
    this.padding = const EdgeInsets.all(10),
    this.backgroundColor,
  }) : super(key: key);

  @override
  _CustomTooltipState createState() => _CustomTooltipState();
}

class _CustomTooltipState extends State<CustomTooltip>
    with TickerProviderStateMixin {
  late Color color = widget.backgroundColor ?? AdditionalColors.dark;

  OverlayEntry? overlayEntry;

  final LayerLink _layerLink = LayerLink();
  bool isHoverOnParent = false;
  bool isHoverOnChild = false;
  late Timer timer;

  late final AnimationController _expandController = AnimationController(
    duration: const Duration(milliseconds: 150),
    vsync: this,
  );
  late final Animation<double> _expandAnimation = CurvedAnimation(
    parent: _expandController,
    curve: Curves.easeInOutCubic,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomTooltip oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void checkForHide() {
    try {
      timer.cancel();
    } catch (e) {}
    timer = Timer(const Duration(milliseconds: 100), () async {
      if (!isHoverOnChild && !isHoverOnParent) {
        _expandController.reverse().whenComplete(() => _removeOverlay());
      }
    });
  }

  void _removeOverlay() {
    try {
      overlayEntry?.remove();
      overlayEntry = null;
    } catch (e) {}
  }

  void _showOverlay({Offset? cursorPosition}) {
    if (overlayEntry != null) return;
    _removeOverlay();
    overlayEntry = _createOverlayEntry(cursorPosition: cursorPosition);
    Overlay.of(context)?.insert(overlayEntry!);
    _expandController.forward();
  }

  OverlayEntry _createOverlayEntry({Offset? cursorPosition}) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var parentSize = renderBox.size;

    ValueNotifier<Size> size =
        ValueNotifier<Size>(const Size(double.infinity, double.infinity));

    final RenderBox? overlay =
        Navigator.of(context).overlay!.context.findRenderObject() as RenderBox?;
    final Size overlaySize = overlay != null ? overlay.size : Size.zero;

    final Offset parentPosition = renderBox.localToGlobal(Offset.zero);

    Offset offset = const Offset(0.0, 0);

    Offset childPosition = cursorPosition ?? parentPosition + offset;

    CursorTooltipDirection direction = widget.cursorDirection;
    AppearanceStyle appearance = widget.appearanceStyle;
    SideTooltipDirection sideDirection = widget.sideDirection;

    Size maxSize = overlaySize;

    if (appearance.isCursor) {
      if (direction.isFree) {
        final dx = childPosition.dx > overlaySize.width / 2;
        final dy = childPosition.dy > overlaySize.height / 2;
        if (dx && dy) {
          direction = CursorTooltipDirection.leftTop;
        } else if (dx && !dy) {
          direction = CursorTooltipDirection.leftBottom;
        } else if (!dx && !dy) {
          direction = CursorTooltipDirection.rightBottom;
        } else if (!dx && dy) {
          direction = CursorTooltipDirection.rightTop;
        }
      }
      switch (direction) {
        case CursorTooltipDirection.leftBottom:
          double maxWidth =
              ((widget.maxWidth ?? double.infinity) > childPosition.dx
                  ? childPosition.dx
                  : widget.maxWidth!);
          double maxHeight = ((widget.maxHeight ?? double.infinity) >
                  overlaySize.height - childPosition.dy
              ? overlaySize.height - childPosition.dy
              : widget.maxHeight!);
          maxSize = Size(maxWidth, maxHeight);
          break;
        case CursorTooltipDirection.leftTop:
          double maxWidth =
              ((widget.maxWidth ?? double.infinity) > childPosition.dx
                  ? childPosition.dx
                  : widget.maxWidth!);
          double maxHeight =
              ((widget.maxHeight ?? double.infinity) > childPosition.dy
                  ? childPosition.dy
                  : widget.maxHeight!);
          maxSize = Size(maxWidth, maxHeight);
          break;
        case CursorTooltipDirection.rightBottom:
          double maxWidth = ((widget.maxWidth ?? double.infinity) >
                  overlaySize.width - childPosition.dx
              ? overlaySize.width - childPosition.dx
              : widget.maxWidth!);
          double maxHeight = ((widget.maxHeight ?? double.infinity) >
                  overlaySize.height - childPosition.dy
              ? overlaySize.height - childPosition.dy
              : widget.maxHeight!);
          maxSize = Size(maxWidth, maxHeight);
          break;
        case CursorTooltipDirection.rightTop:
          double maxWidth = ((widget.maxWidth ?? double.infinity) >
                  overlaySize.width - childPosition.dx
              ? overlaySize.width - childPosition.dx
              : widget.maxWidth!);
          double maxHeight =
              ((widget.maxHeight ?? double.infinity) > childPosition.dy
                  ? childPosition.dy
                  : widget.maxHeight!);
          break;
        case CursorTooltipDirection.free:
          break;
      }
    } else {
      final center =
          parentPosition + Offset(parentSize.width / 2, parentSize.height / 2);
      final dx = overlaySize.width - center.dx;
      final dy = overlaySize.height - center.dy;
      if (sideDirection.isFree) {
        double min = math.min(
            math.min(dx, dy), math.min(overlaySize.width, overlaySize.height));
        if (min == dx) {
          sideDirection = SideTooltipDirection.left;
        } else if (min == dy) {
          sideDirection = SideTooltipDirection.top;
        } else if (min == overlaySize.width) {
          sideDirection = SideTooltipDirection.right;
        } else if (min == overlaySize.height) {
          sideDirection = SideTooltipDirection.bottom;
        }
      }
      switch (sideDirection) {
        case SideTooltipDirection.left:
          childPosition = parentPosition + Offset(0, parentSize.height / 2);
          double maxWidth =
              ((widget.maxWidth ?? double.infinity) > childPosition.dx
                  ? childPosition.dx
                  : widget.maxWidth!);
          double maxHeight = ((widget.maxHeight ?? double.infinity) >
                  (dy < center.dy ? dy * 2 : center.dy * 2)
              ? (dy < center.dy ? dy * 2 : center.dy * 2)
              : widget.maxHeight!);
          maxSize = Size(maxWidth, maxHeight);
          break;
        case SideTooltipDirection.right:
          childPosition =
              parentPosition + Offset(parentSize.width, parentSize.height / 2);
          double maxWidth = ((widget.maxWidth ?? double.infinity) >
                  overlaySize.width - childPosition.dx
              ? overlaySize.width - childPosition.dx
              : widget.maxWidth!);
          double maxHeight = ((widget.maxHeight ?? double.infinity) >
                  (dy < center.dy ? dy * 2 : center.dy * 2)
              ? (dy < center.dy ? dy * 2 : center.dy * 2)
              : widget.maxHeight!);
          maxSize = Size(maxWidth, maxHeight);
          break;
        case SideTooltipDirection.top:
          childPosition = parentPosition + Offset(parentSize.width / 2, 0);
          double maxWidth = ((widget.maxWidth ?? double.infinity) >
                  (dx < center.dx ? dx * 2 : center.dx * 2)
              ? (dx < center.dx ? dx * 2 : center.dx * 2)
              : widget.maxWidth!);
          double maxHeight =
              ((widget.maxHeight ?? double.infinity) > childPosition.dy
                  ? childPosition.dy
                  : widget.maxHeight!);
          maxSize = Size(maxWidth, maxHeight);
          break;
        case SideTooltipDirection.bottom:
          childPosition =
              parentPosition + Offset(parentSize.width / 2, parentSize.height);
          double maxWidth = ((widget.maxWidth ?? double.infinity) >
                  (dx < center.dx ? dx * 2 : center.dx * 2)
              ? (dx < center.dx ? dx * 2 : center.dx * 2)
              : widget.maxWidth!);
          double maxHeight = ((widget.maxHeight ?? double.infinity) >
                  overlaySize.height - childPosition.dy
              ? overlaySize.height - childPosition.dy
              : widget.maxHeight!);
          maxSize = Size(maxWidth, maxHeight);
          break;
        case SideTooltipDirection.free:
          break;
      }
    }

    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned(
            child: TooltipSingleChildLayout(
              cursorDirection: direction,
              appearanceStyle: appearance,
              sideDirection: sideDirection,
              parentPosition: parentPosition,
              animation: _expandAnimation,
              size: size,
              maxSize: maxSize,
              screenSize: overlaySize,
              childPosition: childPosition,
              child: MouseRegion(
                onEnter: (e) {
                  setState(() {
                    isHoverOnChild = true;
                  });
                },
                onExit: (e) {
                  setState(() {
                    isHoverOnChild = false;
                  });
                  checkForHide();
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: maxSize.width,
                        maxHeight: maxSize.height - 15,
                      ),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: widget.withShadows
                            ? [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  spreadRadius: 2,
                                  blurRadius: 9,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ]
                            : [],
                      ),
                      padding: widget.padding,
                      child: content,
                    ),
                    if (appearance.isSide)
                      ClipPath(
                        clipper: ArrowClip(),
                        child: Container(
                          height: 5,
                          width: 15,
                          decoration: BoxDecoration(
                            color: color,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get content {
    if (widget.contentWidget != null) {
      return widget.contentWidget!;
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: widget.child,
      onExit: (v) {
        setState(() {
          isHoverOnParent = false;
        });
        checkForHide();
      },
      onEnter: (v) {
        setState(() {
          isHoverOnParent = true;
        });
        _showOverlay(cursorPosition: v.position);
      },
    );
  }
}

typedef TSL = TooltipSingleChildLayout;

class TooltipSingleChildLayout extends StatelessWidget {
  final Widget child;
  final ValueNotifier<Size> size;
  final Size screenSize;
  final Size maxSize;
  final Offset parentPosition;
  final Offset childPosition;
  final Animation<double> animation;
  final CursorTooltipDirection cursorDirection;
  final AppearanceStyle appearanceStyle;
  final SideTooltipDirection sideDirection;

  const TooltipSingleChildLayout({
    Key? key,
    required this.child,
    required this.size,
    required this.maxSize,
    required this.screenSize,
    required this.parentPosition,
    required this.childPosition,
    required this.animation,
    this.cursorDirection = CursorTooltipDirection.leftBottom,
    this.appearanceStyle = AppearanceStyle.cursor,
    this.sideDirection = SideTooltipDirection.top,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomSingleChildLayout(
      delegate: _TooltipChildDelegate(
        size: size,
        maxSize: maxSize,
        screenSize: screenSize,
        parentPosition: parentPosition,
        childPosition: childPosition,
        cursorDirection: cursorDirection,
        appearanceStyle: appearanceStyle,
        sideDirection: sideDirection,
      ),
      child: FadeTransition(
        opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.7, end: 1.0).animate(animation),
          child: Material(
            // elevation: 4,
            color: Colors.transparent,
            child: child,
          ),
        ),
      ),
    );
  }
}

class _TooltipChildDelegate extends SingleChildLayoutDelegate {
  final ValueNotifier<Size> size;
  final Size screenSize;
  final Size maxSize;
  final Offset parentPosition;
  final Offset childPosition;
  final CursorTooltipDirection cursorDirection;
  final AppearanceStyle appearanceStyle;
  final SideTooltipDirection sideDirection;

  _TooltipChildDelegate({
    required this.size,
    required this.maxSize,
    required this.screenSize,
    required this.parentPosition,
    required this.childPosition,
    this.cursorDirection = CursorTooltipDirection.leftBottom,
    this.appearanceStyle = AppearanceStyle.cursor,
    this.sideDirection = SideTooltipDirection.top,
  }) : super(relayout: size);

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(screenSize.width, screenSize.height);
  }

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return constraints.copyWith(
        maxHeight: maxSize.height, maxWidth: maxSize.width);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    final offset = moveTop(childSize);
    return childPosition + offset;
  }

  Offset moveTop(Size childSize) {
    // if (direction.isUp)
    if (appearanceStyle.isCursor) {
      switch (cursorDirection) {
        case CursorTooltipDirection.leftBottom:
          return Offset(-childSize.width, 0);
        case CursorTooltipDirection.leftTop:
          return Offset(-childSize.width, -childSize.height);
        case CursorTooltipDirection.rightBottom:
          return const Offset(0, 0);
        case CursorTooltipDirection.rightTop:
          return Offset(0, -childSize.height);
        case CursorTooltipDirection.free:
          break;
      }
    } else {
      switch (sideDirection) {
        case SideTooltipDirection.left:
          return Offset(-childSize.width, -childSize.height / 2);
        case SideTooltipDirection.right:
          return Offset(0, -childSize.height / 2);
        case SideTooltipDirection.top:
          return Offset(-childSize.width / 2, -childSize.height);
        case SideTooltipDirection.bottom:
          return Offset(-childSize.width / 2, 0);
        case SideTooltipDirection.free:
          break;
      }
    }

    return Offset.zero;
  }

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return true;
  }
}

class ArrowClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // path.moveTo(0, size.height);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
