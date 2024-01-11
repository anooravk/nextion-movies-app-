import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextion/utils/colors.dart';

import '../controllers/favscontroller.dart';
import '../models/moviesmodel.dart';
import '../utils/commonwidgets.dart';
import '../utils/fontfamily.dart';

class FavoriteMoviesScreen extends StatelessWidget {
  final FavoriteController favoriteController = Get.find();

   FavoriteMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorResources.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width,
              height: 40,
              color: ColorResources.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: boldText("Favorites", ColorResources.white, 20.0, TextAlign.center),
                  ),
                  const SizedBox(width: 10,),
                  const Icon(
                    Icons.favorite_border,
                    color: ColorResources.white,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: favoriteController.favoriteMovies.length,
                  itemBuilder: (context, index) {
                    Movie movie = favoriteController.favoriteMovies[index];
                    return ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: ClipRect(
                        child: Image.network(
                          movie.backdropPath ?? '',
                          width: 100,
                          height: 130,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      title: Expanded(
                        child: Text(
                          movie.title ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: TextFontFamily.poppinsBold,
                            fontSize: 16.0,
                            color: ColorResources.white,
                          ),
                        ),
                      ),
                      subtitle: Expanded(
                        child: Text(
                          movie.overview ?? "",
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: TextFontFamily.poppinsRegular,
                            fontSize: 14.0,
                            color: ColorResources.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
