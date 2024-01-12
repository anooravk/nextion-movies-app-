
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../models/moviesmodel.dart';
import '../utils/colors.dart';

class VideoController extends GetxController {
  final Rx<MoviesModel?> _videoList = Rx<MoviesModel?>(null);

  MoviesModel? get videoList => _videoList.value;

  @override
  void onInit() {
    super.onInit();
    _fetchMovies();
  }

  Future<void> _fetchMovies() async {
    try {
      final dio = Dio();
      final response = await dio.get(
        'https://movies-api14.p.rapidapi.com/movies',
        options: Options(
          headers: {
            'X-RapidAPI-Host': 'movies-api14.p.rapidapi.com',
            'X-RapidAPI-Key':
            'baf41e5371mshc97f4d28e95a407p112358jsnd26e90d153a1',
          },
        ),
      );

      if (response.statusCode == 200) {
        final MoviesModel movies = MoviesModel.fromJson(response.data);
        _videoList.value = movies;
      } else {}
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error',
        'Failed to fetch movies. Please check your internet connection.',
        backgroundColor: ColorResources.red,
        colorText: ColorResources.white,
      );
    }
  }
}
