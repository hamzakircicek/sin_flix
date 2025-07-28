import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/theme.dart';

class UiHelpers {
  static ShowSnackBar({
    required BuildContext context,
    required String label,
    Color color = const Color.fromARGB(255, 101, 101, 101),
    Color textColor = Colors.white,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Text(label, style: thinTextStyle),
      ),
    );
  }

  static showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.transparent,

      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.topCenter,
                radius: 1,
                colors: [
                  const Color(0xFF75090f),
                  const Color(0xFF0b0909),
                  // Dışa doğru geçiş
                ],
                stops: [0.0, 0.6], // Nerede geçiş yapılacağı
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 15,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Sınırlı Teklif!', style: boldTextStyle),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        "Jeton Paketi'ni Seçerek Bonus Kazanın Ve Yeni Bölümlerin Kilidini Açın.",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width,

                      decoration: BoxDecoration(
                        color: const Color.fromARGB(14, 255, 255, 255),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          width: 0.5,
                          color: const Color.fromARGB(69, 255, 255, 255),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            SizedBox(height: 5),
                            Text(
                              'Alacağınız Bonuslar',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _bonusWidget(
                                  assetPath: 'assets/jewellery.png',
                                  text: 'Premium Hesap',
                                ),
                                _bonusWidget(
                                  assetPath: 'assets/couple_heart.png',
                                  text: 'Daha Fazla Eşleşme',
                                ),
                                _bonusWidget(
                                  assetPath: 'assets/single_heart.png',
                                  text: 'Öne Çıkarma',
                                ),
                                _bonusWidget(
                                  assetPath: 'assets/ok.png',
                                  text: 'Daha Fazla Beğeni',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    Text(
                      'Kilidi açmak için bir jeton paketi şeçin',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _tokenWidget(
                          colorOne: Color(0xFF75090f),
                          colorTwo: Color(0xFFe60e1a),
                          oldToken: '200',
                          newToken: '300',
                          price: '₺99,99',
                          percent: '+10%',
                        ),
                        _tokenWidget(
                          colorOne: Color(0xFF5e48e1),
                          colorTwo: Color(0xFFe60e1a),

                          oldToken: '2.000',
                          newToken: '3.375',
                          price: '₺799,99',
                          percent: '+70%',
                        ),
                        _tokenWidget(
                          colorOne: Color(0xFF75090f),
                          colorTwo: Color(0xFFe60e1a),
                          oldToken: '1.000',
                          newToken: '1.350',
                          price: '₺399,99',
                          percent: '+35%',
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Tüm Jetonları Gör'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget _bonusWidget({
    required String assetPath,
    required String text,
  }) {
    return SizedBox(
      height: 130,
      width: 70,
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 60,
            padding: EdgeInsets.all(12),

            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,

                colors: [
                  const Color(0xFF75090f),
                  const Color.fromARGB(255, 209, 132, 132),
                  // Dışa doğru geçiş
                ],
                stops: [0.85, 1], // Nerede geçiş yapılacağı
              ),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Image.asset(assetPath),
          ),
          SizedBox(
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 12),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _tokenWidget({
    required String percent,
    required String oldToken,
    required String newToken,
    required String price,
    required Color colorOne,
    required Color colorTwo,
  }) {
    return SizedBox(
      height: 230,
      width: 105,

      child: Stack(
        children: [
          Positioned(
            top: 12.5,
            child: Container(
              height: 210,

              width: 105,
              padding: EdgeInsets.all(12),

              decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.white),
                gradient: RadialGradient(
                  center: Alignment.topLeft,
                  radius: 2,
                  colors: [colorOne, colorTwo],
                  stops: [0.0, 1], // Nerede geçiş yapılacağı
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                spacing: 30,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        oldToken,
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.white,

                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      Text(
                        newToken,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),

                      Text(
                        'Jeton',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Divider(height: 1, thickness: 0.3),
                      SizedBox(height: 10),
                      Text(
                        price,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Başına Haftalık',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 25,
              width: 60,

              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.topLeft,
                  radius: 5,
                  colors: [colorOne, colorTwo],
                  stops: [0.0, 1], // Nerede geçiş yapılacağı
                ),
                border: Border.all(
                  color: const Color.fromARGB(132, 255, 255, 255),
                ),

                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(child: Text(percent, style: thinTextStyle)),
            ),
          ),
        ],
      ),
    );
  }
}
