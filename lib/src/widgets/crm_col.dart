import 'package:crm_utils/crm_utils.dart';
import 'package:crm_utils/src/crm_flutter_utils.dart';
import 'package:flutter/material.dart';

/// Use [CRMCol] to define column in [CRMRow]
///
/// If [sizes] is empty will automatically using [Col.col_12] in all screen device or all [BreakPoint]
class CRMCol extends StatelessWidget {
  const CRMCol({
    Key? key,
    this.visibility = CRMVisibility.block,
    this.sizes = const ColScreen(),
    this.order = const ColOrder(),
    this.offset = const ColScreen(),
    this.color,
    this.height,
    this.constraints,
    this.padding,
    this.margin,
    this.alignment,
    this.decoration,
    this.foregroundDecoration,
    this.transform,
    this.transformAlignment,
    this.clipBehavior = Clip.none,
    this.child,
  }) : super(key: key);

  /// If you need to hide [CRMCol] on some screen device or [BreakPoint]
  /// use [CRMVisibility]
  /// Example:
  /// - [CRMVisibility.hiddenSm] will hide in small screen device or [BreakPoint.stateSm]
  ///
  final CRMVisibility visibility;

  /// Set width of [CRMCol] base on [BreakPoint] using [ColScreen]
  /// if [sizes] is empty, system automatically using [Col.col_12] in all breakpoint
  final ColScreen sizes;

  /// If you need to change order of [CRMCol] in some [BreakPoint]
  /// [ColOrder] is very helpful
  final ColOrder order;

  /// Set offset of [CRMCol] base on [BreakPoint] using [ColScreen]
  final ColScreen offset;

  /// Color of Container widget in [CRMCol]
  final Color? color;

  /// Constraints of Container widget in [CRMCol]
  final BoxConstraints? constraints;

  /// AlignmentGeometry of Container widget in [CRMCol]
  final AlignmentGeometry? alignment;

  /// Height of Container widget in [CRMCol]
  final double? height;

  /// Padding of Container widget in [CRMCol]
  final EdgeInsetsGeometry? padding;

  /// Margin of Container widget in [CRMCol]
  final EdgeInsets? margin;

  /// Decoration of Container widget in [CRMCol]
  final Decoration? decoration;

  /// Foreground Decoration of Container widget in [CRMCol]
  final Decoration? foregroundDecoration;

  /// Matrix4 Transform of Container widget in [CRMCol]
  final Matrix4? transform;

  /// AlignmentGeometry of Container widget in [CRMCol]
  final AlignmentGeometry? transformAlignment;

  /// Clip of Container widget in [CRMCol]
  final Clip clipBehavior;

  /// Child of [CRMCol]
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    BreakPoint breakPoint = BreakPoint.of(context);

    return !visibility.breakPoints.contains(breakPoint.state)
        ? Container(width: 0)
        : LayoutBuilder(
      builder: (context, constraints) {
        return Container(
            alignment: alignment,
            height: height,
            padding: padding,
            margin: margin,
            color: color,
            constraints: constraints,
            decoration: decoration,
            foregroundDecoration: foregroundDecoration,
            transform: transform,
            transformAlignment: transformAlignment,
            clipBehavior: clipBehavior,
            child: Container(child: child));
      },
    );
  }
}