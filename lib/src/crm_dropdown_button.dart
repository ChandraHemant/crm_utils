import 'package:crm_utils/crm_utils.dart';
import 'package:crm_utils/src/widgets/crm_dropdown_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CRMDropdownButton extends StatefulWidget {
  const CRMDropdownButton({
    Key? key,
    required this.toggleMenu,
    required this.dropdownMenu,
    this.dropdownDirection = CRMDropdownDirection.vertical,
    this.focusNode,
    this.disabled = false,
    this.margin,
    this.dropdownMenuStyle = const CRMDropdownMenuStyle(),
    this.dropdownMenuSize = const CRMDropdownMenuSize(),
  }) : super(key: key);

  final FocusNode? focusNode;

  final bool disabled;

  final EdgeInsets? margin;

  final Widget Function(CRMDropdownButtonState _) toggleMenu;

  final CRMDropdownMenu dropdownMenu;

  final CRMDropdownDirection dropdownDirection;

  final CRMDropdownMenuStyle dropdownMenuStyle;

  final CRMDropdownMenuSize dropdownMenuSize;

  @override
  State<StatefulWidget> createState() {
    return CRMDropdownButtonState();
  }
}

class CRMDropdownButtonState extends State<CRMDropdownButton> {
  final GlobalKey<State> _key = GlobalKey<State>();

  bool isOpen = false;

  late FocusNode _focusNode;
  late LayerLink _layerLink;

  @override
  void initState() {
    _focusNode = widget.focusNode == null ? FocusNode() : widget.focusNode!;
    _focusNode.addListener(_onFocus);

    _layerLink = LayerLink();

    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocus() {
    if (_focusNode.hasFocus && !widget.disabled) {
      open();
    } else if (!_focusNode.hasFocus){ close();}
  }

  void _onKeyPressed(RawKeyEvent event) {
    if (event.logicalKey == LogicalKeyboardKey.escape) close();
  }

  void updateState(Function function) {
    if (mounted) {
      setState(() {
        function();
      });
    }
  }

  void toggle() {
    if (isOpen) {
      close();
    } else {
      _focusNode.requestFocus();
    }
  }

  void open() {
    OverlayDropdownButton.removeAll();

    CRMOverlayEntry overlayEntry = OverlayDropdownButton.add(
        OverlayEntry(
            builder: (context) => CRMDropdownWrapper(
                  containerKey: _key,
                  containerMargin:
                      widget.margin != null ? widget.margin! : EdgeInsets.zero,
                  layerLink: _layerLink,
                  dropdownMenu: widget.dropdownMenu,
                  dropdownDirection: widget.dropdownDirection,
                  dropdownMenuStyle: widget.dropdownMenuStyle,
                  dropdownMenuSize: widget.dropdownMenuSize,
                )),
        () => updateState(() {
              isOpen = false;
              _focusNode.unfocus();
            }));

    Overlay.of(context).insert(overlayEntry.overlayEntry);

    updateState(() => isOpen = true);
  }

  void close() {
    OverlayDropdownButton.removeAll();

    _focusNode.unfocus();
    updateState(() => isOpen = false);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        if(isOpen) {
          close();
        }
        return;
      },
      child: CompositedTransformTarget(
        link: _layerLink,
        child: RawKeyboardListener(
          focusNode: _focusNode,
          onKey: _onKeyPressed,
          child: Container(
            margin: widget.margin,
            child: Container(
              key: _key,
              child: widget.toggleMenu(this),
            ),
          ),
        ),
      ),
    );
  }
}
