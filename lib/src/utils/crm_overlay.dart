import 'package:flutter/material.dart';

/// Class to handle all overlay of [CRMSelectBox]
class CRMSelectBoxOverlay {
  /// define overlay entry of [CRMSelectBox]
  static List<CRMSelectBoxOverlayEntry> overlays = [];

  /// add overlay entry when selectbox opened
  static CRMSelectBoxOverlayEntry add(OverlayEntry overlayEntry, VoidCallback close) {
    CRMSelectBoxOverlayEntry bsOverlayEntry = CRMSelectBoxOverlayEntry(overlays.length, close, overlayEntry);
    overlays.add(bsOverlayEntry);

    return bsOverlayEntry;
  }

  /// get spesific data overlay
  static CRMSelectBoxOverlayEntry get(int index) {
    return overlays[index];
  }

  /// remove all opened overlay in context
  static void removeAll() {
    overlays.map((overlay) {
      overlay.overlayEntry.remove();
      overlay.close();
    }).toList();
    overlays.clear();
  }
}

/// Class overlay entry of [CRMSelectBox]
class CRMSelectBoxOverlayEntry {
  /// Constructor [CRMSelectBoxOverlayEntry]
  const CRMSelectBoxOverlayEntry(this.index, VoidCallback close, this.overlayEntry)
      : _close = close;

  /// index position of overlay entry
  final int index;

  final VoidCallback _close;

  /// overlay entry of context
  final OverlayEntry overlayEntry;

  /// Close callback
  void close() => _close();
}
