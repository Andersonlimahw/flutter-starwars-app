import 'package:flutter/material.dart';
import 'package:lemonstarwars/core/app_images.dart';
import 'package:lemonstarwars/profile/profile_repository.dart';
import 'package:lemonstarwars/profile/profile_state.dart';
import 'package:lemonstarwars/shared/models/user_model.dart';

class ProfileController {
  final stateNotifier = ValueNotifier<ProfileState>(ProfileState.success);
  set state(ProfileState state) => stateNotifier.value = state;
  ProfileState get state => stateNotifier.value;

  UserModel? user = UserModel(
    image: AppImages.userProfileAvatar,
    email: '...',
    name: '...',
    nickName: '...',
  );
  

  // void getUser() async {
  //   final repository = ProfileRepository();
  //   print("ProfileController.getUser(): Starts");

  //   state = ProfileState.loading;    
  //   user = await repository.getUser().then((value) => value);       
  //   state = ProfileState.success;
    
  //   print("ProfileController.getUser(): Success, user => ${user.toString()}");
  // }

  // void insertUser({required UserModel user}) async {
  //   final repository = ProfileRepository();
  //   state = ProfileState.loading;

  //   print("ProfileController.insertUser(user: ${user.toString()}): Starts");
  //   await repository.insertUser(user: user);
  //   print("ProfileController.insertUser(user: ${user.toString()}): Success");

  //   state = ProfileState.success;
  // }

  // void deleteUser() async {
  //   final repository = ProfileRepository();
  //   state = ProfileState.loading;
  //   final userResult = await repository.getUser().then((value) => value);
  //   if (userResult != null) {
  //     print(
  //         "ProfileController.deleteUser(user: ${userResult.toString()}): Starts");
  //     await repository.delete(id: userResult.id!, tableName: 'user');
  //     print(
  //         "ProfileController.deleteUser(user: ${userResult.toString()}): Success");
  //   }
  //   state = ProfileState.success;
  // }

  // void clearTable() async {
  //   final repository = ProfileRepository();
  //   state = ProfileState.loading;
  //   await repository.clearTable(tableName: 'user');
  //   print("ProfileController.clearTable(tableName: user): Success");
  //   state = ProfileState.success;
  // }
}
