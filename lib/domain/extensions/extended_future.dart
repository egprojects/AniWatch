extension ExtendedListFuture<T> on Future<List<T>> {
  Future<T> operator [](int index) {
    return then((list) => list[index]);
  }
}
