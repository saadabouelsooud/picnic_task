class LoginInitialParams {
  LoginInitialParams();
  String _username = '';
  String _password = '';

  set userName(String username) => _username = username;
  set password(String pass) => _password = pass;

  String get userName => _username;
  String get password => _password;
}
