class LoginModel {
  String eMail;
  String password;

  LoginModel({required this.eMail, required this.password});

  toMap(LoginModel loginModel) => {'email': eMail, 'password': password};
}
