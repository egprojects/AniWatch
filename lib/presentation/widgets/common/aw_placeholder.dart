import '../widgets.dart';

class AwPlaceholder extends StatelessWidget {
  const AwPlaceholder({
    Key? key,
    this.width,
    this.height,
    this.borderRadius = borderRadius24,
  })  : isText = false,
        textStyle = null,
        textMaxLines = null,
        super(key: key);

  const AwPlaceholder.text({
    Key? key,
    this.width,
    this.borderRadius = borderRadius24,
    this.textStyle,
    this.textMaxLines,
  })  : isText = true,
        height = null,
        super(key: key);

  final bool isText;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? textStyle;
  final int? textMaxLines;

  @override
  Widget build(BuildContext context) {
    return isText
        ? _buildTextPlaceholder(context)
        : _buildPlaceholderLine(context);
  }

  Widget _buildTextPlaceholder(BuildContext context) {
    final int? linesCount =
        textMaxLines ?? DefaultTextStyle.of(context).maxLines;
    if (linesCount == null || linesCount.isInfinite) {
      throw StateError('The `textMaxLines` must be a non-null finite integer');
    }

    return linesCount < 2
        ? _buildPlaceholderLine(context)
        : _buildMultilineTextPlaceholder(
            context,
            linesCount: linesCount,
          );
  }

  Widget _buildMultilineTextPlaceholder(
    BuildContext context, {
    required int linesCount,
  }) {
    final linePlaceholder = _buildPlaceholderLine(context);

    return Column(
      children: List.generate(
        linesCount,
        (_) => linePlaceholder,
      ),
    );
  }

  Widget _buildPlaceholderLine(BuildContext context) {
    return _PlaceholderLine(
      isText: isText,
      width: width,
      height: height,
      borderRadius: borderRadius,
      textStyle: textStyle,
    );
  }
}

class _PlaceholderLine extends StatelessWidget {
  const _PlaceholderLine({
    required this.isText,
    this.width,
    this.height,
    this.borderRadius,
    this.textStyle,
    Key? key,
  }) : super(key: key);

  final bool isText;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    late final double? height;
    if (isText) {
      final TextStyle textStyle =
          this.textStyle ?? DefaultTextStyle.of(context).style;
      final TextPainter textPainter = TextPainter(
        text: TextSpan(
          style: textStyle,
        ),
      );

      height = textPainter.preferredLineHeight;
    } else {
      height = this.height;
    }

    Widget body = _PlaceholderBody(
      borderRadius: borderRadius,
    );

    body = isText
        ? Padding(
            padding: edgeInsetsV2,
            child: body,
          )
        : body;

    return height != null || width != null
        ? SizedBox(
            width: width ?? double.maxFinite,
            height: height ?? double.maxFinite,
            child: body,
          )
        : ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: body,
          );
  }
}

class _PlaceholderBody extends StatelessWidget {
  const _PlaceholderBody({
    Key? key,
    this.borderRadius,
  }) : super(key: key);

  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
        borderRadius: borderRadius,
      ),
    );
  }
}
