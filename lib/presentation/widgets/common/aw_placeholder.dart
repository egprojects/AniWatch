import '../widgets.dart';

enum _AwPlaceholderType { box, text }

class AwPlaceholder extends StatelessWidget {
  const AwPlaceholder({
    Key? key,
    this.width,
    this.height,
    this.borderRadius = borderRadius24,
  })  : type = _AwPlaceholderType.box,
        textStyle = null,
        textMaxLines = null,
        super(key: key);

  const AwPlaceholder.text({
    Key? key,
    this.width,
    this.borderRadius = borderRadius24,
    this.textStyle,
    this.textMaxLines,
  })  : type = _AwPlaceholderType.text,
        height = null,
        super(key: key);

  final _AwPlaceholderType type;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? textStyle;
  final int? textMaxLines;

  @override
  Widget build(BuildContext context) {
    return type == _AwPlaceholderType.box
        ? _buildLinePlaceholder(context)
        : _buildTextPlaceholder(context);
  }

  Widget _buildTextPlaceholder(BuildContext context) {
    final int? linesCount =
        textMaxLines ?? DefaultTextStyle.of(context).maxLines;
    if (linesCount == null || linesCount.isInfinite) {
      throw StateError('The `textMaxLines` must be a non-null finite integer');
    }

    return linesCount < 2
        ? _buildLinePlaceholder(context)
        : _buildMultilineTextPlaceholder(
            context,
            linesCount: linesCount,
          );
  }

  Widget _buildMultilineTextPlaceholder(
    BuildContext context, {
    required int linesCount,
  }) {
    final linePlaceholder = _buildLinePlaceholder(context);
    return Column(
      children: List.generate(
        linesCount,
        (_) => linePlaceholder,
      ),
    );
  }

  Widget _buildLinePlaceholder(BuildContext context) {
    late final double? height;
    if (type == _AwPlaceholderType.box) {
      height = this.height;
    } else {
      final TextStyle textStyle =
          this.textStyle ?? DefaultTextStyle.of(context).style;
      final TextPainter textPainter = TextPainter(
        text: TextSpan(
          style: textStyle,
        ),
      );

      height = textPainter.preferredLineHeight;
    }

    return Container(
      width: width,
      height: type == _AwPlaceholderType.box ? height : height! - 4.0,
      margin: type == _AwPlaceholderType.box ? null : edgeInsetsV2,
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
        borderRadius: borderRadius,
      ),
    );
  }
}
