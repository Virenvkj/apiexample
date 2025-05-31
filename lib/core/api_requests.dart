class ApiRequests {
  ApiRequests._();

  static const String baseUrl = 'https://fakestoreapi.com/';
  static const String login = '${baseUrl}auth/login';
  static const String allProducts = '${baseUrl}products';
  static const String getCartItems = '${baseUrl}carts';
}
