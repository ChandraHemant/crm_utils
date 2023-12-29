import 'package:flutter/material.dart';

class CRMDropdownHeader extends StatelessWidget {
  const CRMDropdownHeader({
    Key? key,
    this.padding = const EdgeInsets.fromLTRB(15, 8, 15, 8),
    this.child,
    this.textStyle,
    this.decoration,
  }) : super(key: key);

  final EdgeInsetsGeometry padding;

  final TextStyle? textStyle;

  final Decoration? decoration;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        color: Color(0xff6c757d),
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
      ).merge(textStyle),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth != double.infinity
                ? constraints.maxWidth
                : null,
            padding: padding,
            decoration: decoration ?? const BoxDecoration(color: Colors.white),
            child: child,
          );
        },
      ),
    );
  }
}
