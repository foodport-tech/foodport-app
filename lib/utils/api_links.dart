class ApiLinks {
  static const String baseUrl =
      'ec2-54-95-225-229.ap-northeast-1.compute.amazonaws.com';

  // User sign up endpoint
  static const String signUp = '/api/v1/user/signup/';
  // User login endpoint
  static const String login = '/api/v1/user/login/';
  // User logout endpoint
  static const String logout = '/api/v1/user/logout/';

  // Users profile endpoint
  static const String users = '/api/v1/user/';

  // Users content post endpoint
  static const String posts = '/api/v1/posts/';

  // User upload image
  static const String uploadImage = 'api/v1/posts/{id}/upload-image/';
}
