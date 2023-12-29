import 'package:crm_utils/src/crm_flutter_utils.dart';
import 'package:flutter/material.dart';

/// Class for custom [CRMButton]
class CRMButtonStyle {
  final Color? _disabledBackgroundColor;

  final Color? _disabledColor;

  final Color? _disabledBorderColor;

  final Color? _hoverColor;

  final Color? _focusBackgroundColor;

  final Color? _focusColor;

  // Constructor CRMButtonStyle
  const CRMButtonStyle({
    required this.color,
    required this.backgroundColor,
    this.borderColor = Colors.transparent,
    this.borderRadius = BorderRadius.zero,
    Color? hoverColor,
    this.hoverBackgroundColor,
    Color? disabledBackgroundColor,
    Color? disabledColor,
    Color? disabledBorderColor,
    Color? focusBackgroundColor,
    Color? focusColor,
  })  : _disabledBackgroundColor = disabledBackgroundColor,
        _disabledColor = disabledColor,
        _disabledBorderColor = disabledBorderColor,
        _hoverColor = hoverColor,
        _focusBackgroundColor = focusBackgroundColor,
        _focusColor = focusColor;

  /// define color of [CRMButton]
  final Color color;

  /// define borderColor of [CRMButton]
  final Color borderColor;

  /// define borderRadius of [CRMButton]
  final BorderRadius borderRadius;

  /// define backgroundColor of [CRMButton]
  final Color backgroundColor;

  final Color? hoverBackgroundColor;

  Color get disabledBackgroundColor {
    if (_disabledBackgroundColor == null) {
      return backgroundColor.withOpacity(0.5);
    }

    return _disabledBorderColor!;
  }

  Color get disabledColor {
    if (_disabledColor == null) return color.withOpacity(0.5);

    return _disabledColor;
  }

  Color get disabledBorderColor {
    if (_disabledBorderColor == null) return borderColor.withOpacity(0.5);

    return _disabledBorderColor;
  }

  Color get hoverColor {
    if (_hoverColor == null) return color;

    return _hoverColor;
  }

  Color get focusColor {
    if (_focusColor == null) return color;

    return _focusColor;
  }

  Color get focusBackgroundColor {
    if (_focusBackgroundColor == null) return backgroundColor;

    return _focusBackgroundColor;
  }

  /// define style primary button
  static const CRMButtonStyle primary = CRMButtonStyle(
      color: Colors.white,
      backgroundColor: CRMColor.primary,
      borderRadius: BorderRadius.all(Radius.circular(3.0)));

  /// define style secondary button
  static const CRMButtonStyle secondary = CRMButtonStyle(
      color: Colors.white,
      backgroundColor: CRMColor.secondary,
      borderRadius: BorderRadius.all(Radius.circular(3.0)));

  /// define style danger button
  static const CRMButtonStyle danger = CRMButtonStyle(
      color: Colors.white,
      backgroundColor: CRMColor.danger,
      borderRadius: BorderRadius.all(Radius.circular(3.0)));

  /// define style success button
  static const CRMButtonStyle success = CRMButtonStyle(
      color: Colors.white,
      backgroundColor: CRMColor.success,
      borderRadius: BorderRadius.all(Radius.circular(3.0)));

  /// define style warning button
  static const CRMButtonStyle warning = CRMButtonStyle(
      color: Colors.white,
      backgroundColor: CRMColor.warning,
      borderRadius: BorderRadius.all(Radius.circular(3.0)));

  /// define style info button
  static const CRMButtonStyle info = CRMButtonStyle(
      color: Colors.white,
      backgroundColor: CRMColor.info,
      borderRadius: BorderRadius.all(Radius.circular(3.0)));

  /// define style light button
  static const CRMButtonStyle light = CRMButtonStyle(
      color: Colors.black,
      backgroundColor: CRMColor.light,
      borderRadius: BorderRadius.all(Radius.circular(3.0)));

  /// define style dark button
  static const CRMButtonStyle dark = CRMButtonStyle(
      color: Colors.white,
      backgroundColor: CRMColor.dark,
      borderRadius: BorderRadius.all(Radius.circular(3.0)));

  /// define style outlinePrimary button
  static const CRMButtonStyle outlinePrimary = CRMButtonStyle(
      color: CRMColor.primary,
      borderColor: CRMColor.primary,
      backgroundColor: Colors.white,
      hoverColor: Colors.white,
      hoverBackgroundColor: CRMColor.primary,
      focusColor: Colors.white,
      focusBackgroundColor: CRMColor.primary,
      borderRadius: BorderRadius.all(Radius.circular(3.0)));

  /// define style outlineSecondary button
  static const CRMButtonStyle outlineSecondary = CRMButtonStyle(
      color: CRMColor.secondary,
      borderColor: CRMColor.secondary,
      backgroundColor: Colors.white,
      hoverColor: Colors.white,
      hoverBackgroundColor: CRMColor.secondary,
      focusColor: Colors.white,
      focusBackgroundColor: CRMColor.secondary,
      borderRadius: BorderRadius.all(Radius.circular(3.0)));

  /// define style outlineSuccess button
  static const CRMButtonStyle outlineSuccess = CRMButtonStyle(
      color: CRMColor.success,
      borderColor: CRMColor.success,
      backgroundColor: Colors.white,
      hoverColor: Colors.white,
      hoverBackgroundColor: CRMColor.success,
      focusColor: Colors.white,
      focusBackgroundColor: CRMColor.success,
      borderRadius: BorderRadius.all(Radius.circular(3.0)));

  /// define style outlineDanger button
  static const CRMButtonStyle outlineDanger = CRMButtonStyle(
      color: CRMColor.danger,
      borderColor: CRMColor.danger,
      backgroundColor: Colors.white,
      hoverColor: Colors.white,
      hoverBackgroundColor: CRMColor.danger,
      focusColor: Colors.white,
      focusBackgroundColor: CRMColor.danger,
      borderRadius: BorderRadius.all(Radius.circular(3.0)));

  /// define style outlineWarning button
  static const CRMButtonStyle outlineWarning = CRMButtonStyle(
      color: CRMColor.warning,
      borderColor: CRMColor.warning,
      backgroundColor: Colors.white,
      hoverColor: Colors.white,
      hoverBackgroundColor: CRMColor.warning,
      focusColor: Colors.white,
      focusBackgroundColor: CRMColor.warning,
      borderRadius: BorderRadius.all(Radius.circular(3.0)));

  /// define style outlineInfo
  static const CRMButtonStyle outlineInfo = CRMButtonStyle(
      color: CRMColor.info,
      borderColor: CRMColor.info,
      backgroundColor: Colors.white,
      hoverColor: Colors.white,
      hoverBackgroundColor: CRMColor.info,
      focusColor: Colors.white,
      focusBackgroundColor: CRMColor.info,
      borderRadius: BorderRadius.all(Radius.circular(3.0)));

  /// define style outlineLight
  static const CRMButtonStyle outlineLight = CRMButtonStyle(
      color: CRMColor.light,
      borderColor: CRMColor.light,
      backgroundColor: CRMColor.dark,
      hoverColor: CRMColor.dark,
      hoverBackgroundColor: CRMColor.light,
      focusColor: CRMColor.dark,
      focusBackgroundColor: CRMColor.light,
      borderRadius: BorderRadius.all(Radius.circular(3.0)));

  /// define style outlineDark
  static const CRMButtonStyle outlineDark = CRMButtonStyle(
      color: CRMColor.dark,
      borderColor: CRMColor.dark,
      backgroundColor: Colors.white,
      hoverColor: Colors.white,
      hoverBackgroundColor: CRMColor.dark,
      focusColor: Colors.white,
      focusBackgroundColor: CRMColor.dark,
      borderRadius: BorderRadius.all(Radius.circular(3.0)));
}
