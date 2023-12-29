import 'package:crm_utils/crm_utils.dart';
import 'package:flutter/material.dart';

/// Widget bootstrap badge
class CRMBadge extends StatelessWidget {
  /// Constructor [CRMBadge]
  const CRMBadge({
    Key? key,
    this.style = CRMBadgeStyle.secondary,
    this.size = CRMBadgeSize.medium,
    this.child,
  }) : super(key: key);

  /// define style of [CRMBadge]
  final CRMBadgeStyle style;

  /// define size of [CRMBadge]
  final CRMBadgeSize size;

  /// define child [CRMBadge]
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: size.padding,
      margin: size.margin,
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: size.borderRadius,
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          color: style.color,
          fontSize: size.fontSize,
        ),
        child: Container(
          child: child,
        ),
      ),
    );
  }
}
