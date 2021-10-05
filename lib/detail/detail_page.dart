import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'package:lemonstarwars/core/app_gradients.dart';
import 'package:lemonstarwars/core/core.dart';
import 'package:lemonstarwars/detail/widgets/movie_detail_widget.dart';
import 'package:lemonstarwars/shared/helpers/return_movie_image_helper.dart';
import 'package:lemonstarwars/shared/models/movie_model.dart';
import 'package:lemonstarwars/shared/widgets/app_bar_widget.dart';

class DetailPage extends StatefulWidget {
  final MovieModel movie;
  const DetailPage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {  
    print("DetailPage.movie => ${widget.movie.title}");
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      switch (index) {
        case 0:
          Share.share(
                  "Olá, tudo bem?"+
                  "\nOlha oque eu encontrei desse filme da franquia Star Wars" +
                  "\n\nTítulo oficial" +
                  "\n${widget.movie.title}" +
                  "\n\nDiretores" +
                  "\n${widget.movie.director}" +
                  "\n\nProdutores" +
                  "\n${widget.movie.producer}" +
                  "\n\nData de lançamento" +
                  "\n${widget.movie.release_date}" +
                  "\n\nResumo" +
                  "\n${widget.movie.opening_crawl}",
              subject: "Star Wars | ${widget.movie.title}");
          break;
        case 1:
          print("_onItemTapped $index, TODO: Menu");
          break;
        case 2:
          Navigator.pop(context);
          break;
        default:
          print("_onItemTapped $index, Not implemented");
      }
    }

    return Scaffold(
        appBar: AppBarWidget(          
          image: ReturnMovieImage(id: widget.movie.episode_id).banner,
        ),
        body: Container(
          decoration: BoxDecoration(gradient: AppGradients.linear),
          child: ListView(scrollDirection: Axis.vertical, children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              child: MovieDetailWidget(
                movie: widget.movie,
              ),
            )
          ]),
        ),
        bottomNavigationBar: SafeArea(
          bottom: true,
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.share), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.arrow_back_ios), label: ""),
            ],
            selectedItemColor: AppColors.primaryColorDark,
            unselectedItemColor: AppColors.secondaryTextColor,
            onTap: _onItemTapped,
            backgroundColor: AppColors.primaryTextColor,
            iconSize: 18,
          ),
        ));
  }
}
