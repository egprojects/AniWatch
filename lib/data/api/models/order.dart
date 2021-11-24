class Order {
  const Order._(this._value);

  final String _value;

  static const id = Order._('id');
  static const ranked = Order._('ranked');
  static const kind = Order._('kind');
  static const popularity = Order._('popularity');
  static const name = Order._('name');
  static const airedOn = Order._('aired_on');
  static const episodes = Order._('episodes');
  static const status = Order._('status');
  static const random = Order._('random');

  @override
  String toString() {
    return _value;
  }
}
