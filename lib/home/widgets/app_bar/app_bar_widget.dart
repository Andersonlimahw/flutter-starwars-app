
import 'package:flutter/cupertino.dart';
import 'package:lemonstarwars/core/app_gradients.dart';
import 'package:lemonstarwars/core/app_text_styles.dart';

class AppBarWidget extends PreferredSize {
  final String user;
  
  AppBarWidget({ this.user = "" })
      : super(
            preferredSize: Size.fromHeight(250),
            child: Container(
                height: 250,
                child: Stack(
                  children: [
                    Container(
                      height: 161,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(gradient: AppGradients.linear),
                      width: double.maxFinite,                      
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich((TextSpan(
                              text: "Olá, ",
                              style: AppTextStyles.appBarTitle,
                              children: [
                                TextSpan(
                                    text: user, 
                                    style: AppTextStyles.titleBold)
                              ]))),
                          Container(
                            width: 58,
                            height: 58,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(user)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.0, 1.0),
                      child: null,
                    ) 
                  ],
                )
              )
            );
}
