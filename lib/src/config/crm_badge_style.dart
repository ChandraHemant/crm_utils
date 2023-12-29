import 'package:crm_utils/src/crm_flutter_utils.dart';
import 'package:flutter/material.dart';

/// Class style of [CRMBadge]
class CRMBadgeStyle {
  /// Constructor [CRMBadgeStyle]
  const CRMBadgeStyle({
    this.color,
    this.backgroundColor,
  });

  /// define color [CRMBadge]
  final Color? color;

  /// define backgroundColor [CRMBadge]
  final Color? backgroundColor;

  /// define primary badge
  static const CRMBadgeStyle primary = CRMBadgeStyle(
    color: Colors.white,
    backgroundColor: CRMColor.primary,
  );

  /// define secondary badge
  static const CRMBadgeStyle secondary = CRMBadgeStyle(
    color: Colors.white,
    backgroundColor: CRMColor.secondary,
  );

  /// define danger badge
  static const CRMBadgeStyle danger = CRMBadgeStyle(
    color: Colors.white,
    backgroundColor: CRMColor.danger,
  );

  /// define success badge
  static const CRMBadgeStyle success = CRMBadgeStyle(
    color: Colors.white,
    backgroundColor: CRMColor.success,
  );

  /// define warning badge
  static const CRMBadgeStyle warning = CRMBadgeStyle(
    color: Colors.white,
    backgroundColor: CRMColor.warning,
  );

  /// define info badge
  static const CRMBadgeStyle info = CRMBadgeStyle(
    color: Colors.white,
    backgroundColor: CRMColor.info,
  );

  /// define light badge
  static const CRMBadgeStyle light = CRMBadgeStyle(
    color: Colors.black,
    backgroundColor: CRMColor.light,
  );

  /// define dark badge
  static const CRMBadgeStyle dark = CRMBadgeStyle(
    color: Colors.white,
    backgroundColor: CRMColor.dark,
  );
}
