import 'package:crm_utils/crm_utils.dart';
import 'package:flutter/material.dart';

/// Class to handle all overlay of [CRMDropdownMenu]
class OverlayDropdownButton {
  /// define overlay entry of [CRMDropdownMenu]
  static List<CRMOverlayEntry> overlays = [];

  /// add overlay entry when selectbox opened
  static CRMOverlayEntry add(OverlayEntry overlayEntry, VoidCallback close) {
    CRMOverlayEntry bsOverlayEntry =
        CRMOverlayEntry(overlays.length, close, overlayEntry);
    overlays.add(bsOverlayEntry);

    return bsOverlayEntry;
  }

  /// get spesific data overlay
  static CRMOverlayEntry get(int index) {
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

/// Class overlay entry of [CRMDropdownMenu]
class CRMOverlayEntry {
  /// Constructor [CRMOverlayEntry]
  const CRMOverlayEntry(this.index, VoidCallback close, this.overlayEntry)
      : _close = close;

  /// index position of overlay entry
  final int index;

  final VoidCallback _close;

  /// overlay entry of context
  final OverlayEntry overlayEntry;

  /// Close callback
  void close() => _close();
}
