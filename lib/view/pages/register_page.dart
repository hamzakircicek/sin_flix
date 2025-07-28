import 'package:flutter/material.dart';
import 'package:movie_app/model/register_model.dart';
import 'package:movie_app/model/user_profile_model.dart';
import 'package:movie_app/modelview/auth_services.dart';
import 'package:movie_app/theme.dart';
import 'package:movie_app/view/widgets/circular_progress_widget.dart';
import 'package:movie_app/view/widgets/rectangle_buttons.dart';
import 'package:movie_app/view/widgets/test_field_ui.dart';
import 'package:movie_app/view/widgets/text_span.dart';
import 'package:movie_app/view/widgets/ui_helpers.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController eMail = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController passwordTwo = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isRegisterLoading = false;
  bool _submit() {
    return _formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              spacing: 5,
              children: [
                Text('Hoşgeldiniz', style: boldTextStyle),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                    top: 5,
                    bottom: 30,
                  ),
                  child: Text(
                    'Favori filmlerin bir tık uzağında. İzle, keşfet, kaydet!',
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
                    hintText: 'Ad Soyad',
                    controller: userName,
                    prefixAsset: 'assets/Add-User.png',
                    validator: (x) {
                      if (x == null || x.isEmpty) {
                        return 'Ad Soyad Zorunludur';
                      }
                      return null;
                    },
                  ),
                  TextFieldUi(
                    type: TextInputType.emailAddress,
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
                  TextFieldUi(
                    hintText: 'Şifre Tekrar',
                    controller: passwordTwo,
                    isPassworKeyboard: true,
                    prefixAsset: 'assets/Unlock.png',
                    validator: (x) {
                      if (x == null || x.isEmpty) {
                        return 'Şifre Alanı Boş Geçilemez';
                      } else if (x != password.text) {
                        return 'Şifreler Aynı Olmalı';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 30,
              children: [
                TextSpanWidget(
                  alignment: TextAlign.start,
                  text: 'Kullanıcı sözleşmesini ',
                  clickableText: 'okudum ve kabul ediyorum. ',
                  continueText: 'Bu sözleşmeyi okuyarak devam ediniz lütfen.',
                  underline: true,
                  function: () {},
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_submit()) {
                        setState(() {
                          isRegisterLoading = !isRegisterLoading;
                        });
                        RegisterModel registerModel = RegisterModel(
                          eMail: eMail.text,
                          name: userName.text,
                          password: password.text,
                        );

                        UserModel? user = await AuthServices.registerNow(
                          registerModel,
                        );
                        if (user != null) {
                          UiHelpers.ShowSnackBar(
                            color: Color.fromARGB(255, 27, 134, 25),
                            context: context,
                            label: 'Kayıt Başarılı Giriş Yapablirsin.',
                          );
                          Navigator.pop(context);
                        } else {
                          UiHelpers.ShowSnackBar(
                            color: Color(0xFFe50914),
                            context: context,
                            label: 'Kayıt İşlemi Başarısız.',
                          );
                        }
                        setState(() {
                          isRegisterLoading = !isRegisterLoading;
                        });
                      }
                    },
                    child:
                        isRegisterLoading
                            ? CircularProgressWidget()
                            : Text('Şimdi Kaydol'),
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
              text: 'Zaten bir hesabın var mı?',
              clickableText: '  Giriş Yap!',

              underline: false,
              function: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
