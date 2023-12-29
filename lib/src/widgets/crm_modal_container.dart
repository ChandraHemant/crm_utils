
import 'package:crm_utils/src/crm_flutter_utils.dart';
import 'package:flutter/material.dart';

/// Widget of Bootstrap Modal Header, Body, Footer
class CRMModalContainer extends StatelessWidget {
  /// Construct [CRMModalContainer]
  const CRMModalContainer({
    Key? key,
    this.title,
    this.titleStyle,
    this.padding,
    this.child,
    this.actions = const [],
    this.closeButton = false,
    this.onClose,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
  }) : super(key: key);

  /// define title of [CRMModalContainer]
  final Widget? title;

  /// define titleStyle of [CRMModalContainer]
  final TextStyle? titleStyle;

  /// define closeButton of [CRMModalContainer]
  final bool closeButton;

  /// define padding of [CRMModalContainer]
  final EdgeInsets? padding;

  /// define child of [CRMModalContainer]
  final Widget? child;

  /// define actions of [CRMModalContainer]
  final List<Widget> actions;

  /// define onClose of [CRMModalContainer]
  final VoidCallback? onClose;

  /// define crossAxisAlignment of [CRMModalContainer]
  final CrossAxisAlignment crossAxisAlignment;

  /// define mainAxisAlignment of [CRMModalContainer]
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Row(
          children: [
            title == null ? Container() : DefaultTextStyle(
              style: const TextStyle(
                fontSize: 16.0,
                color: CRMColor.color,
                fontWeight: FontWeight.bold,
              ).merge(titleStyle),
              child: Expanded(
                child: Container(
                  padding: padding ?? const EdgeInsets.all(15.0),
                  child: title
                )
              ),
            ),
            !closeButton ? Container(width: 0) : Container(
              margin: EdgeInsets.only(right: padding != null ? padding!.right : 15.0),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    if (onClose != null) {
                      onClose!();
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  child: const Icon(Icons.close, size: 14.0, color: CRMColor.color),
                ),
              ),
            )
          ],
        ),
        child == null ? Container() : Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: CRMColor.borderColor)
            )
          ),
        ),
        child == null ? Container() : Container(
          padding: padding ?? const EdgeInsets.all(15.0),
          child: child,
        ),
        actions.isEmpty ? Container() : Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: CRMColor.borderColor)
            )
          ),
        ),
        actions.isEmpty ? Container() : Container(
          padding: padding ?? const EdgeInsets.all(15.0),
          child: Row(
            crossAxisAlignment: crossAxisAlignment,
            mainAxisAlignment: mainAxisAlignment,
            children: actions,
          ),
        )
      ],
    );
  }
}