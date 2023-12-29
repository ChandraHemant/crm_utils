import 'package:crm_utils/src/crm_flutter_utils.dart';
import 'package:flutter/material.dart';

class CRMSelectBoxStyle {
  const CRMSelectBoxStyle({
    this.borderRadius = const BorderRadius.all(Radius.circular(5.0)),
    this.fontSize = 12.0,
    this.selectedColor = const Color(0xfff1f1f1),
    this.selectedTextColor = const Color(0xff212529),
    this.textColor = const Color(0xff212529),
    this.hintTextColor = Colors.grey,
    this.border,
    this.disabledColor = const Color(0xffe7e7e7),
    this.disabledTextColor = const Color(0xffdedede),
    this.backgroundColor = Colors.white,
    this.arrowIcon = Icons.arrow_drop_down,
    this.focusedBoxShadow = const [],
    this.focusedBorder,
    this.focusedTextColor = CRMColor.primary,
    this.searchColor = Colors.white,
    this.searchTextColor = const Color(0xff212529)
  });

  /// define border radius of [CRMSelectBox]
  final BorderRadiusGeometry? borderRadius;

  /// define color of [CRMSelectBox]
  final Color textColor;

  /// define hintTextColor of [CRMSelectBox]
  final Color hintTextColor;

  /// define selectedBackgroundColor of [CRMSelectBox]
  final Color selectedColor;

  /// define selectedColor of [CRMSelectBox]
  final Color selectedTextColor;

  /// define of disabledColor of [CRMSelectBox]
  final Color disabledColor;

  final Color disabledTextColor;

  /// define of backgroundColor of [CRMSelectBox]
  final Color backgroundColor;

  /// define borderColor of [CRMSelectBox]
  final BoxBorder? border;

  /// define fontSize of [CRMSelectBox]
  final double fontSize;

  /// defien arrowIcon of [CRMSelectBox]
  final IconData arrowIcon;

  final List<BoxShadow> focusedBoxShadow;

  final BoxBorder? focusedBorder;

  final Color focusedTextColor;

  final Color searchColor;

  final Color searchTextColor;

  static const CRMSelectBoxStyle bordered = CRMSelectBoxStyle(
    border: Border(
      top: BorderSide(color: CRMColor.borderColor),
      bottom: BorderSide(color: CRMColor.borderColor),
      left: BorderSide(color: CRMColor.borderColor),
      right: BorderSide(color: CRMColor.borderColor),
    ),
    focusedBoxShadow: [
      BoxShadow(
        color: CRMColor.primaryShadow,
        offset: Offset(0, 0),
        spreadRadius: 2.5,
      )
    ],
    focusedBorder: Border(
      top: BorderSide(color: CRMColor.primary),
      bottom: BorderSide(color: CRMColor.primary),
      left: BorderSide(color: CRMColor.primary),
      right: BorderSide(color: CRMColor.primary),
    )
  );
}
