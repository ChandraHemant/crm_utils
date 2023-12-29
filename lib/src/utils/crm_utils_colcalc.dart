import 'package:crm_utils/src/crm_flutter_utils.dart';
import 'package:crm_utils/src/utils/crm_utils_col.dart';
import 'package:crm_utils/src/utils/crm_utils_colscreen.dart';
import 'package:flutter/material.dart';

/// Will calculation width of [CRMCol] from percentage to pixel
class ColCalc {
  const ColCalc(this.context, this.sizes, this.offset);

  final BuildContext context;

  final ColScreen sizes;

  final ColScreen offset;

  /// Get width of [CRMCol]
  Col? get width {
    BreakPoint state = BreakPoint.of(context);

    if (state.state == BreakPoint.stateXxl) {
      if (sizes.xxl != null) {
        return sizes.xxl;
      } else if (sizes.xl != null) {
        return sizes.xl;
      }else if (sizes.lg != null) {
        return sizes.lg;
      }else if (sizes.md != null) {
        return sizes.md;
      }else if (sizes.sm != null) {
        return sizes.sm;
      }else if(sizes.xs != null){ return sizes.xs;}

      return Col.col_12;
    } else if (state.state == BreakPoint.stateXl) {
      if (sizes.xl != null) {
        return sizes.xl;
      } else if (sizes.lg != null) {
        return sizes.lg;
      } else if (sizes.md != null) {
        return sizes.md;
      } else if (sizes.sm != null) {
        return sizes.sm;
      }else if(sizes.xs != null){ return sizes.xs;}

      return Col.col_12;
    } else if (state.state == BreakPoint.stateLg) {
      if (sizes.lg != null) {
        return sizes.lg;
      } else if (sizes.md != null) {
        return sizes.md;
      }else if (sizes.sm != null) {
        return sizes.sm;
      }else if(sizes.xs != null){ return sizes.xs;}

      return Col.col_12;
    } else if (state.state == BreakPoint.stateMd) {
      if (sizes.md != null) {
        return sizes.md;
      } else if (sizes.sm != null) {
        return sizes.sm;
      }else if(sizes.xs != null){ return sizes.xs;}

      return Col.col_12;
    } else if (state.state == BreakPoint.stateSm) {
      if (sizes.sm != null) {
        return sizes.sm;
      } else if(sizes.xs != null) {return sizes.xs;}

      return Col.col_12;
    } else if(state.state == BreakPoint.stateXs) {
      if(sizes.xs != null) return sizes.xs;

      return Col.col_12;
    }

    return Col.col_12;
  }

  /// Get offset of [CRMCol]
  Col? get widthOffset {
    BreakPoint state = BreakPoint.of(context);

    if (state.state == BreakPoint.stateXxl) {
      if (offset.xxl != null) {
        return offset.xxl;
      } else if (offset.xl != null) {
        return offset.xl;
      }else if (offset.lg != null) {
        return offset.lg;
      }else if (offset.md != null) {
        return offset.md;
      }else if (offset.sm != null){ return offset.sm;}

      return Col.zero;
    } else if (state.state == BreakPoint.stateXl) {
      if (offset.xl != null) {
        return offset.xl;
      } else if (offset.lg != null) {
        return offset.lg;
      }else if (offset.md != null) {
        return offset.md;
      } else if (offset.sm != null){ return offset.sm;}

      return Col.zero;
    } else if (state.state == BreakPoint.stateLg) {
      if (offset.lg != null) {
        return offset.lg;
      } else if (offset.md != null) {
        return offset.md;
      }else if (offset.sm != null){ return offset.sm;}

      return Col.zero;
    } else if (state.state == BreakPoint.stateMd) {
      if (offset.md != null) {
        return offset.md;
      } else if (offset.sm != null){ return offset.sm;}

      return Col.zero;
    } else if (state.state == BreakPoint.stateSm) {
      if (offset.sm != null) return offset.sm;

      return Col.zero;
    }

    return Col.zero;
  }
}