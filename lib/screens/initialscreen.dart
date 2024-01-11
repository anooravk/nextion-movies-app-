import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextion/Utils/images.dart';
import 'package:nextion/screens/detailscreen.dart';
import '../controllers/moviescontroller.dart';
import '../models/moviesmodel.dart';
import '../utils/colors.dart';
import '../utils/commonwidgets.dart';
import '../utils/fontfamily.dart';
import 'favscreen.dart';

class InitialScreen extends StatelessWidget {
  InitialScreen({Key? key}) : super(key: key);
  final searchController = TextEditingController();
  CarouselController buttonCarouselController = CarouselController();
  final videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorResources.black,
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorResources.red,
          onPressed: () {
            Get.to(FavoriteMoviesScreen());
          },
          child: const Icon(
            Icons.favorite_border,
            color: ColorResources.white,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
                child: textField("Discover your favourite movies",
                    controller: searchController, image: AppImages.search),
              ),
              const SizedBox(
                height: 30,
              ),
              boldText(
                  "Lights, Camera, App-tion! Your blockbuster guide to movies on the go.",
                  ColorResources.red,
                  16.0,
                  TextAlign.center),
              const SizedBox(
                height: 10,
              ),
              lightText(
                  "Indulge in an extended cinematic experience with our app - a seamless journey where every click elongates your access to a world of movies. Discover, click, and enjoy your favorite films on the go, wherever and whenever you desire!",
                  ColorResources.red,
                  12.0,
                  TextAlign.center),
              const SizedBox(
                height: 30,
              ),
              Obx(
                () {
                  return CarouselSlider.builder(
                    itemCount: videoController.videoList?.movies?.length ?? 0,
                    itemBuilder:
                        (BuildContext context, int index, int pageViewIndex) {
                      if (videoController.videoList?.movies == null ||
                          videoController.videoList!.movies!.isEmpty) {
                        return const Center(
                            child: CircularProgressIndicator(
                          color: ColorResources.white,
                        ));
                      }
                      Movie movie = videoController.videoList!.movies![index];

                      return InkWell(
                        onTap: (){
                          Get.to(MovieDetailScreen(movie: movie,));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: Get.width/1.4,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(movie.posterPath!),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorResources.black.withOpacity(0.5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    boldText(
                                      movie.title ?? "",
                                      ColorResources.white,
                                      16.0,
                                      TextAlign.center,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      movie.overview ?? "",
                                      textAlign: TextAlign.center,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: TextFontFamily.poppinsLight,
                                        fontSize: 12.0,
                                        color: ColorResources.white,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    lightText(
                                        'Genre: ${movie.genres!.join(", ")}',
                                        ColorResources.white,
                                        12.0,
                                        TextAlign.center),
                                    const SizedBox(height: 60),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: mediumText(
                                        'Release Date: ${movie.releaseDate.toString().split(' ').first}',
                                        ColorResources.white,
                                        12.0,
                                      ),
                                    ),
                                    const SizedBox(height: 40),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: CircleAvatar(
                                        backgroundColor:
                                        ColorResources.white.withOpacity(0.5),
                                        child: const Icon(
                                          Icons.play_arrow_rounded,
                                          color: ColorResources.white,
                                          size: 35,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    carouselController: buttonCarouselController,
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {},
                      height: Get.height * 0.48,
                      initialPage: 1,
                      enableInfiniteScroll: false,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: false,
                      scrollDirection: Axis.horizontal,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
