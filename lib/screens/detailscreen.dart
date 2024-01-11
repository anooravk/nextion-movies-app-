import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextion/utils/commonwidgets.dart';

import '../controllers/favscontroller.dart';
import '../models/moviesmodel.dart';
import '../utils/colors.dart';
import '../utils/fontfamily.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  MovieDetailScreen({super.key, required this.movie});

  final FavoriteController favoriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorResources.black,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: Get.width,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(movie.backdropPath!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: Get.height / 11,
                    right: Get.width / 3,
                    left: Get.width / 3,
                    child: CircleAvatar(
                      backgroundColor: ColorResources.white.withOpacity(0.5),
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        color: ColorResources.white,
                        size: 35,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: ColorResources.white,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
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
                    const SizedBox(
                      width: 10,
                    ),
                    Obx(
                      () => InkWell(
                        onTap: () {
                          favoriteController.toggleFavorite(movie);
                        },
                        child: Icon(
                         !favoriteController.isMovieFavorite(movie)
                              ? Icons.favorite_border
                              : Icons.favorite,
                          color: ColorResources.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (String genre in movie.genres ?? [])
                      Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: ColorResources.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: lightText(
                          genre,
                          ColorResources.white,
                          12.0,
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    boldText('Description', ColorResources.white, 16.0),
                    lightText(movie.overview ?? 'No description available.',
                        ColorResources.white, 14.0),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: lightText(
                  'Release Date: ${movie.releaseDate?.toString().split(' ').first ?? ""}',
                  ColorResources.white,
                  14.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
