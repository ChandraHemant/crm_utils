

import 'package:crm_utils/src/utils/crm_utils_col.dart';

/// Will handle screen device using which breakpoint
class ColScreen {
  const ColScreen({
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  /// Extra Small screen under 576 px
  final Col? xs;

  /// Small screen upper 576 px
  final Col? sm;

  /// Medium screen upper 768 px
  final Col? md;

  /// Large screen upper 960 px
  final Col? lg;

  /// Extra large screen upper 1140 px
  final Col? xl;

  /// Extra extra large screen upper 1400 px
  final Col? xxl;

  /// Will set width [CRMCol] in all screen device
  factory ColScreen.all(Col size) {
    return ColScreen(sm: size);
  }

  /// Will set width [CRMCol] in mobile screen including
  /// - [BreakPoint.sm] (>= 567 px)
  /// - [BreakPoint.md] (>= 768 px)
  factory ColScreen.onlyMobile(Col size) {
    return ColScreen(sm: size, md: Col.col_12);
  }

  /// Will set width [CRMCol] in tablet screen including
  /// - [BreakPoint.sm] (>= 567 px)
  /// - [BreakPoint.md] (>= 768 px)
  /// - [BreakPoint.lg] (>= 960 px)
  factory ColScreen.onlyTablet(Col size) {
    return ColScreen(md: size, lg: Col.col_12);
  }

  /// Will set width [CRMCol] in tablet screen including
  /// - [BreakPoint.sm] (>= 567 px)
  /// - [BreakPoint.md] (>= 768 px)
  /// - [BreakPoint.lg] (>= 960 px)
  /// - [BreakPoint.xl] (>= 1140 px)
  factory ColScreen.onlyDesktop(Col size) {
    return ColScreen(lg: size);
  }

  /// Will set width [CRMCol] in mobile, tablet, desktop screen including
  factory ColScreen.inDevice({Col? mobile, Col? tablet, Col? desktop}) {
    return ColScreen(sm: mobile, md: tablet, lg: desktop);
  }
}