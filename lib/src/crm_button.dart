import 'package:crm_utils/crm_utils.dart';
import 'package:flutter/material.dart';

/// Widget class of button
class CRMButton extends StatefulWidget {
  /// Construct [CRMButton]
  const CRMButton({
    Key? key,
    required this.onPressed,
    this.width,
    this.margin,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.badge,
    this.onLongPressed,
    this.style = CRMButtonStyle.secondary,
    this.size = CRMButtonSize.btnMd,
    this.autofocus = false,
    this.disabled = false,
    this.focusNode,
    this.clipBehavior = Clip.none,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.center,
  }) : super(key: key);

  /// define width of [CRMButton]
  final double? width;

  /// define label of [CRMButton]
  final Widget? label;

  /// define onPressed of [CRMButton]
  final VoidCallback onPressed;

  /// define prefixIcon of [CRMButton]
  final IconData? prefixIcon;

  /// define suffixIcon of [CRMButton]
  final IconData? suffixIcon;

  /// define badge of [CRMButton]
  final Widget? badge;

  /// define onLongPressed of [CRMButton]
  final VoidCallback? onLongPressed;

  /// define style of [CRMButton]
  final CRMButtonStyle style;

  /// define size of [CRMButton]
  final CRMButtonSize? size;

  /// define margin of [CRMButton]
  final EdgeInsetsGeometry? margin;

  /// define autofocus of [CRMButton]
  final bool autofocus;

  /// define disabled of [CRMButton]
  final bool disabled;

  /// define focusNode of [CRMButton]
  final FocusNode? focusNode;

  /// define clipBehavior of [CRMButton]
  final Clip clipBehavior;

  /// define crossAxisAlignment of [CRMButton]
  final CrossAxisAlignment crossAxisAlignment;

  /// define mainAxisAlignment of [CRMButton]
  final MainAxisAlignment mainAxisAlignment;

  @override
  State<CRMButton> createState() {
    return _CRMButtonState();
  }
}

class _CRMButtonState extends State<CRMButton> {
  late Color _backgroundColor;
  late Color _color;

  late FocusNode _focusNode;

  bool _onHover = false;

  VoidCallback? get _onPressed {
    if (!widget.disabled) {
      updateState(() {
        _backgroundColor = widget.disabled
            ? widget.style.disabledBackgroundColor
            : widget.style.backgroundColor;
        _color =
            widget.disabled ? widget.style.disabledColor : widget.style.color;
      });
      return () {
        _focusNode.requestFocus();
        widget.onPressed();
      };
    }

    return null;
  }

  @override
  void initState() {
    _focusNode = widget.focusNode != null ? widget.focusNode! : FocusNode();
    _focusNode.addListener(_onFocus);

    _backgroundColor = widget.disabled
        ? widget.style.disabledBackgroundColor
        : widget.style.backgroundColor;
    _color = widget.disabled
        ? widget.style.disabledColor
        : _focusNode.hasFocus
            ? widget.style.focusColor
            : widget.style.color;
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocus() {
    updateState(() {
      _backgroundColor = widget.disabled
          ? widget.style.disabledBackgroundColor
          : widget.style.backgroundColor;
      _color = widget.disabled
          ? widget.style.disabledColor
          : _focusNode.hasFocus
              ? widget.style.focusColor
              : widget.style.color;
    });
  }

  void updateState(Function function) {
    if (mounted) {
      setState(() {
        function();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: widget.width,
          margin: widget.margin,
          decoration: BoxDecoration(
              color: _backgroundColor,
              border: Border.all(
                  color: widget.disabled &&
                          widget.style.borderColor != Colors.transparent
                      ? widget.style.borderColor.withOpacity(0.5)
                      : widget.style.borderColor),
              borderRadius: widget.style.borderRadius,
              boxShadow: !_focusNode.hasFocus || widget.disabled
                  ? []
                  : [
                      BoxShadow(
                          color: _backgroundColor.withOpacity(0.3),
                          spreadRadius: 3.0,
                          blurRadius: 0.0)
                    ]),
          clipBehavior: widget.clipBehavior,
          child: Material(
            borderRadius: widget.style.borderRadius,
            color: Colors.transparent,
            child: InkWell(
              autofocus: widget.autofocus,
              focusNode: _focusNode,
              onTap: _onPressed,
              onHover: (hovered) {
                _onHover = hovered;

                if (hovered && !widget.disabled) {
                  if (widget.style.hoverBackgroundColor != null) {
                    _backgroundColor = widget.style.hoverBackgroundColor!;
                  }
                } else {
                  _backgroundColor = widget.disabled
                      ? widget.style.disabledBackgroundColor
                      : widget.style.backgroundColor;
                  _color = widget.disabled
                      ? widget.style.disabledColor
                      : _focusNode.hasFocus
                          ? widget.style.focusColor
                          : widget.style.color;
                }

                updateState(() {});
              },
              mouseCursor: widget.disabled
                  ? SystemMouseCursors.noDrop
                  : SystemMouseCursors.click,
              splashColor: _backgroundColor,
              hoverColor: Colors.black.withOpacity(0.15),
              focusColor: widget.style.focusBackgroundColor,
              borderRadius: widget.style.borderRadius,
              child: Container(
                padding: widget.size!.padding,
                decoration: BoxDecoration(
                    color: _focusNode.hasFocus
                        ? widget.style.hoverBackgroundColor
                        : Colors.transparent,
                    borderRadius: widget.style.borderRadius,
                    boxShadow: !_focusNode.hasFocus || widget.disabled
                        ? []
                        : [
                            BoxShadow(
                                color: _backgroundColor.withOpacity(0.3),
                                spreadRadius: 3.0,
                                blurRadius: 0.0)
                          ]),
                child: DefaultTextStyle(
                  style: TextStyle(
                    color: _onHover
                        ? widget.style.hoverColor
                        : _focusNode.hasFocus
                            ? widget.style.focusColor
                            : _color,
                    fontSize: widget.size!.fontSize,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: widget.crossAxisAlignment,
                    mainAxisAlignment: widget.mainAxisAlignment,
                    children: [
                      widget.prefixIcon == null
                          ? Container(width: 0)
                          : Container(
                              margin: widget.label == null
                                  ? EdgeInsets.zero
                                  : EdgeInsets.only(
                                      right: widget.size!.spaceLabelIcon),
                              child: Icon(widget.prefixIcon,
                                  size: widget.size!.iconSize, color: _color),
                            ),
                      widget.label == null
                          ? Container(width: 0)
                          : Container(child: widget.label),
                      widget.suffixIcon == null
                          ? Container(width: 0)
                          : Container(
                              margin: widget.label == null
                                  ? EdgeInsets.zero
                                  : EdgeInsets.only(
                                      left: widget.size!.spaceLabelIcon),
                              child: Icon(widget.suffixIcon,
                                  size: widget.size!.iconSize, color: _color),
                            ),
                      widget.badge == null
                          ? Container(width: 0)
                          : Container(
                              margin: EdgeInsets.only(
                                  left: widget.prefixIcon != null
                                      ? widget.size!.spaceLabelIcon
                                      : 0.0,
                                  right: widget.suffixIcon != null
                                      ? widget.size!.spaceLabelIcon
                                      : 0.0),
                              child: widget.badge),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
