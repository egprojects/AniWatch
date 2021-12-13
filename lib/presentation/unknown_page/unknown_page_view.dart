import '/domain/extensions/context_dependents.dart';
import '/presentation/widgets/widgets.dart';

class UnknownPageView extends StatelessWidget {
  const UnknownPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: _Description(),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      context.localizations.unknownPageDescription,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
