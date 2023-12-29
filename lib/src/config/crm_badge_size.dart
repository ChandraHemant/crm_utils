import 'package:flutter/material.dart';

/// Class for size of [CRMBadge]
class CRMBadgeSize {
  /// Constructor of [CRMBadgeSize]
  const CRMBadgeSize({
    this.padding,
    this.margin,
    this.fontSize,
    this.borderRadius,
  });

  /// define fontSize of [CRMBadge]
  final double? fontSize;

  /// define padding of [CRMBadge]
  final EdgeInsets? padding;

  /// define margin of [CRMBadge]
  final EdgeInsets? margin;

  /// define borderRadius of [CRMBadge]
  final BorderRadiusGeometry? borderRadius;

  /// define rounded badge
  static const CRMBadgeSize rounded = CRMBadgeSize(
      margin: EdgeInsets.only(right: 5.0, bottom: 5.0),
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
      fontSize: 10.0,
      borderRadius: BorderRadius.all(Radius.circular(100.0)));

  /// define small badge
  static const CRMBadgeSize small = CRMBadgeSize(
      margin: EdgeInsets.only(right: 5.0, bottom: 5.0),
      padding: EdgeInsets.only(left: 3.0, right: 3.0, top: 2.0, bottom: 2.0),
      fontSize: 9.0,
      borderRadius: BorderRadius.all(Radius.circular(50.0)));

  /// define medium badge
  static const CRMBadgeSize medium = CRMBadgeSize(
      margin: EdgeInsets.only(right: 5.0, bottom: 5.0),
      padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 3.0, bottom: 3.0),
      fontSize: 10.0,
      borderRadius: BorderRadius.all(Radius.circular(50.0)));

  /// define large badge
  static const CRMBadgeSize large = CRMBadgeSize(
      margin: EdgeInsets.only(right: 5.0, bottom: 5.0),
      padding: EdgeInsets.only(left: 7.0, right: 7.0, top: 5.0, bottom: 5.0),
      fontSize: 14.0,
      borderRadius: BorderRadius.all(Radius.circular(50.0)));
}
