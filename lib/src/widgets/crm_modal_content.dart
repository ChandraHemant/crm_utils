import 'package:crm_utils/src/widgets/crm_modal_container.dart';
import 'package:flutter/material.dart';

/// Widget of Bootstrap Modal Content
class CRMModalContent extends StatelessWidget {
  /// Construct [CRMModalContent]
  const CRMModalContent({
    Key? key,
    this.decoration,
    this.padding = const EdgeInsets.all(20.0),
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.children = const [],
  }) : super(key: key);

  /// define decoration [CRMModalContent]
  final Decoration? decoration;

  final EdgeInsets padding;

  /// define crossAxisAlignment of [CRMModalContent]
  final CrossAxisAlignment crossAxisAlignment;

  /// define mainAxisAlignement of [CRMModalContent]
  final MainAxisAlignment mainAxisAlignment;

  /// define children of [CRMModalContent]
  final List<CRMModalContainer> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding,
      decoration: decoration ?? const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: mainAxisAlignment,
        children: children,
      ),
    );
  }
}