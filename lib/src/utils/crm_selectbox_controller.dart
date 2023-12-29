import 'package:crm_utils/src/utils/crm_selectbox_option.dart';

/// Class to controll [CRMSelectBox]
class CRMSelectBoxController {
  /// Constructor [CRMSelectBoxController]
  CRMSelectBoxController({
    List<CRMSelectBoxOption>? selected,
    this.processing = false,
    this.multiple = false,
    this.options = const [],
  }) : _selected = selected;

  /// define state of [CRMSelectBox] when using server side mode
  bool processing;

  /// define permission [CRMSelectBox] is allowed multiple choice or not
  bool multiple;

  /// define options of [CRMSelectBox]
  List<CRMSelectBoxOption> options;

  /// define selected value with private
  List<CRMSelectBoxOption>? _selected;



  /// to clear selected value of [CRMSelectBox]
  void clear() {
    if (_selected != null) _selected = null;
  }

  /// to set all options of [CRMSelectBox]
  void setOptions(List<CRMSelectBoxOption> allOptions) => options = allOptions;

  /// to add option of [CRMSelectBox]
  void addOption(CRMSelectBoxOption option) => options.add(option);

  /// to add all options of [CRMSelectBox] with array
  void addOptionAll(List<CRMSelectBoxOption> options) => options.addAll(options);

  /// to set selected value of [CRMSelectBox]
  void setSelected(CRMSelectBoxOption option) {

    _selected ??= List<CRMSelectBoxOption>.empty(growable: true);

    if (!multiple) {
      _selected = [option];
    } else if (multiple){ _selected!.add(option);}
  }

  /// to set selected multiple value of [CRMSelectBox]
  void setSelectedAll(List<CRMSelectBoxOption> options) => _selected = options;

  /// remove selected value with specific index
  void removeSelectedAt(int index) {
    if (_selected != null) {
      _selected!.removeAt(index);

      if (_selected!.isEmpty) clear();
    }
  }

  /// remove selected value
  void removeSelected(CRMSelectBoxOption option) {
    if (_selected != null) {
      int index = _selected!
          .indexWhere((element) => element.getValue() == option.getValue());
      if (index != -1) _selected!.removeAt(index);

      if (_selected!.isEmpty) clear();
    }
  }

  /// get first selected value, this function used when [CRMSelectBox] not allowed multiple
  CRMSelectBoxOption? getSelected() =>_selected?.first;

  /// get all selected value, this function used when [CRMSelectBox] allowd multiple
  List<CRMSelectBoxOption> getSelectedAll() => _selected != null ? _selected! : [];

  /// get selected value in string
  String getSelectedAsString() {
    if (_selected != null) {
      StringBuffer string = StringBuffer();
      for (var option in _selected!) {
        string.write('${option.getValueAsString()},');
      }

      return string.toString().isEmpty ? ''
          : string.toString().substring(0, string.toString().length - 1);
    }

    return '';
  }
}
