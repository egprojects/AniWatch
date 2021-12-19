class AppNavigationServiceError extends Error {
  AppNavigationServiceError(this.routeName);

  final String routeName;

  @override
  String toString() {
    return 'Wrong route name: $routeName';
  }
}
