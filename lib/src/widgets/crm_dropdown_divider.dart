import 'package:crm_utils/src/crm_flutter_utils.dart';
import 'package:flutter/material.dart';

class CRMDropdownDivider extends StatelessWidget {
  const CRMDropdownDivider({
    Key? key,
    this.decoration,
  }) : super(key: key);

  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration ?? const BoxDecoration(
              border: Border(bottom: BorderSide(color: CRMColor.borderColor))),
    );
  }
}
