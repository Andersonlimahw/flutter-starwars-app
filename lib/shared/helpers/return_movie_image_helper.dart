import 'package:lemonstarwars/core/app_images.dart';

class ReturnMovieImage {  
  String banner = AppImages.newHope;
  
  ReturnMovieImage({ required int id }) {
    switch (id) {
        case 1:
          banner = AppImages.newHope;          
          break;
        case 2:
          banner = AppImages.newHope;          
          break;
        default:
          banner = AppImages.newHope;          
      }
  } 
}