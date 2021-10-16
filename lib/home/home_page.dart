import 'package:flutter/material.dart';
import 'package:lemonstarwars/core/app_gradients.dart';
import 'package:lemonstarwars/core/core.dart';
import 'package:lemonstarwars/detail/detail_page.dart';
import 'package:lemonstarwars/profile/profile_page.dart';
import 'package:lemonstarwars/shared/helpers/return_movie_image_helper.dart';
import 'package:lemonstarwars/shared/widgets/app_bar_widget.dart';
import 'package:lemonstarwars/shared/widgets/loading_widget.dart';
import 'package:lemonstarwars/shared/widgets/menu_widget.dart';
import 'package:lemonstarwars/shared/widgets/movie_card_widget.dart';
import 'package:share_plus/share_plus.dart';

import 'home_controller.dart';
import 'home_state.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/Movies';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final controller = HomeController();
  late AnimationController _drawerSlideController;

  @override
  void initState() {
    super.initState();
    controller.getMovies();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });

    _drawerSlideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _drawerSlideController.dispose();
  }

  bool _isDrawerOpen() {
    return _drawerSlideController.value == 1.0;
  }

  bool _isDrawerOpening() {
    return _drawerSlideController.status == AnimationStatus.forward;
  }

  bool _isDrawerClosed() {
    return _drawerSlideController.value == 0.0;
  }

  var menuIcon = Icon(
    Icons.menu,
    color: AppColors.secondaryTextColor,
  );

  void _toggleMenu() {
    if (_isDrawerOpen() || _isDrawerOpening()) {
      _drawerSlideController.reverse();
      menuIcon = Icon(
        Icons.menu,
        color: AppColors.secondaryTextColor,
      );
    } else {
      _drawerSlideController.forward();
      menuIcon = Icon(
        Icons.close,
        color: AppColors.secondaryTextColor,
      );
    }
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    Widget _buildDrawer() {
      return AnimatedBuilder(
        animation: _drawerSlideController,
        builder: (context, child) {
          return FractionalTranslation(
            translation: Offset(1.0 - _drawerSlideController.value, 0.0),
            child: _isDrawerClosed() ? const SizedBox() : MenuWidget(),
          );
        },
      );
    }

    void _onItemTapped(int index) {
      switch (index) {
        case 0:
          print("_onItemTapped: $index, _toggleMenu()");
          _toggleMenu();
          break;
        case 1:
          var gitHubRepo =
              'https://github.com/Andersonlimahw/flutter-starwars-app';
          Share.share(
            "Olá, tudo bem?\nQuer dar uma olhada no código fonte deste aplicativo? Clique no link abaixo:.\n\n$gitHubRepo",
            subject: "Star Wars Movies with flutter",
          );
          break;
        case 2:
          print("_onItemTapped: $index, Profile");
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ProfilePage()));
          break;
        default:
          print("_onItemTapped $index, Not implemented");
      }
    }

    if (controller.state == HomeState.success) {
      return Scaffold(
          appBar: AppBarWidget(
            title: "Star wars",
            subtitle: "Movies",
            image: AppImages.banner,
          ),
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(gradient: AppGradients.linear),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: controller.movies!
                      .map((element) => Container(
                            width: 282,
                            height: 162,
                            margin: const EdgeInsets.symmetric(
                                vertical: 72, horizontal: 8),
                            child: MovieCardWidget(
                                image: ReturnMovieImage(id: element.episode_id)
                                    .banner,
                                title: element.title,
                                cardHeigth: 162,
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
              _buildDrawer(),
            ],
          ),
          bottomNavigationBar: SafeArea(
            bottom: true,
            child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: menuIcon, label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.share), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
              ],
              selectedItemColor: AppColors.secondaryTextColor,
              unselectedItemColor: AppColors.secondaryTextColor,
              onTap: _onItemTapped,
              backgroundColor: AppColors.primaryTextColor,
              iconSize: 18,
            ),
          ));
    } else {
      // TODO:  Adicionar página de error
      return Scaffold(body: LoadingWidget());
    }
  }
}
