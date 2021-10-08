import 'package:flutter/material.dart';
import 'package:lemonstarwars/detail/detail_page.dart';
import 'package:lemonstarwars/favorites/favorites_state.dart';
import 'package:lemonstarwars/home/home_page.dart';
import 'package:lemonstarwars/shared/helpers/return_movie_image_helper.dart';
import 'package:lemonstarwars/shared/widgets/app_bar_widget.dart';
import 'package:lemonstarwars/shared/widgets/list_item_widget.dart';
import 'package:lemonstarwars/core/app_gradients.dart';
import 'package:lemonstarwars/core/core.dart';
import 'package:lemonstarwars/shared/widgets/loading_widget.dart';

import 'favorites_controller.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({
    Key? key,
  }) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final controller = FavoritesController();

  @override
  void initState() {
    super.initState();
    //controller.clearTable();
    controller.getFavorites();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      switch (index) {
        case 0:
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
          break;
        case 1:
          Navigator.pop(context);
          break;
        default:
          print("_onItemTapped $index, Not implemented");
      }
    }

    if (controller.state == FavoritesState.success) {
      final favorites = controller.favorites!;

      return Scaffold(
          appBar: AppBarWidget(
            image: AppImages.favoritesBanner,
            title: "Favorites",
            subtitle: "your favorites movies.",
          ),
          body: Container(
            decoration: BoxDecoration(gradient: AppGradients.linear),
            height: double.maxFinite,
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: favorites
                  .map(
                    (element) => Container(
                      height: 120,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: ListItemWidget(
                        image: ReturnMovieImage(id: element.episode_id).banner,
                        title: element.title,
                        description: "Episode: ${element.episode_id} | " +
                            "Year: ${DateTime.parse(element.release_date).year}",
                        // onTap: () {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) =>
                        //           DetailPage(movie: element),
                        //       ));
                        // }
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          bottomNavigationBar: SafeArea(
            bottom: true,
            child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.arrow_back_ios), label: ""),
              ],
              selectedItemColor: AppColors.secondaryTextColor,
              unselectedItemColor: AppColors.secondaryTextColor,
              onTap: _onItemTapped,
              backgroundColor: AppColors.primaryTextColor,
              iconSize: 18,
            ),
          ));
    } else {
      return Scaffold(body: LoadingWidget());
    }
  }
}
