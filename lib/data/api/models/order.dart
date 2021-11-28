class Order {
  const Order._(this._value);

  final String _value;

  static const Order id = Order._('id');
  static const Order ranked = Order._('ranked');
  static const Order kind = Order._('kind');
  static const Order popularity = Order._('popularity');
  static const Order name = Order._('name');
  static const Order airedOn = Order._('aired_on');
  static const Order episodes = Order._('episodes');
  static const Order status = Order._('status');
  static const Order random = Order._('random');

  @override
  String toString() {
    return _value;
  }
}
