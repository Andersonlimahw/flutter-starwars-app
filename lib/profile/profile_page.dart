import 'package:flutter/material.dart';
import 'package:lemonstarwars/profile/profile_controller.dart';
import 'package:lemonstarwars/profile/profile_state.dart';
import 'package:lemonstarwars/profile/widgets/profile_app_bar_widget.dart';
import 'package:lemonstarwars/shared/widgets/list_item_widget.dart';
import 'package:lemonstarwars/core/app_gradients.dart';
import 'package:lemonstarwars/core/core.dart';
import 'package:lemonstarwars/shared/widgets/loading_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller = ProfileController();

  @override
  void initState() {
    super.initState();   
    // controller.clearTable();
    controller.getUser();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
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

    if (controller.state == ProfileState.success) {
      final user = controller.user!;

      final viewMode = Container(
            decoration: BoxDecoration(gradient: AppGradients.linear),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
            child: ListView(scrollDirection: Axis.vertical, children: [
              Container(
                  alignment: Alignment.topLeft,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
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
                      ListItemWidget(title: "Name", description: user.name),
                      ListItemWidget(title: "E-mail", description: user.email),
                      ListItemWidget(
                          title: "Nickname", description: user.nickName),
                    ],
                  ))
            ]),
          );

      return Scaffold(
          appBar: ProfileAppBarWidget(
              image: AppImages.userProfileBanner,
              title: "Hi, ${user.nickName}",
              subtitle: "Welcome back.",
              profileImage: user.image),
          body: viewMode,
          bottomNavigationBar: SafeArea(
            bottom: true,
            child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.note_add), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.local_movies), label: ""),
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
