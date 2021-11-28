class Rating {
  const Rating._(this._value);

  static const Rating g = Rating._('g');
  static const Rating pg = Rating._('pg');
  static const Rating pg13 = Rating._('pg_13');
  static const Rating r = Rating._('r');
  static const Rating nc17 = Rating._('nc_17');

  final String _value;

  @override
  String toString() {
    return _value;
  }
}
