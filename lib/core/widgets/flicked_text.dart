import 'package:flutter/material.dart';

class BlinkText extends StatefulWidget {
  /// Creates a [BlinkText] widget
  const BlinkText(this.data,
      {Key? key,
      this.style,
      this.strutStyle,
      this.textAlign,
      this.textDirection,
      this.locale,
      this.softWrap,
      this.overflow,
      this.textScaleFactor,
      this.maxLines,
      this.beginColor,
      this.endColor,
      this.duration,
      this.times})
      : super(key: key);

  /// The text to display.
  final String data;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final Duration? duration;
  final int? times;
  final Color? beginColor;
  final Color? endColor;

  @override
  BlinkTextState createState() => BlinkTextState();
}

class BlinkTextState extends State<BlinkText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  int _counter = 0;
  Duration? duration = Duration(milliseconds: 400);
  Color? beginColor = Colors.black;

  @override
  void initState() {
    super.initState();
    //default duration
    if (widget.duration != null) {
      duration = widget.duration;
    }

    //default beginColor
    if (widget.beginColor != null) {
      beginColor = widget.beginColor;
    } else {
      if (widget.style != null && widget.style!.inherit) {
        beginColor = widget.style!.color;
      }
    }

    final endColor = widget.endColor ?? Colors.transparent;
    final times = widget.times ?? 0;

    _controller = AnimationController(vsync: this, duration: duration);
    _colorAnimation = ColorTween(begin: beginColor, end: endColor)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _counter++;
        _controller.reverse();
        if (_counter >= times && times > 0) {
          _endTween();
        }
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
      setState(() {});
    });

    _controller.forward();
  }

  _endTween() {
    Future.delayed(duration!, () {
      _controller.stop();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildWidget(TextStyle style) {
    return Text(
      widget.data,
      style: style.copyWith(color: _colorAnimation.value),
      strutStyle: widget.strutStyle,
      textAlign: widget.textAlign,
      textDirection: widget.textDirection,
      locale: widget.locale,
      softWrap: widget.softWrap,
      overflow: widget.overflow,
      textScaleFactor: 1,
      maxLines: widget.maxLines,
    );
  }

  @override
  Widget build(BuildContext context) {
    var defaultTextStyle = DefaultTextStyle.of(context);
    var style = defaultTextStyle.style;

    if (widget.style != null) {
      style = defaultTextStyle.style.merge(widget.style!);
    }
    if (MediaQuery.boldTextOverride(context)) style = style.merge(const TextStyle(fontWeight: FontWeight.bold));

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return _buildWidget(style);
      },
    );
  }
}
