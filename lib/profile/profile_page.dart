import 'package:flutter/material.dart';
import 'package:lemonstarwars/profile/widgets/profile_app_bar_widget.dart';
import 'package:lemonstarwars/shared/widgets/list_item_widget.dart';
import 'package:lemonstarwars/core/app_gradients.dart';
import 'package:lemonstarwars/core/core.dart';

class ProfilePage extends StatefulWidget {  

  const ProfilePage({
    Key? key,    
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {  
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      switch (index) {
        case 0:
         print("_onItemTapped $index, TODO: Menu");
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
        appBar: ProfileAppBarWidget(          
          image: AppImages.userProfileBanner,
          title: "Hi, Lemon",
          subtitle: "Welcome back.",
          profileImage: AppImages.userProfileAvatar
        ),
        body: Container(
          decoration: BoxDecoration(gradient: AppGradients.linear),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
          child: ListView(scrollDirection: Axis.vertical, children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Informations", 
                    style: AppTextStyles.headingSecondary,
                  ),
                  Divider(
                    color: AppColors.dividerColor,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ListItemWidget(title: "Name", description: "Lemon"),
                  ListItemWidget(title: "E-mail", description: "lemon@starwars.com"),
                  ListItemWidget(title: "Nickname", description: "Lemon"),
                ],
              )
            )
          ]),
        ),
        bottomNavigationBar: SafeArea(
          bottom: true,
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.note_add), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.local_movies), label: ""),
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
  }
}
