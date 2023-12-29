import 'package:crm_utils/src/widgets/crm_modal_dialog.dart';
import 'package:flutter/material.dart';

/// Widget of Bootstrap Modal
class CRMModal extends StatelessWidget {
  /// Construct [CRMModal]
  const CRMModal({
    Key? key,
    required this.context,
    required this.dialog,
  }) : super(key: key);

  /// define context of [CRMModal]
  final BuildContext context;

  /// define diaolog of [CRMModal]
  final CRMModalDialog dialog;

  @override
  Widget build(BuildContext context) {
    return Container(child: dialog);
  }
}
