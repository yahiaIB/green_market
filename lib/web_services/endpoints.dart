class EndPoints {
  static final loginEndpoint = '/auth/local/login';
  static final verifyEndpoint = '/auth/local/verify';
  static final registerEndpoint = '/auth/local/register';
  static final areasEndpoint = '/areas';
  static regionsEndpoint(areaId) => '/areas/$areaId/regions';
  static addressesEndpoint(userId) => '/users/$userId/addresses';
  static deleteUserAddressEndpoint(userId,addressId) => '/users/$userId/addresses/$addressId';

  static final categoriesEndpoint = '/categories';
  static final productsEndpoint = '/products';
  static final createOrdersEndpoint = '/orders';
  static ordersEndpoint(userId) => '/users/$userId/orders';
  static deleteUserOrderEndpoint(userId,orderId) => '/users/$userId/orders/$orderId';
}
