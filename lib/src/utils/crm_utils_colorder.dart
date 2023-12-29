/// Will sort [CRMRow] children with spesific condition [ColOrder]
/// If you want to reorder some [CRMCol] to first position in small device
/// Example:
/// - ColOrder(sm: 1)
class ColOrder {
  const ColOrder({
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  /// Extra Small screen under 576 px
  final int? xs;

  /// Small screen upper 576 px
  final int? sm;

  /// Medium screen upper 768 px
  final int? md;

  /// Large screen upper 960 px
  final int? lg;

  /// Extra Large screen upper 1140 px
  final int? xl;

  /// Extra Extra Large screen upper 1400 px
  final int? xxl;
}