import 'package:crm_utils/src/config/crm_modal_size.dart';
import 'package:crm_utils/src/crm_flutter_utils.dart';
import 'package:flutter/material.dart';

/// Widget of Bootstrap Modal Dialog
class CRMModalDialog extends StatelessWidget {
  /// Construct [CRMModalDialog]
  const CRMModalDialog({
    Key? key,
    this.size = CRMModalSize.md,
    this.child,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.center,
  }) : super(key: key);

  /// define size of [CRMModalDialog]
  final CRMModalSize size;

  /// define child of [CRMModalDialog]
  final Widget? child;

  /// define crossAxisAlignment of [CRMModalDialog]
  final CrossAxisAlignment crossAxisAlignment;

  /// define mainAxisAlignment of [CRMModalDialog]
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    BreakPoint breakPoint = BreakPoint.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          elevation: 0,
          backgroundColor: const Color(0x00000000),
          child: SizedBox(
            height: constraints.maxHeight,
            child: Row(
              crossAxisAlignment: crossAxisAlignment,
              children: [
                Expanded(child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: mainAxisAlignment,
                      children: [
                        SizedBox(
                          width: size.breakPoints.contains(breakPoint.state) ? size.width : constraints.maxWidth,
                          child: child,
                        )
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
        );
      },
    );
  }
}