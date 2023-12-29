import 'package:crm_utils/crm_utils.dart';
import 'package:flutter/material.dart';

/// define function for renderText options
typedef CRMRenderText = Widget Function(dynamic data);

/// define function for set value of option
typedef CRMSetOptionValue = dynamic Function(dynamic data);

/// define function fo serverSide mode
typedef CRMSelectBoxServerSide = Future<CRMSelectBoxResponse> Function(
    Map<String, String> params);

/// class response to handle serverside response
class CRMSelectBoxResponse {
  /// Constructor [CRMSelectBoxResponse]
  const CRMSelectBoxResponse({
    this.options = const [],
  });

  /// define result options from api response
  final List<CRMSelectBoxOption> options;

  /// handle response from api with default setting
  ///
  /// In default setting this function will put value index for value option, and text index for text option from response data
  factory CRMSelectBoxResponse.createFromJson(List map, {CRMSetOptionValue? value, CRMRenderText? renderText, CRMSetOptionValue? other}) {
    return CRMSelectBoxResponse(
      options: map.map((e) {
        return CRMSelectBoxOption(
          value: value == null ? e['value'] : value(e),
          text: renderText == null ? Text(e['text']) : renderText(e),
          other: other == null ? e : other(e),
        );
    }).toList());
  }
}
