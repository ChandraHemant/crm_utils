import 'package:crm_utils/src/crm_flutter_utils.dart';
import 'package:crm_utils/src/utils/crm_utils_colcalc.dart';
import 'package:crm_utils/src/widgets/crm_col.dart';
import 'package:flutter/material.dart';

class _CRMCol extends StatelessWidget {
  const _CRMCol(this.row, this.index, this.col);

  final CRMRow row;

  final int index;

  final CRMCol col;

  @override
  Widget build(BuildContext context) {
    ColCalc calc = ColCalc(context, col.sizes, col.offset);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
            width: calc.width!.width / 100.0 * constraints.maxWidth,
            padding: row.gutter,
            margin: EdgeInsets.only(
              left: calc.widthOffset!.width / 100.0 * constraints.maxWidth,
            ),
            child: col);
      },
    );
  }
}

/// Container of Grid System [CRMRow] based on Bootstrap v5.0 Grid System
///
/// For more information visit about Bootstrap v5.0 Grid System visit:
/// https://getbootstrap.com/docs/5.0/layout/grid/
class CRMRow extends StatelessWidget {
  const CRMRow({
    Key? key,
    this.color,
    this.visibility = CRMVisibility.block,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.gutter,
    this.constraints,
    this.height,
    this.alignment,
    this.padding,
    this.margin,
    this.decoration,
    this.foregroundDecoration,
    this.transform,
    this.transformAlignment,
    this.clipBehavior = Clip.none,
    this.children = const [],
  }) : super(key: key);

  /// If you need to hide [CRMCol] on some screen device or [BreakPoint]
  /// use [CRMVisibility]
  /// Example:
  /// - [CRMVisibility.hiddenSm] will hide in small screen device or [BreakPoint.stateSm]
  ///
  final CRMVisibility visibility;

  /// Set padding between columns of [CRMRow]
  final EdgeInsetsGeometry? gutter;

  /// Set color between columns of [CRMRow]
  final Color? color;

  /// Constraints of Container widget in [CRMRow]
  final BoxConstraints? constraints;

  /// Height of Container widget in [CRMRow]
  final double? height;

  /// Alignment of Container widget in [CRMRow]
  final AlignmentGeometry? alignment;

  /// Padding of Container widget in [CRMRow]
  final EdgeInsetsGeometry? padding;

  /// Margin of Container widget in [CRMRow]
  final EdgeInsetsGeometry? margin;

  /// Decoration of Container widget in [CRMRow]
  final Decoration? decoration;

  /// Foreground Decoration of Container widget in [CRMRow]
  final Decoration? foregroundDecoration;

  /// Matrix4 Transform of Container widget in [CRMRow]
  final Matrix4? transform;

  /// Transform Alignment of Container widget in [CRMRow]
  final AlignmentGeometry? transformAlignment;

  /// Clip Behavior of Container widget in [CRMRow]
  final Clip clipBehavior;

  /// CrossAxisAlignment children or columns widget in [CRMRow]
  final WrapCrossAlignment crossAxisAlignment;

  /// Children or Column widget in [CRMRow]
  final List<CRMCol> children;

  @override
  Widget build(BuildContext context) {
    BreakPoint breakPoint = BreakPoint.of(context);

    List<_CRMCol> childrens = List<_CRMCol>.generate(
        children.length, (index) => _CRMCol(this, index + 1, children[index]));

    childrens.sort((_CRMCol a, _CRMCol b) {
      BreakPoint breakPoint = BreakPoint.of(context);
      if (breakPoint.state == BreakPoint.stateXxl) {
        if (b.col.order.xxl != null) {
          return a.index >= b.col.order.xxl!.toInt() ? 1 : 0;
        }
      }
      if (breakPoint.state == BreakPoint.stateXl) {
        if (b.col.order.xl != null) {
          return a.index >= b.col.order.xl!.toInt() ? 1 : 0;
        }
      }
      if (breakPoint.state == BreakPoint.stateLg) {
        if (b.col.order.lg != null) {
          return a.index >= b.col.order.lg!.toInt() ? 1 : 0;
        }
      }
      if (breakPoint.state == BreakPoint.stateMd) {
        if (b.col.order.md != null) {
          return a.index >= b.col.order.md!.toInt() ? 1 : 0;
        }
      }
      if (breakPoint.state == BreakPoint.stateSm) {
        if (b.col.order.sm != null) {
          return a.index >= b.col.order.sm!.toInt() ? 1 : 0;
        }
      }
      return a.index > b.index ? 1 : 0;
    });

    return !visibility.breakPoints.contains(breakPoint.state)
        ? Container(width: 0)
        : Row(
      children: [
        Expanded(child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              color: color,
              constraints: constraints,
              height: height,
              width: constraints.maxWidth,
              alignment: alignment,
              padding: padding,
              margin: margin,
              decoration: decoration,
              foregroundDecoration: foregroundDecoration,
              transform: transform,
              transformAlignment: transformAlignment,
              clipBehavior: clipBehavior,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    crossAxisAlignment: crossAxisAlignment,
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.start,
                    children: childrens,
                  )
                ],
              ),
            );
          },
        ))
      ],
    );
  }
}