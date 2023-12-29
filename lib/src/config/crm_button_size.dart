import 'package:flutter/material.dart';

/// Class to create size of [CRMButton]
class CRMButtonSize {
  /// Constructor of [CRMButtonSize]
  const CRMButtonSize(
      {this.padding, this.fontSize, this.iconSize, this.spaceLabelIcon = 5.0});

  /// define padding of [CRMButton]
  final EdgeInsets? padding;

  /// define fontSize of [CRMButton]
  final double? fontSize;

  /// define iconSize of [CRMButton]
  final double? iconSize;

  /// define spaceLabelIcon of [CRMButton]
  final double spaceLabelIcon;

  /// define size buttonIconSm button
  static const CRMButtonSize btnIconSm = CRMButtonSize(
    iconSize: 10.0,
    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
  );

  /// define size btnIconMd button
  static const CRMButtonSize btnIconMd = CRMButtonSize(
    iconSize: 14.0,
    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
  );

  /// define size btnIconLg button
  static const CRMButtonSize btnIconLg = CRMButtonSize(
    iconSize: 22.0,
    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
  );

  /// define size btnSm button
  static const CRMButtonSize btnSm = CRMButtonSize(
    iconSize: 10.0,
    fontSize: 10.0,
    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
  );

  /// define size btnMd button
  static const CRMButtonSize btnMd = CRMButtonSize(
    padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
    fontSize: 12.0,
    iconSize: 14.0,
  );

  /// define size btnLg button
  static const CRMButtonSize btnLg = CRMButtonSize(
      iconSize: 18.0,
      fontSize: 18.0,
      padding: EdgeInsets.fromLTRB(18, 8, 18, 8),
      spaceLabelIcon: 10.0);
}
