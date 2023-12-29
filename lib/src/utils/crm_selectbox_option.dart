import 'package:flutter/cupertino.dart';

/// Class list options of  [CRMSelectBox]
class CRMSelectBoxOption {
  /// Contruct [CRMSelectBoxOption]
  const CRMSelectBoxOption({
    required dynamic value,
    required Widget text,
    String? searchable,
    dynamic other,
  })  : _searchable = searchable,
        _value = value,
        _text = text,
        _other = other;

  /// define dynamic value of [CRMSelectBox] options
  final dynamic _value;

  /// define widget text of [CRMSelectBox] options
  final Widget _text;

  /// define other value of [CRMSelectBox]
  final dynamic _other;

  /// define string searchable when not using serverside
  final String? _searchable;

  /// searchable getter function, when [searchable] not defined, this function will returned [value]
  String get searchable =>
      _searchable ?? getValueAsString();

  /// get value of option
  dynamic getValue() => _value;

  /// get value of option in string type
  String getValueAsString() => _value.toString();

  /// get text of option
  Widget getText() => _text;

  dynamic getOtherValue() => _other;
}
