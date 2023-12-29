import 'package:crm_utils/crm_utils.dart';
import 'package:flutter/cupertino.dart';

class CRMDropdownMenu extends StatelessWidget {
  const CRMDropdownMenu({
    Key? key,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.header,
    this.children = const [],
  }) : super(key: key);

  final CrossAxisAlignment crossAxisAlignment;

  final CRMDropdownHeader? header;

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    List<Widget> childrens = List<Widget>.from([]);
    if (header != null) childrens.add(header!);

    childrens.addAll(children);

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: childrens,
    );
  }
}
