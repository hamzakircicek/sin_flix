import 'package:flutter/material.dart';
import 'package:movie_app/model/login_model.dart';
import 'package:movie_app/model/user_profile_model.dart';
import 'package:movie_app/modelview/auth_services.dart';
import 'package:movie_app/theme.dart';
import 'package:movie_app/view/widgets/circular_progress_widget.dart';
import 'package:movie_app/view/widgets/rectangle_buttons.dart';
import 'package:movie_app/view/widgets/test_field_ui.dart';
import 'package:movie_app/view/widgets/text_span.dart';
import 'package:movie_app/view/widgets/ui_helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController eMail = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLogin = false;
  bool _submit() {
    return _formKey.currentState!.validate();
  }

  SharedPreferences? pref;

  @override
  void initState() {
    _getSharedPreferences();
    super.initState();
  }

  Future _getSharedPreferences() async {
    pref = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              spacing: 5,
              children: [
                Text('Merhabalar', style: boldTextStyle),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                    top: 5,
                    bottom: 30,
                  ),
                  child: Text(
                    'Her kaydırmada yeni bir dünya, her sahnede başka bir hikaye',
                    style: thinTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Column(
                spacing: 15,
                children: [
                  TextFieldUi(
                    hintText: 'E-Posta',
                    controller: eMail,
                    prefixAsset: 'assets/Message.png',
                    validator: (x) {
                      if (x == null || x.isEmpty) {
                        return 'E-Posta Zorunludur';
                      } else if (!x.contains('@')) {
                        return 'Lütfen Doğru Formatta Giriniz.';
                      }
                      return null;
                    },
                  ),
                  TextFieldUi(
                    hintText: 'Şifre',
                    controller: password,
                    isPassworKeyboard: true,
                    prefixAsset: 'assets/Unlock.png',
                    suffixAsset: 'assets/Hide.png',
                    validator: (x) {
                      if (x == null || x.isEmpty) {
                        return 'Şifre Boş Geçilemez';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                TextButton(onPressed: () {}, child: Text('Şifremi Unuttum')),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_submit()) {
                        setState(() {
                          isLogin = !isLogin;
                        });
                        LoginModel loginModel = LoginModel(
                          eMail: eMail.text,
                          password: password.text,
                        );
                        UserModel? user = await AuthServices.login(
                          loginModel,
                          pref,
                        );
                        if (user != null) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/main_page',
                            (route) => false,
                          );
                        } else {
                          UiHelpers.ShowSnackBar(
                            color: Color(0xFFe50914),
                            context: context,
                            label:
                                'Giriş Başarısız! Lütfen Bilgilerinizi Kontrol Edin.',
                          );
                        }
                        setState(() {
                          isLogin = !isLogin;
                        });
                      }
                      //  Navigator.pushNamed(context, '/bloc_test');
                    },
                    child:
                        isLogin ? CircularProgressWidget() : Text('Giriş Yap'),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RectangleButton(
                    assetPath: 'assets/Google.png',
                    function: () {},
                  ),
                  RectangleButton(
                    assetPath: 'assets/Apple.png',
                    function: () {},
                  ),
                  RectangleButton(
                    assetPath: 'assets/Facebook.png',
                    function: () {},
                  ),
                ],
              ),
            ),

            TextSpanWidget(
              text: 'Bir hesabın yok mu?',
              clickableText: '  Kayıt Ol!',

              underline: false,
              function: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
          ],
        ),
      ),
    );
  }
}
