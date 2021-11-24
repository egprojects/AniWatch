class Rating {
  const Rating._(this._value);

  static const g = Rating._('g');
  static const pg = Rating._('pg');
  static const pg13 = Rating._('pg_13');
  static const r = Rating._('r');
  static const nc17 = Rating._('nc_17');

  final String _value;

  @override
  String toString() {
    return _value;
  }
}
