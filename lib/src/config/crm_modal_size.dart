
import 'package:crm_utils/src/crm_flutter_utils.dart';

/// Class to set size of [CRMModal] base on breakpint
class CRMModalSize {
  /// define width of small modal
  static const double widthSm = 300.0;

  /// define width of medium modal
  static const double widthMd = 500.0;

  /// define width of large modal
  static const double widthLg = 800.0;

  /// define width of extra large modal
  static const double widthXl = 1140.0;

  /// define width of extra extra large modal
  static const double widthXxl = 1350.0;

  /// Constructor [CRMModalSize]
  const CRMModalSize({
    required this.breakPoints,
    required this.width,
  });

  /// define breakPoints for modal size
  final List<String> breakPoints;

  /// define with of modal
  final double width;

  /// define modal size small
  static const CRMModalSize sm = CRMModalSize(
    width: widthSm,
    breakPoints: [
      BreakPoint.stateSm,
      BreakPoint.stateMd,
      BreakPoint.stateLg,
      BreakPoint.stateXl,
      BreakPoint.stateXxl
    ],
  );

  /// define modal size medium
  static const CRMModalSize md = CRMModalSize(
    width: widthMd,
    breakPoints: [
      BreakPoint.stateMd,
      BreakPoint.stateLg,
      BreakPoint.stateXl,
      BreakPoint.stateXxl
    ],
  );

  /// define modal size large
  static const CRMModalSize lg = CRMModalSize(
    width: widthLg,
    breakPoints: [BreakPoint.stateLg, BreakPoint.stateXl, BreakPoint.stateXxl],
  );

  /// define modal size extra large
  static const CRMModalSize xl = CRMModalSize(
    width: widthXl,
    breakPoints: [BreakPoint.stateXl, BreakPoint.stateXl, BreakPoint.stateXxl],
  );

  /// define modal size extra extra large
  static const CRMModalSize xxl = CRMModalSize(
    width: widthXxl,
    breakPoints: [BreakPoint.stateXxl],
  );
}