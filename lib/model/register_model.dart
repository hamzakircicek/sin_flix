class RegisterModel {
  String eMail;
  String name;
  String password;

  RegisterModel({
    required this.eMail,
    required this.name,
    required this.password,
  });

  toMap(RegisterModel registerModel) => {
    'email': eMail,
    'name': name,
    'password': password,
  };
}
