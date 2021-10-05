import 'package:flutter/material.dart';
import 'package:lemonstarwars/core/app_gradients.dart';
import 'package:lemonstarwars/core/core.dart';
import 'package:lemonstarwars/detail/detail_page.dart';
import 'package:lemonstarwars/shared/helpers/return_movie_image_helper.dart';
import 'package:lemonstarwars/shared/widgets/app_bar_widget.dart';
import 'package:lemonstarwars/shared/widgets/loading_widget.dart';
import 'package:lemonstarwars/shared/widgets/movie_card_widget.dart';
import 'package:share_plus/share_plus.dart';

import 'home_controller.dart';
import 'home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // var movies = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  final pageController = PageController();
  final controller = HomeController();

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        var poster = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf10EbELVFfXyWKu_C1Xrk0kAsYR6i_369rRrJlVeyMoBwLBChCuXJWQesu3iUeSfLBMQ&usqp=CAU';
        Share.share(
                "Olá, tudo bem?\nDá uma ulhada nesse poster que encontrei de Star Wars :).\n $poster", 
                subject: "Poster Star Wars",);
        break;
      case 1:
        print("_onItemTapped: $index, TODO: Menu");
        break;
      case 2:
        print("_onItemTapped: $index, TODO: Profile");
        break;
      default:
        print("_onItemTapped $index, Not implemented");
    }
  }

  @override
  void initState() {
    super.initState();
    controller.getMovies();
    controller.stateNotifier.addListener(() {
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if(controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(
          title: "Star wars",
          subtitle: "Movies",
          image: AppImages.banner,
        ),
        body: Container(
          decoration: BoxDecoration(gradient: AppGradients.linear),
          child: ListView(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            children: controller.movies!
                .map((element) => Container(
                      width: 200,
                      height: 240,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 4),
                      child: MovieCardWidget(
                          image: ReturnMovieImage(id: element.episode_id).banner,
                          title: element.title,
                          cardHeigth: 240,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => 
                                    DetailPage(movie: element),
                                ));
                          }),
                    ))
                .toList(),
          ),
        ),
        bottomNavigationBar: SafeArea(
          bottom: true,
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.share), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
            ],
            selectedItemColor: AppColors.primaryColorDark,
            unselectedItemColor: AppColors.secondaryTextColor,
            onTap: _onItemTapped,
            backgroundColor: AppColors.primaryTextColor,
            iconSize: 18,
          ),
        ));
    } else {
      // TODO:  Adicionar página de error
      return Scaffold(
        body: LoadingWidget()
      );
    }
  }
}
