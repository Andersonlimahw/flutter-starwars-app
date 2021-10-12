import 'package:flutter/material.dart';
import 'package:lemonstarwars/core/app_gradients.dart';
import 'package:lemonstarwars/core/core.dart';
import 'package:lemonstarwars/favorites/favorites_page.dart';
import 'package:lemonstarwars/home/home_page.dart';
import 'package:lemonstarwars/profile/profile_page.dart';

class MenuWidget extends StatefulWidget {
  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget>
    with SingleTickerProviderStateMixin {
  static const _menuTitles = [
    'Movies',
    'Profile',
    'Favorites',
    'Notes',
  ];

  static const _initialDelayTime = Duration(milliseconds: 50);
  static const _itemSlideTime = Duration(milliseconds: 250);
  static const _staggerTime = Duration(milliseconds: 50);
  static const _buttonDelayTime = Duration(milliseconds: 150);
  static const _buttonTime = Duration(milliseconds: 500);
  final _animationDuration = _initialDelayTime +
      (_staggerTime * _menuTitles.length) +
      _buttonDelayTime +
      _buttonTime;

  late AnimationController _staggeredController;
  final List<Interval> _itemSlideIntervals = [];

  @override
  void initState() {
    super.initState();

    _createAnimationIntervals();

    _staggeredController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..forward();
  }

  void _createAnimationIntervals() {
    for (var i = 0; i < _menuTitles.length; ++i) {
      final startTime = _initialDelayTime + (_staggerTime * i);
      final endTime = startTime + _itemSlideTime;
      _itemSlideIntervals.add(
        Interval(
          startTime.inMilliseconds / _animationDuration.inMilliseconds,
          endTime.inMilliseconds / _animationDuration.inMilliseconds,
        ),
      );
    }
  }

  @override
  void dispose() {
    _staggeredController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppGradients.linear),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          ..._buildListItems(context),
        ],
      ),
    );
  }

  _navagateToPage({required String title}) {
    print("MenuItem:_navagateToPage() path ${title}");
    switch (title) {
      case "Movies":
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      break;
      case "Profile":
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfilePage(),
            ));
      break;
      case "Favorites":
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavoritesPage(),
            ));
      break;
      default:
        print("MenuItem:_navagateToPage() path ${title}. Not implemented");
    }
  }

  List<Widget> _buildListItems(BuildContext context) {
    final listItems = <Widget>[];
    for (var i = 0; i < _menuTitles.length; ++i) {
      listItems.add(
        AnimatedBuilder(
          animation: _staggeredController,
          builder: (context, child) {
            final animationPercent = Curves.easeOut.transform(
              _itemSlideIntervals[i].transform(_staggeredController.value),
            );
            final opacity = animationPercent;
            final slideDistance = (1.0 - animationPercent) * 150;

            return Opacity(
              opacity: opacity,
              child: Transform.translate(
                offset: Offset(slideDistance, 0),
                child: child,
              ),
            );
          },
          child: GestureDetector(
            onTap: () {
              _navagateToPage(title: _menuTitles[i]);
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 36.0, vertical: 16),
              child: Text(
                _menuTitles[i],
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondaryTextColor),
              ),
            ),
          ),
        ),
      );
    }
    return listItems;
  }
}
