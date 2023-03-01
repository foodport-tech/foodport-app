class ApiLinks {
  static const String baseUrl =
      'ec2-54-95-225-229.ap-northeast-1.compute.amazonaws.com';

  // User sign up endpoint
  // TO UPDATE: /api/v1/user/signup/
  static const String signUp = '/api/user/create/';
  // User login endpoint
  // TO UPDATE: /api/v1/user/login/
  static const String login = '/api/user/token/';
  // User logout endpoint
  // TO UPDATE: /api/v1/user/logout/
  static const String logout = '/api/user/logout/';

  // User content post endpoint
  // TO UPDATE: /api/v1/posts/
  static const String posts = '/api/post/posts/';
}
