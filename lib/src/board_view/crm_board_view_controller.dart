import 'package:crm_utils/crm_utils.dart';
import 'package:flutter/animation.dart';


class CRMBoardViewController{

  CRMBoardViewController();

  late CRMBoardViewState state;

  Future<void> animateTo(int index,{Duration? duration,Curve? curve})async{
    double offset = index * state.widget.width;
    if (state.boardViewController.hasClients) {
      await state.boardViewController.animateTo(
          offset, duration: duration!, curve: curve!);
    }
  }
}