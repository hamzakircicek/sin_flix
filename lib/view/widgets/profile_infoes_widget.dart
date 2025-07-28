import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/model/user_profile_model.dart';
import 'package:movie_app/theme.dart';

class ProfileInfoesWidget extends StatelessWidget {
  final Function function;
  final List<Movie> movies;
  final String photoUrl;

  const ProfileInfoesWidget({
    super.key,
    required this.function,
    required this.movies,
    required this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 30,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_profileInfo(), _farovieList()],
    );
  }

  _farovieList() {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
            child: Text(
              'Beğendiğim Filmler',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,

              itemCount: movies.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                childAspectRatio: 0.9,
              ),
              itemBuilder:
                  (context, index) => SizedBox(
                    child: Column(
                      spacing: 10,
                      children: [
                        SizedBox(
                          height: 180,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              movies[index].poster.replaceAll(
                                'http:',
                                'https:',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(movies[index].title, style: thinTextStyle),
                      ],
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }

  _profileInfo() {
    UserModel user = UserModel.instance;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 10,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.photoUrl),
              radius: 30,
              onBackgroundImageError: (exception, stackTrace) {},
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Text(
                    'ID: ${user.id}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            function();
          },
          child: Text('Fotoğraf Ekle'),
        ),
      ],
    );
  }
}
