import 'package:lemonstarwars/core/app_images.dart';

class ReturnMovieImage {  
  String banner = AppImages.newHope;
  String path = "assets/images/movies";

  ReturnMovieImage({ required int id }) {
    if(id >= 1) {
      banner = "$path/$id.jpg";
    } else {
      banner = AppImages.newHope;   
    }
  } 
}