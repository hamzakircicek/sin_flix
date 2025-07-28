import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie_app/bloc/profie_bloc/profile_bloc.dart';
import 'package:movie_app/bloc/profie_bloc/profile_events.dart';
import 'package:movie_app/bloc/profie_bloc/profile_state.dart';
import 'package:movie_app/modelview/add_profile_photo_services.dart';
import 'package:movie_app/theme.dart';
import 'package:movie_app/view/widgets/circular_progress_widget.dart';
import 'package:movie_app/view/widgets/rectangle_buttons.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProfilePhotoPage extends StatelessWidget {
  AddProfilePhotoPage({super.key});
  File? _file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: RectangleButton(
            height: 30,
            width: 30,
            customPadding: 15,
            radious: BorderRadius.circular(35),
            assetPath: 'assets/Arrow---Left.png',
            function: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text('Profil Detayı'),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              spacing: 30,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  spacing: 10,
                  children: [
                    Text('Fotoğrafınızı Yükleyin', style: boldTextStyle),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                        top: 5,
                        bottom: 30,
                      ),
                      child: Text(
                        'Film zevkin kadar tarzını da yansıt!',
                        style: thinTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    RectangleButton(
                      height: 160,
                      width: 160,
                      radious: BorderRadius.circular(35),
                      assetPath: 'assets/Plus.png',
                      file: state is ImagePreview ? state.imageFile : null,
                      customPadding: 0,
                      function: () {
                        _openPopup(context, state);
                      },
                    ),
                  ],
                ),
                Spacer(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_file != null) {
                        context.read<ProfileBloc>().add(
                          LoadImage(imageFile: _file),
                        );
                      }

                      Navigator.pop(context);
                    },
                    child: _buttonUi(state),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _buttonUi(Object? state) {
    if (state is LoadingImage) {
      return CircularProgressWidget();
    } else {
      return Text('Devam Et');
    }
  }

  _openPopup(BuildContext context, Object? state) {
    Alert(
      style: AlertStyle(
        backgroundColor: Colors.black,
        titleStyle: TextStyle(color: Colors.white),
      ),
      context: context,
      type: AlertType.none,
      title: "Bir Fotoğraf Seç",
      desc: "",
      buttons: [
        DialogButton(
          color: Color(0xFFe50914),
          onPressed: () async {
            _file = await AddProfilePhotoServices.camera();
            if (_file != null) {
              context.read<ProfileBloc>().add(
                LoadImagePreviewEvent(imageFile: _file),
              );
            }

            Navigator.pop(context);
          },
          width: 120,
          child: Text(
            "Kamera",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        DialogButton(
          color: Color(0xFFe50914),
          onPressed: () async {
            _file = await AddProfilePhotoServices.gallery();
            if (_file != null) {
              context.read<ProfileBloc>().add(
                LoadImagePreviewEvent(imageFile: _file!),
              );
            }
            Navigator.pop(context);
          },
          width: 120,
          child: Text(
            "Galeri",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    ).show();
  }
}
