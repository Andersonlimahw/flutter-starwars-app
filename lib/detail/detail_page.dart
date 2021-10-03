import 'package:flutter/material.dart';
import 'package:lemonstarwars/core/app_gradients.dart';
import 'package:lemonstarwars/core/core.dart';
import 'package:lemonstarwars/detail/widgets/movie_detail_widget.dart';
import 'package:lemonstarwars/shared/widgets/app_bar_widget.dart';
import 'package:share_plus/share_plus.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    
    void _onItemTapped(int index) {
      print("_onItemTapped $index");
      //Notes button:
      if(index == 0) {
        print("_onItemTapped $index, TODO: Share movie informations");
        Share.share(
          "Olá, olha oque eu encontrei desse filme da franquia Star Wars"+
          "\n\nTítulo oficial"+
          "\nA New Hope"+
          "\n\nDiretores"+
          "\n..."+
          "\n\nProdutores"+
          "\n..."+
          "\n\nData de lançamento"+
          "\n..."+          
          "\n\nResumo"+
          "\n...",
          subject: "Star Wars | A New Hope"
        );
      }
      if(index == 1) {
        print("_onItemTapped $index, TODO: Notes");
      }
      // Back button
      if(index == 2) {
        Navigator.pop(context);
      }
    }

    return Scaffold(
        appBar: AppBarWidget(
          title: "A New Hope",
          subtitle: "Episode: 1",
          image: AppImages.newHope,
        ),
        body: Container(
          decoration: BoxDecoration(gradient: AppGradients.linear),
          child: ListView(scrollDirection: Axis.vertical, 
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              child: MovieDetailWidget(),
            )
          ]),
        ),
        bottomNavigationBar: SafeArea(
          bottom: true,
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.share), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.arrow_back_ios), label: ""),
            ],
            selectedItemColor: AppColors.primaryColorDark,           
            unselectedItemColor: AppColors.secondaryTextColor,
            onTap: _onItemTapped,
            backgroundColor: AppColors.primaryTextColor,
            iconSize: 18,
          ),
        )
      );
  }
}
