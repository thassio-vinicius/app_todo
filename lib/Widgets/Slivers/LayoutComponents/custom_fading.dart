import 'package:flutter/material.dart';

class CustomFading extends StatefulWidget {
  final ScrollController scrollController;
  final double zeroOpacityOffset;
  final double fullOpacityOffset;
  final Widget child;

  CustomFading(
      {Key key,
      @required this.scrollController,
      @required this.child,
      this.zeroOpacityOffset = 0,
      this.fullOpacityOffset = 0});

  @override
  _CustomFadingState createState() => _CustomFadingState();
}

class _CustomFadingState extends State<CustomFading> {
  double _offset;

  @override
  initState() {
    super.initState();
    _offset = widget.scrollController.offset;
    widget.scrollController.addListener(_setOffset);
  }

  @override
  dispose() {
    widget.scrollController.removeListener(_setOffset);
    super.dispose();
  }

  void _setOffset() {
    setState(() {
      _offset = widget.scrollController.offset;
    });
  }

  double _calculateOpacity() {
    if (widget.fullOpacityOffset == widget.zeroOpacityOffset)
      return 1;
    else if (widget.fullOpacityOffset > widget.zeroOpacityOffset) {
      // fading in
      if (_offset <= widget.zeroOpacityOffset)
        return 1;
      else if (_offset >= widget.fullOpacityOffset)
        return 0;
      else
        return (_offset - widget.zeroOpacityOffset) /
            (widget.fullOpacityOffset - widget.zeroOpacityOffset);
    } else {
      // fading out
      if (_offset <= widget.fullOpacityOffset)
        return 0;
      else if (_offset >= widget.zeroOpacityOffset)
        return 1;
      else
        return (_offset - widget.fullOpacityOffset) /
            (widget.zeroOpacityOffset - widget.fullOpacityOffset);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _calculateOpacity(),
      child: widget.child,
      duration: Duration(milliseconds: 200),
    );
  }
}
