import '../widgets.dart';

class ChildedBuilder extends StatelessWidget {
  const ChildedBuilder({
    Key? key,
    required this.child,
    required this.builder,
  }) : super(key: key);

  final Widget child;
  final Widget Function(BuildContext context, Widget child) builder;

  @override
  Widget build(BuildContext context) {
    return builder(context, child);
  }
}
