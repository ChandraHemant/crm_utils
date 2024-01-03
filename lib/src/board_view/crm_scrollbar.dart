library crm_utils;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CRMScrollbarStyle {
  /// The hoverThickness of the CRMScrollbar thumb.
  /// default value is 12.0 pixels.
  final double hoverThickness;

  /// The thickness of the CRMScrollbar thumb.
  /// default thickness of 8.0 pixels.
  final double thickness;

  /// The radius of the CRMScrollbar thumb.
  /// default [Radius.circular] of 8.0 pixels.
  final Radius radius;

  /// The color of the CRMScrollbar thumb.
  final Color? color;

  const CRMScrollbarStyle(
      {this.radius = _kScrollbarRadius,
        this.thickness = _kScrollbarThickness,
        this.hoverThickness = _kScrollbarThicknessWithTrack,
        this.color});
}

const CRMScrollbarStyle _kScrollbarStyle = CRMScrollbarStyle();
const double _kScrollbarThickness = 8.0;
const double _kScrollbarThicknessWithTrack = 12.0;
const double _kScrollbarMargin = 2.0;
const double _kScrollbarMinLength = 48.0;
const Radius _kScrollbarRadius = Radius.circular(8.0);
const Duration _kScrollbarFadeDuration = Duration(milliseconds: 300);
const Duration _kScrollbarTimeToFade = Duration(milliseconds: 600);

/// To add a CRMScrollbar to a [ScrollView], wrap the scroll view
/// widget in a [CRMScrollbar] widget.
///
/// The color of the CRMScrollbar will change when dragged. A hover animation is
/// also triggered when used on web and desktop platforms. A CRMScrollbar track
/// can also been drawn when triggered by a hover event, which is controlled by
/// [showTrackOnHover]. The thickness of the track and CRMScrollbar thumb will
/// become larger when hovering, unless overridden by [hoverThickness].
///
/// See also:
///
///  * [RawScrollbar], a basic CRMScrollbar that fades in and out, extended
///    by this class to add more animations and behaviors.
///  * [ScrollbarTheme], which configures the CRMScrollbar's appearance.
///  * [ListView], which displays a linear, scrollable list of children.
///  * [GridView], which displays a 2 dimensional, scrollable array of children.
class CRMScrollbar extends StatefulWidget {
  /// Creates a material design CRMScrollbar that by default will connect to the
  /// closest Scrollable descendant of [child].
  ///
  /// The [child] should be a source of [ScrollNotification] notifications,
  /// typically a [Scrollable] widget.
  ///
  /// If the [controller] is null, the default behavior is to
  /// enable CRMScrollbar dragging using the [PrimaryScrollController].
  ///
  const CRMScrollbar({
    Key? key,
    required this.child,
    this.controller,
    this.style = _kScrollbarStyle,
    this.scrollbarFadeDuration,
    this.scrollbarTimeToFade,
    this.isAlwaysShown,
    this.showTrackOnHover,
    this.notificationPredicate,
  }) : super(key: key);

  /// {@macro flutter.widgets.CRMScrollbar.child}
  final Widget child;

  /// {@macro flutter.widgets.CRMScrollbar.controller}
  final ScrollController? controller;

  /// {@macro flutter.widgets.CRMScrollbar.isAlwaysShown}
  final bool? isAlwaysShown;

  /// If this property is null, then [ScrollbarThemeData.trackVisibility] of
  /// [ThemeData.scrollbarTheme] is used. If that is also null, the default value
  /// is false.
  final bool? showTrackOnHover;

  ///Style Property for CRMScrollbar
  final CRMScrollbarStyle style;

  /// {@macro flutter.widgets.CRMScrollbar.notificationPredicate}
  final ScrollNotificationPredicate? notificationPredicate;

  /// default 600ms
  final Duration? scrollbarTimeToFade;

  /// default 300ms
  final Duration? scrollbarFadeDuration;

  @override
  ScrollbarState createState() => ScrollbarState();
}

class ScrollbarState extends State<CRMScrollbar> {
  @override
  Widget build(BuildContext context) {
    return _MaterialScrollbar(
      controller: widget.controller,
      isAlwaysShown: widget.isAlwaysShown,
      showTrackOnHover: widget.showTrackOnHover,
      hoverThickness: widget.style.hoverThickness,
      thickness: widget.style.thickness,
      radius: widget.style.radius,
      color: widget.style.color,
      notificationPredicate: widget.notificationPredicate,
      child: widget.child,
    );
  }
}

class _MaterialScrollbar extends RawScrollbar {
  const _MaterialScrollbar({
    Key? key,
    required Widget child,
    ScrollController? controller,
    bool? isAlwaysShown,
    this.showTrackOnHover,
    this.hoverThickness,
    this.color,
    this.scrollbarFadeDuration,
    this.scrollbarTimeToFade,
    double? thickness,
    Radius? radius,
    ScrollNotificationPredicate? notificationPredicate,
  }) : super(
    key: key,
    child: child,
    controller: controller,
    thumbVisibility: isAlwaysShown,
    thickness: thickness,
    radius: radius,
    fadeDuration: scrollbarFadeDuration ?? _kScrollbarFadeDuration,
    timeToFade: scrollbarTimeToFade ?? _kScrollbarTimeToFade,
    pressDuration: Duration.zero,
    notificationPredicate:
    notificationPredicate ?? defaultScrollNotificationPredicate,
  );
  final Duration? scrollbarTimeToFade;
  final Duration? scrollbarFadeDuration;
  final Color? color;
  final bool? showTrackOnHover;
  final double? hoverThickness;

  @override
  _MaterialScrollbarState createState() => _MaterialScrollbarState();
}

class _MaterialScrollbarState extends RawScrollbarState<_MaterialScrollbar> {
  late AnimationController _hoverAnimationController;
  bool _dragIsActive = false;
  bool _hoverIsActive = false;
  late ColorScheme _colorScheme;
  late ScrollbarThemeData _scrollbarTheme;
  // On Android, scrollbars should match native appearance.
  late bool _useAndroidScrollbar;

  @override
  bool get showScrollbar => widget.thumbVisibility ?? false;

  bool get _showTrackOnHover => widget.showTrackOnHover ?? false;

  Set<MaterialState> get _states => <MaterialState>{
    if (_dragIsActive) MaterialState.dragged,
    if (_hoverIsActive) MaterialState.hovered,
  };

  MaterialStateProperty<Color> get _thumbColor {
    final Color onSurface = widget.color ?? _colorScheme.onSurface;
    late Color dragColor;
    late Color hoverColor;
    late Color idleColor;
    dragColor = onSurface.withOpacity(0.9);
    hoverColor = onSurface.withOpacity(0.75);
    idleColor = onSurface.withOpacity(0.5);

    return MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.dragged)) {
        return _scrollbarTheme.thumbColor?.resolve(states) ?? dragColor;
      }

      // If the track is visible, the thumb color hover animation is ignored and
      // changes immediately.
      if (states.contains(MaterialState.hovered) && _showTrackOnHover) {
        return _scrollbarTheme.thumbColor?.resolve(states) ?? hoverColor;
      }

      return Color.lerp(
        _scrollbarTheme.thumbColor?.resolve(states) ?? idleColor,
        _scrollbarTheme.thumbColor?.resolve(states) ?? hoverColor,
        _hoverAnimationController.value,
      )!;
    });
  }

  MaterialStateProperty<Color> get _trackColor {
    final Color onSurface = widget.color ?? _colorScheme.onSurface;

    return MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.hovered) && _showTrackOnHover) {
        return _scrollbarTheme.trackColor?.resolve(states) ??
            onSurface.withOpacity(0.05);
      }
      return const Color(0x00000000);
    });
  }

  MaterialStateProperty<Color> get _trackBorderColor {
    final Color onSurface = widget.color ?? _colorScheme.onSurface;

    return MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.hovered) && _showTrackOnHover) {
        return _scrollbarTheme.trackBorderColor?.resolve(states) ??
            onSurface.withOpacity(0.1);
      }
      return const Color(0x00000000);
    });
  }

  MaterialStateProperty<double> get _thickness {
    return MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.hovered) && _showTrackOnHover) {
        return widget.hoverThickness ??
            _scrollbarTheme.thickness?.resolve(states) ??
            _kScrollbarThicknessWithTrack;
      }
      // The default CRMScrollbar thickness is smaller on mobile.
      return widget.thickness ??
          _scrollbarTheme.thickness?.resolve(states) ??
          (_kScrollbarThickness / (_useAndroidScrollbar ? 2 : 1));
    });
  }

  @override
  void initState() {
    super.initState();
    _hoverAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _hoverAnimationController.addListener(() {
      updateScrollbarPainter();
    });
  }

  @override
  void didChangeDependencies() {
    final ThemeData theme = Theme.of(context);
    _colorScheme = theme.colorScheme;
    _scrollbarTheme = theme.scrollbarTheme;
    switch (theme.platform) {
      case TargetPlatform.android:
        _useAndroidScrollbar = true;
        break;
      case TargetPlatform.iOS:
      case TargetPlatform.linux:
      case TargetPlatform.fuchsia:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        _useAndroidScrollbar = false;
        break;
    }
    super.didChangeDependencies();
  }

  @override
  void updateScrollbarPainter() {
    scrollbarPainter
      ..color = _thumbColor.resolve(_states)
      ..trackColor = _trackColor.resolve(_states)
      ..trackBorderColor = _trackBorderColor.resolve(_states)
      ..textDirection = Directionality.of(context)
      ..thickness = _thickness.resolve(_states)
      ..radius = widget.radius ??
          _scrollbarTheme.radius ??
          (_useAndroidScrollbar ? null : _kScrollbarRadius)
      ..crossAxisMargin = _scrollbarTheme.crossAxisMargin ??
          (_useAndroidScrollbar ? 0.0 : _kScrollbarMargin)
      ..mainAxisMargin = _scrollbarTheme.mainAxisMargin ?? 0.0
      ..minLength = _scrollbarTheme.minThumbLength ?? _kScrollbarMinLength
      ..padding = MediaQuery.of(context).padding;
  }

  @override
  void handleThumbPressStart(Offset localPosition) {
    super.handleThumbPressStart(localPosition);
    setState(() {
      _dragIsActive = true;
    });
  }

  @override
  void handleThumbPressEnd(Offset localPosition, Velocity velocity) {
    super.handleThumbPressEnd(localPosition, velocity);
    setState(() {
      _dragIsActive = false;
    });
  }

  @override
  void handleHover(PointerHoverEvent event) {
    super.handleHover(event);
    // Check if the position of the pointer falls over the painted CRMScrollbar
    if (isPointerOverScrollbar(event.position, event.kind)) {
      // Pointer is hovering over the CRMScrollbar
      setState(() {
        _hoverIsActive = true;
      });
      _hoverAnimationController.forward();
    } else if (_hoverIsActive) {
      // Pointer was, but is no longer over painted CRMScrollbar.
      setState(() {
        _hoverIsActive = false;
      });
      _hoverAnimationController.reverse();
    }
  }

  @override
  void handleHoverExit(PointerExitEvent event) {
    super.handleHoverExit(event);
    setState(() {
      _hoverIsActive = false;
    });
    _hoverAnimationController.reverse();
  }

  @override
  void dispose() {
    _hoverAnimationController.dispose();
    super.dispose();
  }
}